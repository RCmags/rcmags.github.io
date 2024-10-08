---
layout: post
title: "Review | Autogyro stabilized by an offset hinge without a horizontal stabilizer"

# image sliders:
slider1:
- url: https://rcmags.github.io/img/autogyro/offset_pos.png
- url: https://rcmags.github.io/img/autogyro/offset_neg.png

slider2:
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version1/front.JPG
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version1/side.JPG

slider3:
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version1/rotor1.JPG
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version1/rotor2.JPG 

slider4:
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version2/front.JPG
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version2/side.JPG
- url: https://raw.githubusercontent.com/RCmags/rcmags.github.io/main/img/autogyro/version2/rotor.JPG

---

# Introduction to concept

An autogyro is an aircraft kept aloft by a rotor that spins by moving through the air. The aircraft is powered by a propeller that pushes it to maintain airspeed. The rotor does not suffer from an abrupt stall like a wing and allows the aircraft to descent vertically like a parachute. However, the rotor needs motion between itself and the air to generate lift so an autogyro cannot hover in the air like a helicopter. One can think of an autogyro as a machine with a pneumatic transmission. Instead of the engine powering the rotor directly like in a helicopter, the engine imparts relative energy to the air that in turn drives the rotor. In this sence, air acts as a kind of working fluid that transfers power from the engine to the rotor.

{% include youtube.html id='_25H9ZPE2So' %}   

Because the air drives the motion, the rotor does not create a reaction torque like a helicopter. The drawback is that a pneumatic transmission is not as efficient as a mechanical transmission. The rotor is a kind of an axial wind turbine and operates an angle to the airflow. Like all wind turbines, the rotor cannot absorb all of the power in the incoming air. Add to this the inefficiency in the propeller and the overall efficiency is poor compared to a gearbox. If properly lubricated, a gearbox can achieve an efficiency in excess of 90%. Nonetheless, the air-driven rotor has a significant advantage when it comes to stability. As the air flows through the bottom of the rotor, the rotor induces a force parallel to the plane of the disk that tends to stabilize the autogyro. By comparison, a helicopter has a top-to-bottom airflow that reverses the planar force and destabilizes the aircraft. Hence, one faces the compromise between stability versus efficiency when comparing an autogyro with a helicopter.

{% include image.html src="/img/autogyro/airflow-types.jpg" maxwidth="400px" %}

# Initial design
_Landing gear_:

The propeller could be located at the nose of the aircraft in a tractor configuration or farther aft in a pusher configuration. A tractor configuration shifts the center of mass forward which aids stability. It also ensures the propeller is far away from the rotor and reduces the risk of collision. However, it exposes the propeller to the ground making it very likely it will break during a crash.

![image](https://rcmags.github.io/img/autogyro/tractor_prop.png)

The pusher configuration can shield the propeller with the front of the aircraft but the propeller is now very close to the rotor. It takes very little deflection for the rotor to collide with the propeller. Obviously this is catastrophic.

![image](https://rcmags.github.io/img/autogyro/pusher_prop.png)

The collision can be avoided by rotating the mast to move the propeller forward and under the rotor. Doing so moves the center of mass forward so less ballast is needed in the nose to maintain equilibrium.

![image](https://rcmags.github.io/img/autogyro/pusher_hidden.png)

_Offset-hinge:_

In the absence of a horizontal stabilizer the autogyro needs another mechanism to obtain pitch stability. A horizontal stabilizer applies a moment that rotates the aircraft towards a smaller angle of attack. This moment can be reproduced with a lever between the mast and the rotor. Due to the distance between the rotor and the hinge, the rotor's axial force will apply torque to the lever. The torque can be countered with a spring attached to the lever.

![image](https://rcmags.github.io/img/autogyro/offset_balance.png)

As the spring is elastic, it will deflect when the force changes. With more angle of attack, the axial force increases and the spring expands. With less angle of attack, the axial force decreases and the spring compresses. These deflections move the line-of-action of the force relative to the center of mass and generate a moment that rotates the aircraft to a smaller angle of attack.

{% include image-slider.html list=page.slider1 %}

# Design iterations and development

The model autogyro required multiple iterations before it reached a satisfying design. It also required analyzing the flight mechanics to make an educated guess about what should be modified.  

__Iteration 1:__  
The first iteration used a conventional landing gear configuration. While it was simple and only required three wheels, the configuration was unstable during landings. The Friction of the front tires induced a braking force that unloaded the rear wheel. As the main wheels were in front of the center of mass, the torque caused by their cornering force caused the vehicle to rotate towards a sharper turn. This was destabilizing and caused the aircraft to roll over during landings.

![image](/img/autogyro/wheel-positions.png)

The design of the offset hinge also went through 2 iterations. Initially it was a lever connected to a spring. While it worked it felt excessively complicated. The spring was also too soft and caused pitch control to be unresponsive. The second iteration was a flexible strap that behaved like a leaf spring. It was much simpler and could be made stiffer by increasing the thickness.

{% include image-slider.html list=page.slider2 %}
<p align="center"> Lateral views of Autogyro </p>

{% include image-slider.html list=page.slider3 %}
<p align="center"> Rotor head: hinge with spring and later leaf spring  </p>

{% include youtube.html id='ps-KYJPquqs' %}     
<p align="center"> Video 1. Flight of 1rst iteration </p>

After the hinge modification, the aircraft flew quite well aside from its unfavorable ground handling. It seemed like the aircraft had neutral pitch stability. It was not unstable, it did not return to a low angle of attack very quickly. This was especially noticeable at low airspeeds where there wasn't a strong tendency for the nose to drop. Instead the attitude merely stayed where it was.

__Iteration 2:__  
The second iteration fixed the landing gear by using a tricycle configuration. The front wheel was given a caster and the the main wheels located behind the center of mass. In addition to this, a wheel was added to the tail boom to protect it during landings. Braking would load the front wheel but due to the caster, the wheel did not make strong cornering forces. At the same time, the cornering force of the rear wheels would act behind the center of mass. This combination proved stable as the moment would rotate the vehicle to a wider turn, drastically reducing the likelihood of a rollover.

In addition to this, the motor mount was modified to one adjust the position of the propeller. Rather than a fixed block onto which the motor bolted onto, the mount was a plate with a slot that allowed the motor to move vertically. This made it easy to align the thrust line with the center of mass. It is extremely important these two must align to avoid the possibility of powered-push-over.

{% include youtube.html id='RCiWSCi7bfk' %}   
<p align="center"> Explanation of powered-push-over </p>

Should this happen, the aircraft will suddenly pitch forward in an unrecoverable dive when the rotor unloads. Another modification was a softer hinge. After these changes the aircraft was farly stable and easy to fly by an experienced pilot. The pitch stability was somewhat better but it was still neutral compared to an airplane. 

{% include image-slider.html list=page.slider4 %}
<p align="center"> Lateral views of Autogyro </p>

{% include youtube.html id='b1p8pCHiuWo' %}     
<p align="center"> Video 2. Flight of 2nd iteration </p>

After some minor adjustments, this iteration of the autogyro flew quite well and was acceptably stable. It was not as easy to fly as a model with a horizontal stabilizer, but it proved that tail-less pitch stabilization is very possible. Despite this fact, it’s not clear whether a tail-less configuration is __worth__ pursuing. A horizontal stabilizer adds very little weight to the aircraft and is greatly beneficial for stability under all flight conditions. Therefore, while this project serves as an interesting proof of concept, the method of tail-less stability cannot be recommended as a general solution over simply installing a [horizontal stabilizer](https://en.wikipedia.org/wiki/Tailplane) on an autogyro. 
