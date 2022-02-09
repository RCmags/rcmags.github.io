---
layout: post
title: "Line following robot"
categories: Robots
---

This is an arduino sketch for a [line following robot](https://www.electronicshub.org/arduino-line-follower-robot/) based on infrared LED's and an H-bridge. 
The code uses a PID controller to control the wheels of the vehicle so it steers into a dark line. 
To improve the likelihood of the vehicle from sliding off the line, 
the code decreases the speed of the robot when it enters a sharp turn. 
In an effort to improve the low speed performance, 
the speed of the motors is controlled via [pulse frequency modulation](https://en.wikipedia.org/wiki/Pulse-frequency_modulation).
This allows the motors to be moved under the influence of cogging torque and stiction as the pulses act like a jackhammer.
The end result is motion similar to stepper motor as the motor moves in discrete jumps of variable length.
At higher throttle settings the motors switch over to [PWM](https://en.wikipedia.org/wiki/Pulse-width_modulation) to smoothen the motion.  

The code requires a circuit like the one shown in this schematic:  
![image](https://raw.githubusercontent.com/RCmags/LineFollowingRobot/main/line_follower_robot_schem.png)

Below are images of the vehicle this code was written for:  
![image](https://raw.githubusercontent.com/RCmags/LineFollowingRobot/main/img/bottom_view_res.jpg)
![image](https://raw.githubusercontent.com/RCmags/LineFollowingRobot/main/img/diag_view_res.jpg)
![image](https://raw.githubusercontent.com/RCmags/LineFollowingRobot/main/img/top_view_res.jpg) 

[![video](https://img.youtube.com/vi/NBQjQLE4u1M/hqdefault.jpg)](https://youtu.be/NBQjQLE4u1M) 
<p align="center">Video 1. Operation of the line following robot</p>

### Github Repo:
[LineFollowingRobot](https://github.com/RCmags/LineFollowingRobot)
