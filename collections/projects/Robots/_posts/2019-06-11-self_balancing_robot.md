---
layout: post
title: "SB-1 | Self balancing robot stabilized with a gyroscope"

slider1:
- url: /img/self-balancing/version-1/side_view_res.jpg
- url: /img/self-balancing/version-1/top_view_res.jpg

slider2:
- url: /img/self-balancing/version-1/balance_motion.gif
- url: /img/self-balancing/version-1/motion_error.gif

---

While learning how to program [Arduinos](https://www.arduino.cc/en/Guide/Introduction) I would often be met with different variants of the [self-balancing robot](https://people.ece.cornell.edu/land/courses/ece4760/FinalProjects/f2015/dc686_nn233_hz263/final_project_webpage_v2/dc686_nn233_hz263/index.html).. This nothing more than a two wheeled platform that is unstable in one direction and must be stabilized to the maintain balance of an [inverted pendulum](https://en.wikipedia.org/wiki/Inverted_pendulum). To keep the vehicle upright, the wheels are rotated in such that they generate horizontal accelerations that prevent the body from tilting forward. The result is that the vehicle is kept upright by actively applying torque to the wheels. This project serves as a great example of an unstable system being forced towards a stable condition through a [controlled feedback loop](https://www.electronics-tutorials.ws/systems/closed-loop-system.html). It's also a solid way of learning about control algorithms along with their strengths and drawbacks. 

{% include youtube.html id='I6z26LVu5y0' %}  
<p align="center"><i>A great example of a self-balancing robot by: <a href="https://www.youtube.com/@RZtronics">RZTronics</a></i></p>

It felt completely appropriate to tackle this project given the learning opportunity this presented. Most designs for these robots use [stepper motors](https://en.wikipedia.org/wiki/Stepper_motor) or [DC motors](https://en.wikipedia.org/wiki/DC_motor) whose position is measured via [rotary enconders](https://en.wikipedia.org/wiki/Rotary_encoder). Either approach makes it possible to precisely control the wheel's angular velocity, as their position can also be precisely controlled. In the case of _stepper motors_, if they are spun slowly enough, and under a small enough torque load, they can achieve precise motion control without directly measuring their position. This is because, as the name suggests, they rotate in discrete and known steps. By counting the steps the motors are commanded to rotate, one aumatically knows the position. 

![image](https://www.exploringarduino.com/wp-content/uploads/2019/07/Stepper-Motor-768x576.jpg)
<p align="center">A direct-drive stepper motor is designed for low speed, high torque operation.</p>

_DC-Motors_ do not rotate a known angle, and so require a measurement system to sense their position. In this case, one can count the number of steps measured by a rotary encoder to determine the angular rotation of a DC motor. This angular position can then be used as the basis for a [PID controller](https://en.wikipedia.org/wiki/Proportional%E2%80%93integral%E2%80%93derivative_controller) that applies the nessesary voltage to the motor, to make it reach a target angular position. It is a more complicated solution than a stepper motor, but has the advantage of being able to apply larger torques at higher speeds at a lower energy draw. 

![image](https://yw-transmission.com/wp-content/uploads/2019/12/62-Dc-Motor-With-Encoder.jpg)
<p align="center">A DC-motor needs to be geared to apply torques similar to a comparable stepper motor</p>

Given the advantages of a DC motor, they are inherently appealing for a wheeled robot. However, the use of rotary encoders make them more complex and expensive than stepper motors. As a challenge, the approach I took was to use DC motors _without_ the rotary encoders, and to control them in such a way that they still provided adequate control for a self-balancing robot. The result may not be as good as a stepper or rotary-encoder based solution, but if it worked well-enough, it would be accomplishment. 

With this in mind, I procured the cheapest equipment I could find to build a small prototype. This consisted of: 

- A small wheeled chasis made of plexiglass.
- Two geared DC motors made of plastic.  
- An Arduino Nano.
- An MPU6050 IMU sensor.
- an H-bridge capable of driving two DC motors independently. 
- A 400mah 2Cell Lipo battery was used to power the motors and the arduino. 

<br>
From a mechanical point of view the system was very simple. Two wheels were placed directly under the chasis, and the electronics and battery were placed at the highest point of the chasis. This raised the center of mass of the vehicle and increased its [moment of inertia](https://en.wikipedia.org/wiki/Moment_of_inertia) about the unstable axis. As a consequence, it would react more slowly both to gravity and the acceleration from wheels, which would help the arduino as it would not have to react as quickly to correct for the vehicle's instability. 

![image](https://uploads-cdn.omnicalculator.com/images/mass-moment-of-inertia/rod.png)
<p align="center">Mass father from the center of rotation greatly increases the moment of inertia</p>

Maximizing the moment of inertia was important as the chasis was short and squat, and any small height increase would help. Here's what the prototype looked like after being put together:

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %}  
<p align="center"><i>A crude but functional design to try out stabilization algorithms</i></p>

The code was written to provide the nessesary stabilization through the MPU6050's gyroscope and accelerometer. It works as follows: a complementrary filter is used to estimate the (pitch) angle of the vehicle relative to the horizontal. A PID controller is driven by this angle and attemps to drive towards zero. The output of the PID controller is then fed into a "torque function" that modifies the command. This function attemps to counter friction in the motors to ensure constant inputs generate constant torque on the vehicle.

To accomplish this, the function integrates the control inputs at a specified rate. This causes the motors to stay on even after a control input is zero. As the control inputs are analogous to the acceleration felt by the vehicle, this integral acts as an estimate for the velocity. By the same analogy, integrating this term provides an estimate for the position. One can use the position and velocity estimates to laterally stabilize the vehicle. While this is not as precise as rotary encoders it is a simple and effective workaround.  

This allows the center of gravity of the vehicle to change in real time and the vehicle will bank itself to maintain equilibrium. 
In essence, one has two PID loops acting simulatenously. One that stabilizes the heading of the vehicle, and one that attempts to keep the vehicle form sliding back and forth.

{% include image-slider.html list=page.slider2 aspect_ratio="16/9" %}
<p align="center"><i>The robot was able to stay upright and correct for CG changes</i></p>

### Github Repo:
The version of the code associated with this protoype can be found here: 
[SelfBalancingRobot - V1.0](https://github.com/RCmags/SelfBalancingRobot/releases/tag/v1.0)
