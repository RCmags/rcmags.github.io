---
layout: post
title: "Flight controller for a weight-shift controlled helicopter"
categories: Aircraft
---

Helicopters are naturally unstable aircraft. If they do not have a system that augments their stability, they will inevitably spiral into the ground. Luckily, there are a few ways to enhance their stability. A classic approach is to use a heavy bar placed at an angle relative to the rotor blades. Such a system is known as a flybar, stabilizer-bar or stabilizer gyro. For helicopters with more than two blades, the bar transforms into a star-shaped object, or even a disk. 

z

While this approach works it comes at the cost of increased rotor complexity. To avoid this problem, it's possible to use electronics to provide the required corrective inputs. This approach greatly simplifies the rotor head but it transfers the complexity to an electronic circuit. A suitable device to provide this function is a programable development board. In this case, the complexity of the electronics are abstracted way and emphasis is placed on an algorithm that can stabilize the aircraft.  

# ---- divisor ----


This Arduino sketch is a simple flight controller for a 4ch RC heli based on an [MPU6050 6-axis gyroscope/accelerometer](https://invensense.tdk.com/products/motion-tracking/6-axis/mpu-6050/). 

Stabilization about pitch and roll is accomplished via a PID loop using the Gyro as the proportional term. Stabilization about the yaw axis uses a PI loop along with a counter-torque term that increases as throttle is added. The accelerometer is is not used. Due to this, the program only improves the short-term stability of the helicopter, up to the point that human can stabilize the vehicle in the long-term.  

The program is designed to receive 4 PWM inputs from an RC receiver operating in MODE 2 and outputs 3 PWM signals. Two signals go to the cyclic servos and the third goes to a tail-servo or a speed controller. Since it is assumed only two servo motors are used for controlling the rotor, only a [90-degree swashplate](https://www.rchelicopterfun.com/ccpm.html) is supported. MODE 1 can be used with this program by swapping the RX connections at the arduino. 

The program was written for an Arduino Nano but it should be compatible with other boards. See the schematic for the tail-motor variant of the required circuit:

<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main/heli_flight_control_schem.png" width = "80%" height = "80%"> 

See these links for flight videos of a helicopter that uses this software:
  
- https://www.youtube.com/watch?v=qZ7qUPAXkvc
- https://www.youtube.com/watch?v=zrrgVdPAhFI

Finally, below are images of the helicopter this code was initially writen for:

<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main//example_pictures/front_view_res.JPG" width = "30%" height = "30%"> 
<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main//example_pictures/side_rev_view_res.JPG" width = "30%" height = "30%"> 
<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main//example_pictures/arduino_view_res.JPG" width = "30%" height = "30%"> 

<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main//example_pictures/stab_motion.gif" width = "30%" height = "30%">
<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main//example_pictures/pitch_stab.gif" width = "30%" height = "30%"> 
<img src = "https://raw.githubusercontent.com/RCmags/HeliFlightController/main//example_pictures/yaw_stab.gif" width = "30%" height = "30%">
