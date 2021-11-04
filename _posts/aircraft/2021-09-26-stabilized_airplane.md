---
layout: post
title: "Tail-less airplane stabilized by an angle of attack sensor"
categories: Aircraft
---

# Passive Stability
An airplane can be designed to fly without a horizontal stabilizer. This is generally accomplished in one of two ways. 

[![video](https://img.youtube.com/vi/gadIYbNib1U/hqdefault.jpg)](https://youtu.be/vgadIYbNib1U)  

# Active Stability
This Arduino sketch is a servo controller for a tail-less airplane that is stabilized about the pitch-axis with an angle-of-attack sensor. If tuned correctly, the result is an aircraft with a greater lift-to-drag ratio than what is otherwise possible with passive stability.  

To provide this stability enhancement, the code uses the signal an analog A.O.A. sensor as the proportional term of a constant coefficien PID controller. By adjusting the appropriate coefficients, the static and dynamic stability of the aircraft can be greatly enhanced. Due to this excess stability, the center of mass of the vehicle to be moved aft which, in turn, allows for a reduction or complete elimination any reflex in the elevons. This lack of reflects increases the lift-to-drag ratio of the wing compared to a reflexed airfoil.

[![video](https://img.youtube.com/vi/6mny0neFUxE/hqdefault.jpg)](https://youtu.be/6mny0neFUxE) 
<p align="center">Slope Soaring Actively Stabilized Flying Wing</p>

[See: Albatross, Active Pitch Glider](http://www.charlesriverrc.org/articles/asfwpp/lelke_activepitch.htm)

[![video](https://img.youtube.com/vi/JfKrUbJYk74/hqdefault.jpg)](https://youtu.be/JfKrUbJYk74)  
<p align="center">Unstable Tailless Demonstrator</p>

# Design development
The simplest angle-of-attack sensor is a [simple low-friction potentiometer attached to a weathervane](https://www.ilmailu.org/forum/index.php?action=dlattach;topic=5147.0;attach=10336). As the weathervane will closely follow the local airflow, it can be used as a reference from which to measure the angle of attack. 

Finally, here is an example of the kind of aircraft this code was writen for:

![image](https://raw.githubusercontent.com/RCmags/TailLessStability/main//example_pictures/top_view_res.jpg)
![image](https://raw.githubusercontent.com/RCmags/TailLessStability/main//example_pictures/front_view_res.jpg)
![image](https://raw.githubusercontent.com/RCmags/TailLessStability/main//example_pictures/side_view_res.jpg)

# Arduino Code
The program is designed to receive 2 PWM inputs from an RC receiver and an analog signal, and outputs two PWM signals for two servos. It is assumed the aircraft is controlled with two elevons. It was written for an Arduino Nano but it should be compatible with other boards. It requires the [PinChageInterrupt](https://www.arduino.cc/reference/en/libraries/pinchangeinterrupt/) library.
  
For previous projects that inspired this work, please see these links:

Schematic of the required circuit:

![image](https://raw.githubusercontent.com/RCmags/TailLessStability/main/tail_less_circuit_schem.png)

__Github Repo:__
[TailLessStability](https://github.com/RCmags/TailLessStability)

