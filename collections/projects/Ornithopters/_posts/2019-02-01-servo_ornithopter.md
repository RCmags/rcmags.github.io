---
layout: post
title: "Review | Ornithopter powered and controlled by servos"

# image sliders:
slider1:
- url: /img/servo_orni/version1-1.jpg
- url: /img/servo_orni/version1-2.JPG

slider2:
- url: /img/servo_orni/version2-1.JPG
- url: /img/servo_orni/version2-2.jpg
- url: /img/servo_orni/version2-3.jpg

slider3:
- url: /img/servo_orni/servo_body_res.jpg
- url: /img/servo_orni/bottom_view_res.JPG
- url: /img/servo_orni/side_view_res.JPG

---

# Introduction to concept
[Ornithopters](https://en.wikipedia.org/wiki/Ornithopter) are aircraft that use oscillating wings to stay aloft. Depending on the characteristics of the aircraft, an ornithopter can maintain flight at a constant velocity like a bird, or it can fly in static air like an insect. These scenarios are analogous to an airplane driven by a propeller and a helicopter at hover.

{% include youtube.html id='f50K68zB4eU' %}  
<p align="center">Video A. Bird in horizontal flight</p>

{% include youtube.html id='2z9F6pVhR5o' %} 
<p align="center">Video B. Insect at hover</p>

There are a few advantages to ornithopters. In horizontal flight, the wings of an ornithopter can sweep over a much larger area compared to a propeller. According to [actuator disk theory](https://web.mit.edu/16.unified/www/FALL/thermodynamics/notes/node86.html), this increase in the area can increase the propulsive efficiency of the aircraft. Likewise, oscillating wings do not suffer from [dissymetry of lift](https://www.copters.com/aero/lift_dissymetry.html) and [gyroscopic precession](http://www.cleonis.nl/physics/phys256/gyroscope_physics.php) like a rotary-wing. The absence of these forces can enhance the natural stability of an ornithopter compared to a helicopter.

# Initial aircraft design
This project concerns itself with developing a radio-controlled ornithopter powered and controlled by two servos. Each servo is connected to a wing and flapped independently. This allows the motion of the wings to be controlled through software rather than through a specially designed mechanism. There are many advantages to this approach, mainly that it is very easy to adjust the amplitude of the flapping motion, and the wings may be oscillated asymmetrically to achieve directional control. 

![image](https://www.researchgate.net/profile/Yanghai-Nan/publication/280948641/figure/fig1/AS:614244433289216@1523458693052/Control-via-flapping-amplitude-offset-modulation.png)  

# Aircraft Iterations

__Iteration 1:__  
The first version was a test platform to observe how effectively servos could oscillate a long spar. It also served to test springs connected to the servos in series or parallel. These springs can [reduce the power drawn by an oscillating mass](https://www.rcgroups.com/forums/showpost.php?p=41117281&postcount=20) driven by a motor if tuned correctly. For this design, a a coil spring was connected in series with the servo and a leaf spring was used for a parallel connection. 

{% include image-slider.html list=page.slider1 local='yes' %}

__Iteration 2:__  
The second iteration was a complete aircraft. The design employed a pair of [skewed hinges](https://www.rcgroups.com/forums/showpost.php?p=41151391&postcount=33) to hopefully achieve roll and pitch control. Unfortunately, test flights revealed this system did not work and barely redirected the aircraft. In addition to this, the servos were undersized and were under too much load. This resulted in the servos getting very hot to apply the desired torque. The wings were also inefficient and could not generate the required thrust for the aircraft to sustain flight. 

{% include image-slider.html list=page.slider2 local='yes' %}

__Iteration 3:__  
The third iteration built upon the second version. Control was accomplished separately through a controllable tail, and larger servos with four times the torque were used to reduce the likelihood of excess torque. To complement this, the servos were connected indirectly to the wings via a lever arm to double the torque applied to the wings. While this overcame the issues of driving the wings, the wing design was lacking. To overcome this limitation, different wing designs revealed large wings with a high degree of flexibility allowed the aircraft to maintain powered flight. 

{% include image-slider.html list=page.slider3 %}

# Videos
Below are videos of different iterations of the aircraft:

{% include youtube.html id='T6NfZD_iuEs' %}   
<p align="center">Video 1. Demonstration of servo controller</p>

{% include youtube.html id='mhs4mhZv6aE' %} 
<p align="center">Video 2. Underpowered servos</p>

{% include youtube.html id='tji2ks2tRWM' %} 
<p align="center">Video 3. Inefficient wings</p>  
  
{% include youtube.html id='1Y5dV8BgdM8' %} 
<p align="center">Video 4. Assymetric wing elasticity</p>

{% include youtube.html id='RMnTC4-kJnU' %} 
<p align="center">Video 5. First succesful powered flight</p>

{% include youtube.html id='vJElIddXBBs' %} 
<p align="center">Video 6. Excellent prolonged flight and climb</p>

# Arduino Code
The program is designed to receive 3 PWM inputs from an RC receiver operating in [MODE 2](https://www.rc-airplane-world.com/rc-transmitter-modes.html) and outputs 2 PWM signals for off-the-shelf hobby servos. The aileron (1) and elevator (2) channels are used to bias the dihedral angle of each wing, with the aileron rotating the wings in unison while the elevator changes the dihedral angle. The throttle channel (3) changes the amplitude of a fixed-frequency oscillation. 

There are three wave-forms the user can select: sine wave, triangle wave, and saw wave. The controller also is equipped with a low-voltage cutoff routine. This will disable the throttle channel to prevent over-discharging a battery. The routine uses an analog pin to read the input voltage via a voltage divider. The program was written for an Arduino Nano, but it should be compatible with other boards. 
It requires the [PinChageInterrupt](https://www.arduino.cc/reference/en/libraries/pinchangeinterrupt/) library. For more information on the controller, please see this [RCgroups post](https://www.rcgroups.com/forums/showpost.php?p=41325203&postcount=69).

See the attached schematic for an example of the required circuit:
![image](https://raw.githubusercontent.com/RCmags/ServoFlappingControl/refs/heads/main/images/diagrams/nano/schematic-nano.png)

__Github Repo:__ [ServoFlappingControl](https://github.com/RCmags/ServoFlappingControl)
