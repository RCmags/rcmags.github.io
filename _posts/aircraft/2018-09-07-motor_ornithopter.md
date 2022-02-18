---
layout: post
title: "Ornithopter powered by a motor with a crank-shaft"
categories: Aircraft
---

# Introduction to concept
This project concerns itself with the development of an ornithopter powered by a motor driving a crank-shaft.

# Design iterations
__Iteration 1:__

![image](/img/motor_orni/crank-1.JPG)

![image](/img/motor_orni/front-vtail.JPG)

![image](/img/motor_orni/front-inverted.JPG)

[![video](https://img.youtube.com/vi/wVLkWb_JHCo/hqdefault.jpg)](https://youtu.be/wVLkWb_JHCo) 
<p align="center">Video 1. Ornithopter with inverted V-tail</p>

__Iteration 2:__
[![video](https://img.youtube.com/vi/peSMr35mHOE/hqdefault.jpg)](https://youtu.be/peSMr35mHOE) 
<p align="center">Video 2. Cambered wings and bias springs</p>

![image](/img/motor_orni/crank-2.JPG)

![image](/img/motor_orni/front-inverted-cambered.JPG)

![image](/img/motor_orni/side-2.JPG)



# Arduino Code
This is a sketch for the [glide lock](http://ovirc.free.fr/GLDAB_English.php) of a crank-driven ornithopter.
It uses the [PinChangeInterrupt](https://github.com/NicoHood/PinChangeInterrupt) library to read a PWM signal from a transmitter.  

The glide lock works by iddling the motor below a certain throttle until the crankshaft reaches a known position.
Doing so allows to wings to stop a dihedral angle that allows for efficient gliding flight.
To accomplish this the code uses a hall sensor that looks for a magnet attached to the crank. 
Once the magnet is infront of the sensor the motor turns off.

Unfortunately some ESC's respond with a delay to throttle commands.
This means that the motor will continue to spin even after the throttle is set to zero. 
In practice this means the crank will stop at the wrong position.
To work around this one can run the motor for a short time interval after the magnet passes the sensor.
If this delay is tuned correctly the crank will stop in the desired position.

There are two versions of the sketch: one that's intended for an analog hall sensor and uses polling, 
and one that's intended for a digital hall sensor and uses an external interrupt. 
Both work well although the interrupt version can recognize the magnet at higher RPM's.

This code was made to work for the following circuit:  
![image](https://raw.githubusercontent.com/RCmags/GlideLock/main/glide_lock_schem.png)

[![video](https://img.youtube.com/vi/v0z1ojpoehQ/hqdefault.jpg)](https://youtu.be/v0z1ojpoehQ) 
<p align="center">Video 3. Operation of glide-lock</p> 

__Github Repo:__ [GlideLock](https://github.com/RCmags/GlideLock)

# RCgroups build log
For more informatio on this aircraft, see these posts on RCgroups:
1. [Gearbox construction](https://www.rcgroups.com/forums/showpost.php?p=41363327&postcount=76)
2. [Adding second stage to gearbox](https://www.rcgroups.com/forums/showpost.php?p=41380437&postcount=80)
3. [Adding wings](https://www.rcgroups.com/forums/showpost.php?p=41415689&postcount=81)
4. [Completing the frame and adding the electronics](https://www.rcgroups.com/forums/showpost.php?p=41423997&postcount=82)
5. [Initial test flights](https://www.rcgroups.com/forums/showpost.php?p=41432795&postcount=85)
6. [Succesful controlled flight](https://www.rcgroups.com/forums/showpost.php?p=41439849&postcount=87)
