---
layout: post
title: "SB-1 | Updated Self-balancing robot with simpler control algorithm"

slider1:
- url: /img/self-balancing/version-1/side_view_res.jpg
- url: /img/self-balancing/version-1/top_view_res.jpg

slider2:
- url: /img/self-balancing/version-1/balance_motion.gif
- url: /img/self-balancing/version-1/motion_error.gif

slider3:
- url: /img/self-balancing/version-1/balance_motion.gif
- url: /img/self-balancing/version-1/motion_error.gif

---

Some time had passed since the initial prototype of the self-balancing robot, and while it worked, I was ultimately left unsatisfied with the results. While the stabilization algorithm worked, it felt ad-hoc and poorly defined. This left me with the concern that there was likely a much better way to write a similar algorithm with less redudant operations and more explicit logic. The chasis of the vehicle could also be improved by increasing the height of the device to increase its moment of inertia. Lastly, to really try out the stabilization, it would be nessesary to externally control the robot to make it rotate and forward or backwards. Under these arbitry inputs, it would be possible to stress the stabilization to see how it reponded to abrupt state changes. 

Out of these goals, the easiest modification was the chasis. This was simple and involved replacing the vertical spacers that seperated the acrylic sheets with larger spacers. The quickest solution I found was to use steel tubes with brass threads glued to each end. That way, the acrylic sheets could easily be screwed to the new spacers without having to change other parts. 

{% include image-slider.html list=page.slider1 aspect_ratio="16/9" %}
<p align="center"><i>The extended frame supports elevated the center of mass</i></p>

In terms of electronic components, an inexpensive **6ch 2.4ghz receiver** was installed to the chasis to send control signals to the Arduino. This way, I could use a remote control to guide the command the robot and test its response. To keep the electronics together and tidy, I soldered every component except the receiver to a prototype board. This way they could be mounted onto the chasis as a single unit that connected via jumper wires to the receiver. Moreover, since the receiver was not permanently wired to the robot, it could be reused in other purposes without disturbing the components of the robot. 

{% include image-slider.html list=page.slider2 aspect_ratio="16/9" %}
<p align="center"><i>The completed robot had foam pads to ease impacts when falling over</i></p>

Onto the prototype board was soldered an arduino nano, an MPU-6050 and two half burt H-bridged I had lying around. These boards half worked in that they could drive a single motor when they were intended to run two at the same time. Still, they worked well enough to drive motors independantly for each side. Here's what the electronics looked like when mounted on the frame:

{% include image-slider.html list=page.slider3 aspect_ratio="16/9" %}
<p align="center"><i>Every component was modular in case it needed to be replaced</i></p>

With the mechanical aspects of the robot completed, it was time to work on the core of the project which was the code and stabilization algorithm. To this end, I took a different approach to the last case by avoiding unnessary functions. It uses three PID loops acting simultaneously:

- __Pitch stabilization:__ This is the dominant PID controller of the system. It uses the pitch angle of the vehicle as a proportional term to keep the vehicle upright by accelerating into gravity. 

- __Position stabilization:__ It estimates the velocity by integrating pitch angle, which is proportional to the _lateral acceleration_ (at small angles), and this is integrated again to approximate _position_ (the double integral of the pitch angle). Both are used as the derivative and proportional term respectively. Their combined effect prevent the vehicle from drifting laterally and counters any change in center of gravity.  

- __Yaw stabilization:__ A controller that maintains heading by using as a proportional term the angular velocity of the yaw axis. It counters the open-loop nature of the motor control, wherein one motor can spin faster and cause the vehicle to turn.

![image](/img/self-balancing/version-2/equations.png)
<p align="center"><i>Position and velocity can be estimated by integrating the bank angle</i></p>

Ultimately, the unstable axis is only stabilized by the measured pitch angle. The yaw stabilization is nessesary to keep the heading fixed, but this is due to assymetries in the motors that would otherwise cause the robot to turn if controlled symmetrically. 

![image](/img/self-balancing/version-2/small-angle-ext.png)

__Note:__ Both motors are driven with [pulse frequency modulation](https://en.wikipedia.org/wiki/Pulse-frequency_modulation) to counter magnetic cogging and stiction. The duty is cycle is long enough so that each pulse causes the motors to rotate one magnetic pole. Such a waveform provides precise control over low-speed rotation at the cost of jerky movement. This precision is necessary to reduce under and over correction when the vehicle is nearly vertical. 

Driving the motors like this causes them to behave similar to a stepper motor, albeit with much less precision, larger steps, and less torque. Incorportated into the control algorithm were two inputs from the radio reciever to set the target velocity of the robot when going forward and back, and the rate of angular velocity. The signals from the receiver were decoded by using pin change interrupts in the arduino, to measure the pulse width of the signals. The [pulseInput](https://github.com/RCmags/pulseInput) is a flexible example of how to read such signals. With all of these factors put together the robot worked quite well. It was significantly smoother than the first iteration, both likely due to the better stabily algorithm and the increased moment of inertia:

{% include youtube.html id='I6z26LVu5y0' %}  
<p align="center"><i>The robot was capable of maintaing balance and being guided via remote control</i></p>

Overall, I'm quite pleased with the results. It is far from perfect and compared to more popular methods of control involving stepper motors, the results may be sub-par, but considering the simplicity with which the motors are controlled, this is still a valueable experiement. With better motors that suffer from much less stiction and cogging, such are brushed coreless motors, it is very likely the performance of the robot would greatly increase. If nothing else, it would have a much smoother response as there would not be a large minimum torque to rotate the wheels. 

### Github Repo:
The version of the code associated with this protoype can be found here: 
[SelfBalancingRobot - V1.2](https://github.com/RCmags/SelfBalancingRobot/releases/tag/v1.2)
