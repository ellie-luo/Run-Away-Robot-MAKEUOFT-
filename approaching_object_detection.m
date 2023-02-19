a = arduino(); %(specify port, board, library, servo);
myservo=servo(a,'9');
LeftMotorForward = '10';
LeftMotorBackward = '11';
RightMotorForward = '12';
RightMotorBackward = '13';
configurePin(a,LeftMotorForward,'PWM');
configurePin(a,LeftMotorBackward,'PWM');
configurePin(a,RightMotorForward,'PWM');
configurePin(a,RightMotorBackward,'PWM');

s=serialport('/dev/cu.Bluetooth-Incoming-Port',9600);
fopen(s);
pause(0.2);

not_running=True;

while not_running
    dodge_approaching_object();
end

function run_away()
speed=50;
writePWMDutyCycle(a,LeftMotorForward,speed/100);
writePWMDutyCycle(a,LeftMotorBackward,speed/100);
writePWMDutyCycle(a,RightMotorForward,speed/100);
writePWMDutyCycle(a,RightMotorBackward,speed/100);
pause(5);
writePWMDutyCycle(a,LeftMotorForward,0);
writePWMDutyCycle(a,LeftMotorBackward,0);
writePWMDutyCycle(a,RightMotorForward,0);
writePWMDutyCycle(a,RightMotorBackward,0);

end


function dodge_approaching_object()

position_1=zeros(1,36);
i=1;
for angle=0:5:180
    writePosition(myservo,angle);
    current_position=readPosition(servo_motor);
    fprintf('First Scan Position: '+ current_position);
    position_1(1,i)=current_position;
    i=i+1;
end 

i=1;
for angle=180:-5:0
    writePosition(myservo,angle);
    current_position=readPosition(servo_motor);
    fprintf('Second Scan Position: '+ current_position);
    if position_1(1,37-i)~=current_position
        if (0<current_position) && (current_position<60)
            writePosition(angle+80);
            pause(2);

        elseif (60<current_position) && (current_position<120)
            writePosition(angle-50);
            pause(2);

        else
            writePosition(angle-80);
            pause(2);
        end
        flush(s);
        fwrite(s,'run_away');
    end
position_1=zeros(1,36);
end
end




