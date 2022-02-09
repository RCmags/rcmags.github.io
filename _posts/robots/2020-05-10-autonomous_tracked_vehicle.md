---
layout: post
title: "Tracked vehicle capable of following waypoints on a 3D surface"
categories: Robots
---

This is a large arduino sketch for a stracked vehicle capable of driving itself to different waypoints. It is composed of multiple header files and a main.ino file. The sketch requires the following libraries: 

- [imuFilter](https://github.com/RCmags/imuFilter)
- [basicMPU6050](https://github.com/RCmags/basicMPU6050)
- [ADNS3080](https://github.com/RCmags/ADNS3080)
- [Vector datatypes](https://github.com/RCmags/vector_datatype)

The position of the vehile is estimated using a physical model of the vehicle, an accelerometer that is integrated twice, a gyroscope for heading, and the displacement measured by two optical flow sensors. All of this data is fused to obtain the net displacements relative to an initial position using rectangular coordinates. These position and orientation estimates are used to guide the vehicle to a specified location using two PID loops, one for displacements and one for heading.  

The coordinates are stored in a buffer that can be filled in real time via a bluetooth module. Coordinates can be pushed or poped off the buffer. Once the vehicle is within a given radius of a coordinate, the following coodinate is made the target destination. This process will continue indefinitely and the vehicle will follow a closed path with the coordinates as the vertices. 

__Images:__
![image](https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/tank1_res.jpg)  

![image](https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/tank2_res.jpg)  

![image](https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/tank3_res.jpg)
  
__Video:__
![image](https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/inclined_plane.gif) 

[![video](https://img.youtube.com/vi/VYhLW5owS3A/hqdefault.jpg)](https://youtu.be/VYhLW5owS3A) 
<p align="center">Video 1. Operation of Autonomous robot</p>

### Github Repo:
[TrackRobot](https://github.com/RCmags/TrackRobot)

