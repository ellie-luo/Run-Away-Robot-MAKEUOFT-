# Run-Away-Robot-MAKEUOFT-

The Run-Away Robot is a wanderer with collision avoidance designed to run away when a person approaches it. Designed to mimic the friend that's never avalible, everytime you start approaching it, it will drive away. Using ultrasonice sensors, it detects the distance of things in its surrounding. The MATLAB-Arduino interface fetches the ultrasonic sensor data, storing the distances every 5 degrees into an empty array, and in this way the robot temporary remembers the distances of surrounding objects. Two seconds later, it does another scan of the distances. By comparing the distances of the results between the two ultrasonic inputs, if the distance at a specific angle has decreased, the robot recognizes that an object is approaching at the angle where the difference occurs. The robot is programmed to then turn to another direction, and runs away. As it runs, the ultrasound constantly feeds the robot to navigate it away from obstacles. The robot should run for 5 seconds, then stops, and stays stationary before the next approaching object activates its motion.
![IMG_0759](https://user-images.githubusercontent.com/114962410/219963927-a462d9d5-f43d-4f26-a054-7e7921e151e0.jpg)
