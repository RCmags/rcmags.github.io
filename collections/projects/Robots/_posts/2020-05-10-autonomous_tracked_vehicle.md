---
layout: post
title: "Review | Tracked vehicle capable of following waypoints on a 3D surface"

slider1:
- url: /img/tracked-robot/tank1.jpg
- url: /img/tracked-robot/tank2.jpg
- url: /img/tracked-robot/tank3.jpg
- url: /img/tracked-robot/tank4.jpg
- url: /img/tracked-robot/tank5.jpg

slider2:
- url: /img/tracked-robot/tank8.jpg
- url: /img/tracked-robot/tank7.jpg
- url: /img/tracked-robot/tank6.jpg

---

## Introduction to navigation

Arduinos are capable of many things yet they are often berated as being underpowered and greatly inferior to other development board options. While from a computational standpoint this is true, they are nonetheless very capable devices when used inteligently. With clever and efficienctly written code, is is amazing what they can accomplish on such limited computational resources. As an educational challenge, it is well worth our time to try and develop a complex program based on an arduino, both for the technical aspects it teaches us, and  to grant us a degree of respect to what properly developed code can accomplish. A classic example of accomplishing great things with few resources is the flight computer of the apollo landers:

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

Whilst gyrodometry is better way of estimating the position of a wheeled vehicle, is it not without fault. The position is still being calculated by integrating many small individual measurements as this will accumulate error over time. Moreover, this error also applies to the gyroscope as the heading it holds as "zero" will drift with time unless it is routinely corrected. Therefore gyrodometry still represents a form of _dead reckoning_ that _diverges_ relatively slowly compared to less accurate methods. Ultimately if we do not have a way of _directly_ measuring the position of the vehicle through a sensor (such that it does accumulate errors over time), we will have no way to _ensure_ the accuracy of our estimate in the long run. If we assume that we _do_ have some way to verify our actual position, we can update our _estimated_ position with something like a [kalman filter](https://thekalmanfilter.com/kalman-filter-explained-simply/) whenever we receive new data. We can see this in the following video:

{% include youtube.html id='niFzS2t1F-8' %}
<p align="center"><i>A kalman filter can estimate the state when there are no new measurements</i></p>

By paying attention to motion of the boxes, we can see that the measurements only appear sporadically and are not obtained in real time. The filter makes up for this deficiency by "filling in" the gaps between the measurements through an _estimate_ of where it _thinks_ the new measurement will take place. Essentially the filter "mixes" the estimated position (which is updated much more quickly) with the measurements (which update slowly) to provide a "filtered" output. In the case of a wheeled robot, we can employ an additional sensor to provide a low-frequency but _accurate_ measurement of position and supplement the time between measurements with gyrodometry. I highly recommend going over this python script that simulates a 1-dimensional kalman-filter. It's plain to see how the estimate "smooths" the measurement pulses. See: [Kalman-filter Python Example](https://thekalmanfilter.com/kalman-filter-python-example/)


Without a doubt, determining the position and orientation of a robot is a rabit-hole that can quickly become very complicated depending on how demanding our requirements are. We can also note the interconnection between the accuracy of our estimation and the types of sensors we have. Some sensors allow us to indirectly measure a state and estimate, while others can directly measure the same variable directly. Whatever the case, there is no mathematical wizdardry that will prevent us from measuring _something_ about the robot. From there on, its the measurement itself which determines how accurately we can infer other variables. 

## Motivation for the project

All of this disccusion of navigation and how it may be implemented stems from my personal interest in a competition I learned about during college. In my campus there was a team of students that were developing an autonomous lunar excavator for the NASA [Lunarbotics challenge](https://www.nasa.gov/learning-resources/lunabotics-challenge/). The gist of the competition was to develop a robot that could excavate lunar regolith and transport it back to a rendeveouz point. It had to accomplish this task autonousmously without human assistance. The robot would have to go back and forth between the excavation point and its drop-off location multiples times while also doing it as quickly as possible to the win the competition. 

{% include youtube.html id='9TWPvQPDpxs' %}
<p align="center"><i>This is an example of a lunarbotics robot</i></p>

In my case, I became interested in the navigation part of this challenge as I knew something about arduino and this left like a good way to expand my knowledge. Since the robot was assumed to operate on the moon, one of the restrictions imposed on it was that it could not depend on navigation systems that are used on earth like GPS. The entire navigation system had depend on the robot itself with no external assistance. All of the sensors had to be mounted on the vehicle. In many ways, this is similar to how animals operate in that they are closed systems that depend only on internal computations to nagivate. Even "unintelligent" animals like small insects are capable of complex spatial localization all by themselves. Honey bees are a fantastic example of what insects can accomplish with their very small brains:

{% include youtube.html id='bFDGPgXtK-U' %}
<p align="center"><i>Honey bee's can fly to distant flowers then return to their hive</i></p>

This example from nature is very inspirational, as it meant it was not unreasonable to use a limited device like an arduino as a legitimate platform to develop a nagivation system. Animals require far more effective systems to locate food and survive, but the lunarbotics robot did not have such demands. It only needed to move towards a mining location and return to its original position. 

![image](https://www.researchgate.net/profile/Volker-Willert/publication/315836890/figure/fig8/AS:667946330378257@1536262223879/Odometry-results-for-the-main-robot-after-waypoint-navigation-In-red-is-shown-the.png)
<p align="center"><i>The robot would need to go back and forth across a circuit</i></p>

With this in mind, I felt confidant that a small prototype based on an arduino could be used to develop an effective navigation system that could be ported to the larger robot used for the competition. Since the larger robot (that had already been manufactured) used [treads](https://en.wikipedia.org/wiki/Continuous_track) to move above sand, it meant the prototype had to use this type of locomotion to effectively capture the dynamics of the larger vehicle. Obviously it would not capture all of the dynamics, but it would still be much better than using a wheeled platform whose behaviour differs significantly from a tracked vehicle. 

## Vehicle dynamics

To better understand the dynamics and characteristics of tracked vehicles, I wrote a python script performed a simple 2-dimensional simulation. In it, the vehicle was exponsed to arbitrary control inputs that made the treads move at different speeds. That way one could observe how the vehicle would react do maneuvres like turning at speed and rotating about its own axis, or even external factors like changes friction between the treads and the underlying surface. The most difficult part of the simulation was modelling the treads as these are _area contact_ devices, rather than _point contact_ devices like wheels. This meant the force from treads had obtained through the [definite double integral](https://tutorial.math.lamar.edu/Classes/CalcIII/DoubleIntegrals.aspx) of the friction across each track. In practice, this meant sub-dividing the tracks into multiple small contact patches and integrating the friction force of each patch over the entire contact area. 

See: <b><a href="/projects/miscellaneous/2020/09/18/tracked_vehile_sim.html">2D simulation of a tracked robot | Article and code</a></b>

Through this analysis it became clear that treads do not operate like wheels and constantly _slide_ when the vehicle is turning. We can observe this by watching a tank rotate in place about a soft surface. The parts of the tread that are farther away from the center of of the vehicle move with a tangetial velocity which causes the to slide sideways. This is true to varying degrees for every part of the treads, meaning that even during small rotations the treads are sliding and are not _rolling_.

{% include youtube.html id='jEC9cCRwfkE' %}
<p align="center"><i>The trails left by the treads highlight how the treads slide across the surface</i></p>

We can futher observe this behaviour through an animation generated by the simulation. Like in the above video, we also observe this strong sliding motion during turns. This lateral sliding gets worse as the friction between the tracks and the surface decreases, meaning that under conditions of low traction, the treads will be sliding almost all of the time.

![image](https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/refs/heads/main/example_pics/high_coeff_anim.gif)

From the perspective of navigation, these dynamics are very detrimental as it means we cannot depend on odometry to provide accurate measurements of position, be it in the short term and especially in the long term. This is due to the reality that rotating the treads will __not__ always guareentee a displacement of the vehicle. Therefore, at a minimum, we are forced to use gyrodometry to obtain somewhat-reasonable navigation, and even then its accuracy will depend greatly on the surface the vehicle is moving over. If we wish to obtain more consistant position estimates indifferent of the properties of surface, we must use __additional sensors__ that can measure displacement indifferent of the motion of the treads. 

## Inertial measurement

A simple enhancement is to make use of the __accelerometer__ that is often bundled with gyroscopes as part of an [inertial measurement unit](https://en.wikipedia.org/wiki/Inertial_measurement_unit). While we cannot measure velocity _directly_ with this device, we can still [integrate the acceleration](https://phys.libretexts.org/Bookshelves/University_Physics/University_Physics_(OpenStax)/Book%3A_University_Physics_I_-_Mechanics_Sound_Oscillations_and_Waves_(OpenStax)/03%3A_Motion_Along_a_Straight_Line/3.08%3A_Finding_Velocity_and_Displacement_from_Acceleration) measurements to obtain an estimate of velocity. This is a complicated problem in real life as we _must_ take into account the rotation of our acceleration with respect to some reference frame. Therefore, we must keep track of our heading via the gyroscope to then properly integrate the acceleration about a fixed coordinate frame. These coupled dynamics can be obtained through a [quaternion](https://graphics.stanford.edu/courses/cs348a-17-winter/Papers/quaternion.pdf) that encodes the orientation measured by the gyroscope. 

{% include youtube.html id='_q_8d0E3tDk' %}
<p align="center"><i>Direct integration of an accelerometer leads to drift</i></p>

{% include youtube.html id='htoBvSq8jLA' %}
<p align="center"><i>Short-term position can be determined with an accelerometer by filtering the raw signal</i></p>

The above problem is not trivial and is surprisingly difficult. Despite the hurdle it represents, I was able to obtain acceptable velocity and position estimates through an an accelerometer after many attempts. The solution came in the form of a modified version of the kalman filter implemented in this arduino library: [SimpleKalmanFilter](https://github.com/denyssene/SimpleKalmanFilter). In this filter, we have a variable with unknown behaviour that has a known [standard deviation](https://en.wikipedia.org/wiki/Standard_deviation). Any value of the variable that are within this error band, relative to a long-term average of the variable, will be suppressed. The end result is that the filter reacts slowly to small changes in the input variable, and reacts quickly to large changes. This works well for the problem of integrating acceleration as we can suppress small variations in the acceleration to avoid integration drift, yet we still consider large accelerations to determine the velocity. There are more details about the acceleration filter developed for this project in the following article: 

See: <b><a href="https://github.com/RCmags/imuFilter">IMU Filter based on a quaternion | Stable double integration</a></b>

## Real-time dynamic vehicle model

One of the benefits of developing the double integration algorithm was the resulting information it generated of the vehicle. Prime among these was the establishment of a coodinate frame imbedded in the heading measurement. Since we had defined a set of rectangular coodinates to measure the attitude from, we could use these coodinates to construct a 3-dimensional model of the vehicle based on the rotation of the tracks. Moreover, we could take into account friction and the sliding of the tracks to better estimate the position of the vehicle. This is essentially a more accurate way of performing odometry by considering a [dynamic](https://en.wikipedia.org/wiki/Analytical_mechanics) model that takes into account the __forces__ acting on the vehicle, rather than assuming a specific set of arbitrary motions as odometry does (which is a [kinematic](https://en.wikipedia.org/wiki/Kinematics) model).

At the center of this improved model we need way to replicate the behaviour of [friction](https://en.wikipedia.org/wiki/Friction). By itself, it is a complicated topic but if we consider simplified models of friction we can obtain usable results without much computational effort. A simple model is [coulomb friction](https://link.springer.com/chapter/10.1007/978-3-642-10803-7_10). It defines friction as a function of the _normal force_ acting on a body and seperates it into two effects: _static friction_ and _dynamic friction_. The transition between these two states is discontinuous with respect to sliding velocity, so it is not well suited for integration using numerical methods. To circumvent this issue, we can define an _approximation_ to coulomb friction that is continuous with sliding velocity. See: [Multi-Body Dynamics, B.3.1 Compliant Contact Models](https://underactuated.mit.edu/multibody.html). 

![image](https://www.researchgate.net/profile/Madalina-Dumitriu/publication/301541503/figure/fig15/AS:668711967019037@1536444765908/Force-displacement-curve-a-Coulomb-friction-model-b-Coulomb-model-with-spring-in.ppm)
<p align="center"><i>Short-term position can be determined with an accelerometer by filtering the raw signal</i></p>

The continous friction model should ideally have a very large slope when the sliding velocity is very small. This will allow to better approximate [static friction](http://hyperphysics.phy-astr.gsu.edu/hbase/frict2.html) where there is no sliding velocity, but friction can nonetheless counter any external forces and prevents the bodies from moving. This type of behaviour is not simple to represent, but the continuous friction model can be _good enough_ in certain situations. We shall assume that a tracked vehicle is one such case. However, the _need_ for a large force-velocity slope means we are in the presence of a [stiff differential equation](https://en.wikipedia.org/wiki/Stiff_equation) which can be numerically __unstable__ to solve. This means that, we must use _specialized_ numerical methods to solve for the velocity as a function of acceleration, as our friction model is very sensitive to minor changes velocity.

![image](https://www.johndcook.com/stiff25.png)
<p align="center"><i>Some equations will cause a numerical solver to become unstable and diverge</i></p>

Despite this difficulty, I eventually wrote a model that worked two distinct phases: one phase measured the net lateral acceleration felt by the tracks, and if this value exceeded a estimate for static friction coefficient (which would rapidly decrease if the vehicle rotated), it would be assumed that the vehicle did move laterally (velocity set to zero). However, if the static friction limit was below the current acceleration of the vehicle, then the continuous friction model would be used to determine the velocity through an [explicit Runga-Kutta method](https://jonshiach.github.io/ODEs-book/_pages/2.0_ERKs.html). The coefficients of the method were carefully selected to be very stable for moderately stiff equations. Meaning that, while they would diverge if the equations were too stiff, or if the __time-step__ between each iteration was too small, they were more [stable](https://jonshiach.github.io/ODEs-book/_pages/4.0_Stability.html) than other choices of coefficients.

The end result of these efforts was a model that would use as inputs the velocity of the tracks, along with the heading as measured by the gyroscope, and the acceleration from the IMU, to determine the position of the robot. On a flat surface with high friction, it perform almost the same as odometry, but once the surface became __inclined__ or if the traction was low, then the model would begin to represent a lot of lateral sliding that odometry did not capture. The cost of this additional accuracy was that the arduino had to perform far more computations. Instead of just integrating some displacements, it now had to solve a set of [ordinary differential equations](https://ocw.mit.edu/courses/18-01sc-single-variable-calculus-fall-2010/10a90cf559c88b77a41d299a9cb89572_MIT18_01SCF10_Ses39a.pdf) in real time. 

## Optical flow sensors

As an additional fallback to further increase the robustness of the navigation of the robot, I chose to use [optical flow](https://stevetheengineer.com/optical-flow/) sensors to directly measure the velocity. Unlike inertial estimates which operate in the short-term and elaborate math models which only capture parts of the vehicle's dynamics, a sensor that directly measures velocity is unambiguous. Unless something blocks the sensor or the conditions that allow it to measure velocity are no longer met, it is the most reliable authority on the state of the vehicle. Therefore, the addition of optical flow sensors to the robot is good idea, and the other methods discussed above can be use to estimate position if the optical flow sensors cannot be used.

Optical flow sensors work by using a __camera__ to take pictures of its enviroment, and each frame is compared to the previous one to determine whether there has occured a displacement. While this may sound complex, there are sensors which perform these computations automatically. Possibly the most common application for these sensors is inside optical mice. They use the sensors to track the motion of the mouse without any moving parts. It's for this reason that mice have a bright LED that shines on the surface they move across. It illuminates any small imperfections in the surface that the camera in the sensor can detect. 

{% include youtube.html id='SXQfT7c-9rU' %}
<p align="center"><i>In-depth explanation of how a computer mouse operates</i></p>

A common and inexpensive optical flow sensor is the __ADNS-3080__ which conviniently is sold is a module for arduinos. It can comunicate through the SPI protocol with arduinos and there are multitude of examples that demonstrate how to do this. Unfortunately, at the time I purchased the modules, there we no easily used libraries for this sensor. One had to write their code to use the module, or modify a working example for your own particular use. I disliked this approach as it did not easily permit using multiple sensors with the same arduino. Therefore, I wrote a library that refactored some of the available working examples into a compact and easy to use interface. That way, I could connect multiple sensors to the arduino without writting a lot of redundant code while avoiding any mistakes this could cause. 

![image](https://i.ebayimg.com/images/g/iOEAAOSwfllma39h/s-l400.jpg)
<p align="center"><i>The ADNS-3080 is sold is a module</i></p>

See: <b><a href="https://github.com/RCmags/ADNS3080">ADNS-3080 Mouse sensor library</a></b>

I eventually settled on using __two__ optical flow sensors as that was the minimum ammount required to determine both translation and rotation. In same way that odometry uses wheel rotation to determine displacements, we can replace these _inferred_ displacements with _actual_ measurements and still use the same equations. Therefore, we perform a kind of _optical odometry_ that has much higher precision. We can find examples of this type of system in multiple papers. See the following:

__PDF__: [High-Precision Robot Odometry Using an Array of Optical Mice](https://www.chiefdelphi.com/uploads/default/original/3X/5/c/5c88a2cda05443b19726c570adc061066f52d0bd.pdf)   
__PDF__: [Optical flow based odometry for mobile robots supported by multiple sensors and sensor fusion](https://www.researchgate.net/publication/305622748_Optical_flow_based_odometry_for_mobile_robots_supported_by_multiple_sensors_and_sensor_fusion)

Because the optical flow sensors measure velocity instead of position we must integrate their output to obtain position. This will induce drift and in the long run, the estimated position will __diverge__ from its actual value. However, since the velocity _directly_ measured, the rate at which the position will diverge will occur relatively __slowly__. So, while we will _eventually_ have to calibrate our position estimate, it will not have to occur that frequency. Moreover, if the divergence is slow enough, the error that is accumulated may not be large enough to matter in a given application. In case of the mining robot, if the vehicle can complete multiple excavation and drop-off cycles, then it might be nessesary to recalibrate the position in order to achieve mission success.

## Completed robot 

After the elements required to obtain the position of the robot were sufficiently developed, the actual physical robot was constructed as a final step. It consisted of the following components:

- An [Arduino MEGA](https://store.arduino.cc/products/arduino-mega-2560-rev3) to connect to the multitude of sensors. 
- Two ADNS-3080 optical flow sensors.
- An MPU-6050 IMU sensor to obtain angular velocity and acceleration.
- An [L298N H-bridge](https://projecthub.arduino.cc/Fouad_Roboticist/dc-motors-control-using-arduino-pwm-with-l298n-h-bridge-25b3b3) module to drive a set of motors.
- An Aluminum tank chasis with geared motors driving a set tracks. Each motor had a set of rotary encoders. 
- One 800 mah, 2S Lithium-Polymer battery to drive the electronics and motors. 

<br>
The assembled robot had the electronics exposed to easily modify any connections. This unfornately meant the wiring was rather messy, but it allowed a nessesary degree of flexibility as the protype was being developed.

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %}  
<p align="center"><i>The tracked prototype was small and compact</i></p>

Once the optical flow sensors were mounted on the chasis, it became apparent that they required very intense light in order to operate properly. If the lighting was too dim, they would __not__ measure any displacement. Therefore, a set of very bright LEDS were mounted beneath the robot to illuminate the surface the optical sensors were tracking. The color of the light also played an important role. At first, it was expected that _red_ would be appropiate as that is generally what computer mice use. However, for this did not work very well, and after some trial and error I noticed that __white light__ provided the most consistent motion tracking. The reason for this became evident once I observed the images generated by the cameras. White light provided the best constrast between surface features compared to blue, red, or yellow light. 

{% include image-slider.html list=page.slider2 aspect_ratio="4/3" %}  
<p align="center"><i>Bright white LEDs were placed under the chasis to illuminate the ground</i></p>

The position of the robot was estimated using all the methods mentioned above: the IMU was used to determine the heading of the robot and to estimate its short-term displacements with the accelerometer, and displacement was directly measured via the two optical flow sensors. All this data was then combined together via a [completementary filter](https://www.olliw.eu/2013/imu-data-fusing/) to obtain the position of the robot relative to an initial position. These position and orientation estimates were used to guide the vehicle to a specified coordinate using two [PID controllers](https://en.wikipedia.org/wiki/Proportional%E2%80%93integral%E2%80%93derivative_controller) that set the required heading and lateral displacement. 

Since the navigation algorithm considered the full __3-dimensional position__ of the robot, it was possible to precisely control it across uneven or inclined surfaces. These target coordinates were stored in a buffer that could be filled in real time via a bluetooth module. Once the vehicle lay within a given radius of a coordinate, the following coodinate in the buffer was made the new target destination. This process would continue indefinitely and the vehicle would follow a closed path formed by the stored coodinates. The end result of all this behavior can see in below:

{% include youtube.html id='VYhLW5owS3A' %}
<p align="center"><i>The autonomous robot worked well with acceptable accuracy</i></p>

Its plain to see the robot worked pretty well. It did drift from its original position when asked to move over very large distances, but  the error was rather small relative to its trayectory. For such a small and crude prototype, it demonstrated the feasability of the position estimation methods discussed in this article. In particular, the succesful use of an __accelerometer to obtain position__, even if in the short run, is especially noteworthy. 

### Github Repo:
The code for the project can be found in the following repository:
[TrackRobot](https://github.com/RCmags/TrackRobot)

__Note__: Some versions of the code are written using older versions of the libraries it depends on. This is because the navigation code was being written at the same time as its implementation with the robot controller. 
