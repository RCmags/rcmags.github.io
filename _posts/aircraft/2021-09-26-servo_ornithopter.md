---
layout: post
title: "Ornithopter powered and controlled by servos"
categories: Aircraft
---

# Introduction
[Ornithopters](https://en.wikipedia.org/wiki/Ornithopter) are aircraft that use oscillating wings to stay aloft. Depending on the characteristics of the aircraft, an ornithopter can maintain flight at a constant velocity like a bird, or it can fly in static air like an insect. These scenarios are analogous to an airplane driven by a propeller and a helicopter at hover.

[![video](https://img.youtube.com/vi/f50K68zB4eU/hqdefault.jpg)](https://youtu.be/f50K68zB4eU)  
<p align="center">Video A. Bird in horizontal flight</p>

[![video](https://img.youtube.com/vi/2z9F6pVhR5o/hqdefault.jpg)](https://youtu.be/2z9F6pVhR5o)  
<p align="center">Video B. Insect at hover</p>

There are a few advantages to ornithopters. In horizontal flight, the wings of an ornithopter can sweep over a much larger area compared to a propeller. According to [actuator disk theory](https://web.mit.edu/16.unified/www/FALL/thermodynamics/notes/node86.html), this increase in the area can increase the propulsive efficiency of the aircraft. Likewise, oscillating wings do not suffer from [dissymetry of lift](https://www.copters.com/aero/lift_dissymetry.html) and [gyroscopic precession](http://www.cleonis.nl/physics/phys256/gyroscope_physics.php) like a rotary-wing. The absence of these forces can enhance the natural stability of an ornithopter compared to a helicopter.

# Design Concept
This project concerns itself with developing a radio-controlled ornithopter powered and controlled by two servos. Each servo is connected to a wing and flapped independently. This allows the motion of the wings to be controlled through software rather than through a specially designed mechanism. There are many advantages to this approach, mainly that it is very easy to adjust the amplitude of the flapping motion, and the wings may be oscillated asymmetrically to achieve directional control. 

![image](https://www.researchgate.net/profile/Yanghai-Nan/publication/280948641/figure/fig1/AS:614244433289216@1523458693052/Control-via-flapping-amplitude-offset-modulation.png)  

# Aircraft Iterations

__Iteration 1:__  
The first version was a test platform to observe how effectively servos could oscillate a long spar. It also served to test springs connected to the servos in series or parallel. These springs can [reduce the power drawn by an oscillating mass](https://www.rcgroups.com/forums/showpost.php?p=41117281&postcount=20) driven by a motor if tuned correctly. For this designa a coil spring was connected in series with the servo and a leaf spring was used for a parallel connection. 

![image](/img/servo_orni/version1-1.jpg)  

![image](/img/servo_orni/version1-2.JPG)  

__Iteration 2:__  
The second iteration was a complete aircraft. The design employed a pair of [skewed hinges](https://www.rcgroups.com/forums/showpost.php?p=41151391&postcount=33) to hopefully achieve roll and pitch control. Unfortunately, test flights revealed this system did not work and barely redirected the aircraft. In addition to this, the servos were undersized and were under too much load. This resulted in the servos getting very hot to apply the desired torque. The wings were also inefficient and could not generate the required thrust for the aircraft to sustain flight. 

![image](/img/servo_orni/version2-1.JPG)  
 
![image](/img/servo_orni/version2-2.jpg)  

![image](/img/servo_orni/version2-3.jpg)  

__Iteration 3:__  
The third iteration built upon the second version. Control was accomplished separately through a controllable tail, and larger servos with four times the torque were used to reduce the likelihood of excess torque. To complement this, the servos were connected indirectly to the wings via a lever arm to double the torque applied to the wings. While this overcame the issues of driving the wings, the wing design was lacking. To overcome this limitation, different wing designs revealed large wings with a high degree of flexibility allowed the aircraft to maintain powered flight. 

![image](https://raw.githubusercontent.com/RCmags/ServoFlappingControl/main/example_pics/servo_body_res.jpg)  

![image](https://raw.githubusercontent.com/RCmags/ServoFlappingControl/main/example_pics/bottom_view_res.JPG)  

![image](https://raw.githubusercontent.com/RCmags/ServoFlappingControl/main/example_pics/flap_motion.gif)  

# Arduino Code
The program is designed to receive 3 PWM inputs from an RC receiver operating in [MODE 2](https://www.rc-airplane-world.com/rc-transmitter-modes.html) and outputs 2 PWM signals for off-the-shelf hobby servos. The aileron (1) and elevator (2) channels are used to bias the dihedral angle of each wing, with the aileron rotating the wings in unison while the elevator changes the dihedral angle. The throttle channel (3) changes the amplitude of a fixed-frequency oscillation. 

There are three wave-forms the user can select: sine wave, triangle wave, and saw wave. The controller also is equipped with a low-voltage cutoff routine. This will disable the throttle channel to prevent over-discharging a battery. The routine uses an analog pin to read the input voltage via a voltage divider. 

The program was written for an Arduino Nano, but it should be compatible with other boards. 
It requires the [PinChageInterrupt](https://www.arduino.cc/reference/en/libraries/pinchangeinterrupt/) library.
For more information on the controller, please see this [RCgroups post](https://www.rcgroups.com/forums/showpost.php?p=41325203&postcount=69).

Github Repo: [ServoFlappingControl](https://github.com/RCmags/ServoFlappingControl)

See the attached schematic for an example of the required circuit:

<img src = "https://raw.githubusercontent.com/RCmags/ServoFlappingControl/main/ReceiverServoFlap_VoltCutoff.png" width = "80%">

# Videos
Below are videos of different iterations of the aircraft:

This video demonstrates how the controller works:  
[![video](https://img.youtube.com/vi/T6NfZD_iuEs/hqdefault.jpg)](https://youtu.be/T6NfZD_iuEs)  
<p align="center">Video 1. Demonstration of servo controller</p>

[![video](https://img.youtube.com/vi/mhs4mhZv6aE/hqdefault.jpg)](https://youtu.be/mhs4mhZv6aE)  
<p align="center">Video 2. Underpowered servos</p>

[![video](https://img.youtube.com/vi/tji2ks2tRWM/hqdefault.jpg)](https://youtu.be/tji2ks2tRWM)
<p align="center">Video 3. Inefficient wings</p>  

[![video](https://img.youtube.com/vi/1Y5dV8BgdM8/hqdefault.jpg)](https://youtu.be/1Y5dV8BgdM8)  
<p align="center">Video 4. Assymetric wing elasticity</p>

[![video](https://img.youtube.com/vi/EZ9vgVurDFM/hqdefault.jpg)](https://youtu.be/EZ9vgVurDFM)  
<p align="center">Video 5. Segmented wing panels</p>

# Construction blog
For much more detailed information on the steps taken to develop this aircraft, see this thread on RCgroups: [Attempts at a servo flap ornithopter](https://www.rcgroups.com/forums/showthread.php?3221699-Attempt(s)-at-a-servo-flap-ornithopter). The most important posts are shown below:

1. [Very simple math model](https://www.rcgroups.com/forums/showpost.php?p=41093927&postcount=10)
2. [Energy and oscillating mass](https://www.rcgroups.com/forums/showpost.php?p=41104533&postcount=14)
3. [Elastic actuators - motors and springs](https://www.rcgroups.com/forums/showpost.php?p=41117281&postcount=20)
4. First iteration - the build begins!: 
	- [Part 1](https://www.rcgroups.com/forums/showpost.php?p=41126441&postcount=24)
	- [Part 2](https://www.rcgroups.com/forums/showpost.php?p=41126441&postcount=25)
5. [Control via dihedral offset: Pitch-flap coupling](https://www.rcgroups.com/forums/showpost.php?p=41151391&postcount=33)
6. [Oscillating wing as 2nd order damped system](https://www.rcgroups.com/forums/showpost.php?p=41164641&postcount=36)
7. Second iteration: 
	- [New frame and servo horns](https://www.rcgroups.com/forums/showpost.php?p=41166873&postcount=37)
	- [Wing build](https://www.rcgroups.com/forums/showpost.php?p=41183483&postcount=40)
	- [Covering the wing](https://www.rcgroups.com/forums/showpost.php?p=41195325&postcount=43)
	- [Completed wings and mounted electronics](https://www.rcgroups.com/forums/showpost.php?p=41229197&postcount=47)
	- [Glide tests](https://www.rcgroups.com/forums/showpost.php?p=41251767&postcount=50)
	- [Longer tail boom and additional spring](https://www.rcgroups.com/forums/showpost.php?p=41257839&postcount=52)
	- [Wiring electronics](https://www.rcgroups.com/forums/showpost.php?p=41264455&postcount=55)
	- [Arduino Code](https://www.rcgroups.com/forums/showpost.php?p=41273735&postcount=57)
	- [Powered test flights](https://www.rcgroups.com/forums/showpost.php?p=41307103&postcount=61) 
	- [Adding low voltage cutoff](https://www.rcgroups.com/forums/showpost.php?p=41325203&postcount=69)
	
8. [Maximum motor efficiency: Idealized case](https://www.rcgroups.com/forums/showpost.php?p=41250929&postcount=49)
9. [A simple model to determine servo speed and torque](https://www.rcgroups.com/forums/showpost.php?p=41350463&postcount=70)
10. Oscillating servo: 
	- [Initial experiment with springs](https://www.rcgroups.com/forums/showpost.php?p=41611419&postcount=106)
	- [Current experiment #2](https://www.rcgroups.com/forums/showpost.php?p=41793219&postcount=114)
	- [Direct and indirect drive](https://www.rcgroups.com/forums/showpost.php?p=42099773&postcount=118)
	
11. Forth iteration:
	- [Constructing the fuselage](https://www.rcgroups.com/forums/showpost.php?p=42335531&postcount=125)
	- [Adding electronics and Tail](https://www.rcgroups.com/forums/showpost.php?p=42352337&postcount=130)
	- [Membrane wings inspired on Hang glider Sail](https://www.rcgroups.com/forums/showpost.php?p=42368071&postcount=136)
	- [Composite Foam-Fabric wings](https://www.rcgroups.com/forums/showpost.php?p=42374421&postcount=141)
	- [Adding tail servos](https://www.rcgroups.com/forums/showpost.php?p=42379981&postcount=144)
	- [Unsuccesful flight...](https://www.rcgroups.com/forums/showpost.php?p=42380089&postcount=145)
	- [Experiments with wing articulation](https://www.rcgroups.com/forums/showpost.php?p=43071065&postcount=159)
	- [Initial test with segmented wings](https://www.rcgroups.com/forums/showpost.php?p=47159375&postcount=188)
	
12. [Measured oscillations - Updated Servo controller code - servoMotor Library](https://www.rcgroups.com/forums/showpost.php?p=43079349&postcount=164)
13. Analysis of the effects of wing elasticity:
	- [Part 1](https://www.rcgroups.com/forums/showpost.php?p=43356729&postcount=172)
	- [Part 2](https://www.rcgroups.com/forums/showpost.php?p=47154289&postcount=185)
	
