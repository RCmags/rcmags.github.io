---
layout: post
title: "Review | Tracked vehicle capable of following waypoints on a 3D surface"

slider1:
- url: https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/tank1_res.jpg
- url: https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/tank2_res.jpg
- url: https://raw.githubusercontent.com/RCmags/TrackRobot/main/images/tank3_res.jpg
---

## Introduction to navigation

Arduinos are capable of many things yet they are often berated as being underpowered and greatly inferior to other development board options. While from a computational standpoint this is true, they are nonetheless very capable devices when used inteligently. With clever and efficienctly written code, is is amazing what they can accomplish on such limited computational resources. As an educational challenge, it is well worth our time to try and develop a complex program based on an arduino, both for the technical aspects it teaches us, and  to grant us a degree of respect to what properly developed code can accomplish. A classic example of great things with few resources is the flight computer of the apollo landers:

{% include youtube.html id='ULGi3UkgW30' %}
<p align="center"><i>The Apollo's flew with the equivalent of a inexpensive microcontroller</i></p>

In the case of an arduino, these devices are often used to maintain the balance of small robots or as the flight controller for remote controlled aircraft. They serve this purpose very well but the arduinos generally end up under utilized when used in these tasks. We can therefore extend their use to the complex task of [navigation](https://en.wikipedia.org/wiki/Navigation). It is one thing to merely keep a vehicle stable in space so it does not wander off uncontrolably, and quite another to precisely control its position and orientation. Going further, if we can accomplish precise state control then we may also command the vehicle to follow a given _trajectory_ or set move towards a set of _coordinates_ in space. These are much more complicated tasks that are of a higher level of abstraction in the control of a vehicle. Make no mistake, this is a complex problem that greatly depends on the nature of the vehicle in question. In the most general case we must measure the [state](https://en.wikipedia.org/wiki/State_vector_(navigation)) of a body that can rotate and translate in three directions. 

![image](https://www.intmath.com/vectors/img/cosines.gif)
<p align="center"><i>Under a <a href="https://en.wikipedia.org/wiki/Euclidean_space">euclidean space</a> we can rotate and translate</i></p>
 
Moreover, we can futher seperate the problem of navigation into two sections: measuring the state of the body, and precisely controlling said state. Once we can estimate what our vehicle is doing, we can take actions that affect it's behaviour. However, the nature of the vehicle in question greatly affects what we can alter. For example, in a car we can only change its forward and backwards velocity and the direction it steers in. We cannot change its orientation with respect to gravity nor its side-to-side velocity. By comparison, there are variables that we can change (albeit with some restrictions) in vehicle like a helicopter. This machine is capable of rotating about all axes and can translate in any direction, along with being able to rise and fall vertically. 

![image](/img/tracked-robot/heli_axis.jpeg)
<p align="center"><i>Not all vehicles have the same degrees of freedom</i></p>

Given the intercoupled nature between the type of control we can obtain from a vehicle and the way it works, the more general component of navigation is measuring the state. This alone is not a simple problem and will depend greatly on the type of sensors we have avaible to measure the vehicle. In absense of the direct measurement of a variable, we must infer the state through a model that depends on related information. An example of such an inference is the process of [dead reckoning](https://en.wikipedia.org/wiki/Dead_reckoning). In this situation, we use the _acceleration_ of a body to estimate its _velocity_. We have no direct knowledge of the velocity and therefore cannot determite whether it is _true_, but it is better than no information at all. 

![image](http://avstop.com/ac/flighttrainghandbook/imageqa7.jpg)

It's not unusual for wheeled ground vehicles to estimate their position using the method of odometry. This involves counting the number of rotations of the wheels to determine how far the vehicle has displaced laterally and how much it has rotated. By combining this information its possible to calculate the two-dimensional position of the vehicle by assuming it is moving across a flat plane. Since the actual position of the vehicle is never measured, this approach is a variant of dead reckoning that does not use velocity and time to determine position, but rather the assumption that a wheel in contact with a surface will not _slide_ across said surface but _roll_ over it. An ideal _rolling_ wheel will only move forward if it has rotated a certain ammount. The principal advantage of this position estimate is the simplicity of the calculation and required sensors. A set of __rotary encoders__ is enough to determine the rotation of the vehicle wheels and no other sensors are needed. 

{% include youtube.html id='eQ9E0Zvp9jw' %}
<p align="center"><i>Odometry is a simple way to estimate position in the short term</i></p>

Given that odometry has a tendency to diverge over time, it does a relatively poor job at determining the heading of a vehicle across any significant movement. Even small errors in displacement due to wheel rotation will get amplified when calculating the position, as any error in the heading gets amplified the farther the vehicle moves. We can clearly see this behaviour when we compare odometry to gyrodometry. In the later case, the direction of the vehicle is measured through a gyroscope. These measurements are much more accurate than anything involving the wheels. As a consquence, the position estimate in the long term is far better. The wheel displacement is used only to determine translation, and the gyroscope handles the heading independantly. When we compare both methods to one another it's clear gyrodometry is superior:

{% include youtube.html id='lFOGq8POkQ0' %}
<p align="center"><i>Gyrodometry improves upon odometry by using a gyroscope</i></p>

Whilst gyrodometry is better way of estimating the position of a wheeled vehicle, is it not without fault. The position is still being calculated by integrating many small individual measurements as this will accumulate error over time. Moreover, this error also applies to the gyroscope as the heading it holds as "zero" will drift with time unless it is routinely corrected. Therefore gyrodometry still represents a form of _dead reckoning_ that _diverges_ relatively slowly compared to less accurate methods. Ultimately if we do not have a way of _directly_ measuring the position of the vehicle through a sensor (such that it does accumulate errors over time), we will have no way to _ensure_ the accuracy of our estimate in the long run. If we assume that _do_ have some way to verify our actual position, we can update our _estimated_ position with something like a [kalman filter](https://thekalmanfilter.com/kalman-filter-explained-simply/) whenever we receive new data. We can see this in the following video:

{% include youtube.html id='niFzS2t1F-8' %}
<p align="center"><i>A kalman filter can estimate the state when there are no new measurements</i></p>

By paying attention to the above video, we can see that the measurements only appear sporadically and are not obtained in real time. The filter makes up for this deficiency by "filling in" the gaps between the measurements through an _estimate_ of where it _thinks_ the new measurement will take place. Essentially the filter "mixes" the estimated position (which is updated much more quickly) with the measurements (which update slowly) to provide a "filtered" output. In the case of the wheeled robot we discussed before, we could employ an additional sensor to provide a low-frequency but _accurate_ measurement of position and supplement the time between measurements with gyrodometry. I highly recommend going over this python script that simulates a 1-dimensional kalman-filter. It's plain to see how the estmate "smooths" the measurement pulses. See: [Kalman-filter Python Example](https://thekalmanfilter.com/kalman-filter-python-example/)


Without a doubt, determining the position and orientation of a robot is a rabit-hole that can quickly become very complicated depending on how demanding our requirements are. We can also note the interconnection between the accuracy of our estimation and the types of sensors we have. Some sensors allow us to indirectly measure a state and estimate, while others can directly measure the same variable directly. Whatever the case, there is no mathematical wizdardry that will prevent us from measuring _something_ about the robot. From there on, its the measurement itself which determines how accurately we can infer other variables. 

## Motivation for project

All of this disccusion of navigation and how it may be implemented via an arduino stems from my personal interest in a competition I learned about during college. In my campus there was a team of students that were developing an autonomous lunar excavator for a NASA competition. This is known as the [Lunarbotics challenge](https://www.nasa.gov/learning-resources/lunabotics-challenge/). The gist of the competition was to develop a robot that could excavate lunar regolith and transport it back to a rendeveouz point. It had to accomplish this task autonousmously with human assistance. The robot would have to go back and forth between the excavation point and its drop-off location multiples times while also doing it as quickly as possible to the win the competition. 

{% include youtube.html id='9TWPvQPDpxs' %}
<p align="center"><i>This is an example of a lunarbotics robot</i></p>

In my case, I became interested in the navigation part of this challenge as I knew something about arduino and this left like a good way to expand my knowledge. Since the robot was assumed to operate on the moon, one of the restrictions imposed on it was that it could not depend on navigation systems that are used on earth like GPS. The entire navigation system of the robot had depend on the robot itself with no external assistance. This meant the navigation had to depend on sensors that were mounted the vehicle. In many ways, this is similar to how animals operate in that they are closed systems that depend only on internal computations to make nagivate. Even "unintelligent" animals like small insects are capable of complex spatial localization all by themselves. Due to their size, the computational power of their brains is not very large compared to other animals, so whatever they are doing, it cannot require huge computations. Honey bees are a fantastic example of what insects can accomplish with their very small brains:

{% include youtube.html id='bFDGPgXtK-U' %}
<p align="center"><i>Honey bee's can fly to distant flowers then return to their hive</i></p>

This example from nature is very inspirational, as it meant it was not unreasonable to use a limited device like an arduino as a legitimate platform to develop a nagivation system. Animals require far more effective systems to locate food and survive, but the lunarbotics robot did have such demands. It only needed to move towards a mining location and return to its original location. 

![image](https://www.researchgate.net/profile/Volker-Willert/publication/315836890/figure/fig8/AS:667946330378257@1536262223879/Odometry-results-for-the-main-robot-after-waypoint-navigation-In-red-is-shown-the.png)
<p align="center"><i>The robot would need to go back and forth across a circuit</i></p>

With this in mind, I felt confidant that a small prototype based on an arduino could be used to develop an effective navigation system that could be ported to the larger robot used for the competition. Since the larger robot (that had already been manufactured) used [treads](https://en.wikipedia.org/wiki/Continuous_track) to move above sand, it meant the prototype had to use this type of locomotion to effectively capture the dynamics of the larger vehicle. Obviously it would not capture all of the dynamics, but it would still be much better than using a wheeled platform whose behaviour differs significantly from a tracked vehicle. 

To this end, I wrote a python script to better understand the dynamics and characteristics of tracked vehicles. It was a simple 2-dimensional simulation where the vehicle was exposed to arbitrary control inputs that made the treads move at different speeds. The most difficult part of the simulation was modelling the treads as these are _area contact_ devices, rather than _point contact_ devices like wheels. This meant the treads had to be sub-divided into multiple small contact patches and the resulting friction forces integrated over the area of the treads. 

See: <b><a href="/projects/miscellaneous/2020/09/18/tracked_vehile_sim.html">2D simulation of a tracked robot | Article and code</a></b>

## Robot functionality

The position of the vehile is estimated using a physical model of the vehicle, an accelerometer that is integrated twice, a gyroscope for heading, and the displacement measured by two optical flow sensors. All of this data is fused to obtain the net displacements relative to an initial position using rectangular coordinates. These position and orientation estimates are used to guide the vehicle to a specified location using two PID loops, one for displacements and one for heading.  

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %}  
<p align="center"><i>The tracked prototype was small and compact</i></p>

The coordinates are stored in a buffer that can be filled in real time via a bluetooth module. Coordinates can be pushed or poped off the buffer. Once the vehicle is within a given radius of a coordinate, the following coodinate is made the target destination. This process will continue indefinitely and the vehicle will follow a closed path with the coordinates as the vertices. 

{% include youtube.html id='VYhLW5owS3A' %}
<p align="center"><i>The autonomous robot worked well with acceptable precision</i></p>

### Github Repo:
The code for the project can be found in the following repository:
[TrackRobot](https://github.com/RCmags/TrackRobot)

__Note__: Some versions of the code are written using older versions of the libraries it depends on. This is because the navigation code was being written at the same time as its implementation with the robot controller. 
