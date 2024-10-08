---
layout: post
title: "Review | Sensor fusion algorithm for an IMU based on a quaternion"
---
[MPU-6050](/projects/arduino libraries/2020/07/11/mpu6050.html)
[vector and quaternion library](/projects/arduino libraries/2020/09/20/3d_datatypes.html)
[autonomous tracked robot](/projects/robots/2020/05/10/autonomous_tracked_vehicle.html)

# Introduction 
In the process of developing an autonomous tracked robot, it was deemed critical to develop a system to keep track of the heading of the vehicle. This entailed using something to combine the information from an inertial measurement unit into a useful heading estimate. The process of combining this information is called sensor fusion, and this could be accomplished through a properly designed algorithm. At the core of the algorithm would be a mechanism to encode the orientation of the sensor. This can be through the use of rotation matrices or through a quaternion. In this particular case, it is best to use a quaternion because it is mathematically simpler than a rotation matrix. It does not require extensive use of sine and cosine functions, and all of the heading can be encoded through four individual numbers. This simplicity meant that it was well suited for an algorithm that had to be constantly executed, as it was computationally inexpensive to repeat any computations. 

A separate vector and quaternion library was developed to handle the math behind manipulating quaternians and any vectors that the quaternians would act upon. These data types were then used by the sensor fusion algorithm to perform its heading computations. The fusion algorithm was then extensively tested through a MPU-6050 inertial measurement unit. Yet another library was especially developed to interface the MPU-6050 with an Arduino. Therefore, the sensor fusion algorithm depended on two custom libraries to make a working system. We can consider this system to be a filter that acts upon the raw data of the sensor. Therefore, the sensor fusion algorithm can also be called a IMU filter as it filters the information of the inertial measurement unit.


# Initial PID-based filter 
The initial form of the fusion algorithm was based on pre-existing IMU filters. It's based on a modified version of the Mahony filter that replaces the PI controller with something akin to a 2nd order low pass filter. The proportional term was removed and the integral term has been forced to decay in order to damp the system. For more information on the Mahony filter see these references:
- [IMU Data Fusing: Complementary, Kalman, and Mahony Filter](http://www.olliw.eu/2013/imu-data-fusing/#chapter23)
- [Mahony Filter](https://nitinjsanket.github.io/tutorials/attitudeest/mahony)

<br>
The correction steps of each filter are shown below:

- Mahony:  
{%include image.html src="/img/imu-filter/equations1/equation1.png" %}
{%include image.html src="/img/imu-filter/equations1/equation2.png" %}

<!-- LATEX:
I_e  = \int_{0}^t{e(t)dt}
d{\theta} = \dot{\theta}{dt} + K_{p}{e_t} + K_{i}I_{e}
-->

- Modified Mahony:  
{%include image.html src="/img/imu-filter/equations1/equation3.png" %}
{%include image.html src="/img/imu-filter/equations1/equation4.png" %}

<!-- LATEX:
I_e  = \int_{0}^t{(K_{p}e(t) - K_{c}{I_e})dt}
d{\theta} = \dot{\theta}{dt} + I_{e}
-->

The behavior of the modified filter is analogous to spring-mass system. Kp (stiffness) and Kc (damping) are related by the damping ratio Q which is held constant. This allows the behavior of the filter to be controlled via a single parameter. The filter then uses a quaternion to encode rotations. This makes it easy to perform coordinate transformations. These include:  

- Transfor a vector from the local frame to the global (and vice versa)
- Get unit vectors of the X, Y and Z axes in the local or global frame.

<br>
Since a 6-axis IMU has no absolute reference for heading, there is a function to rotate the orientation estimate about the yaw axis. Basic vector operations were included to easily implement a heading correction algorithm should one have an additional sensor (such a magnetometer or some other absolute heading sensor).


# Updated Kalman-like filter
The sensor fusion algorithm was eventually rewritten by considering a completely different approach to the problem. Rather than developing an arbitrary system that behaved similarly to a mass attached to a spring, it was better to consider the statistical noise of the gyroscope and accelerometer. This is the approach taken by the analytically derived kalman filter. In particular, I took inspiration from the implementation of a [1D Kalman filter](https://github.com/denyssene/SimpleKalmanFilter) for arduino. 

#### Heading estimate:
The sensor fusion algorithm uses a _kalman-like_ filter to check the acceleration and see if it lies within a deviation from (0,0,1)g. If the acceleration is within this band, it will strongly correct the orientation. However, if the acceleration lies outside of this band, it will barely affect the orientation. To this end, the deviation from vertical is used to update the variance and kalman gain: 

{%include image.html src="/img/imu-filter/equations/equation1.png" %}
{%include image.html src="/img/imu-filter/equations/equation2.png" %}
{%include image.html src="/img/imu-filter/equations/equation3.png" %}

The kalman gain then scaled by a delay parameter and used to correct the attitude. This scaling allows the filter to act like a 1rst-order low pass filter that smoothens the acceleration at the cost of slower response: 

{%include image.html src="/img/imu-filter/equations/equation4.png" %}
{%include image.html src="/img/imu-filter/equations/equation5.png" %}
{%include image.html src="/img/imu-filter/equations/equation6.png" %}

This approach of using the acceleration's magnitude to determine when to use the vector to correct the heading was very effective. 
It ensured that the heading would not be disturbed by sudden or prolonged rapid accelerations in any direction.
Only situations where the accelerometer was in the acceptable deadband, did the heading get corrected. These only occurred when the accelerometer was either at rest or in a state of constant linear motion.
This is a much better approach than the initial version of the IMU filter that depended upon an arbitrary spring mass system to combine the accelerometer and gyroscope rating. In this case, the accelerometer would always correct indifferent of whether it was true or not the heading of the heading of the estimate.


#### Velocity estimate:
The library can integrate acceleration to obtain an estimate of velocity. This is accomplished by using a set of Kalman-like filters like the one shown above. The acceleration is checked against a rest condition of (0,0,0)g and any deviations that lie within a specified uncertainty band are suppressed. This eliminates much of the bias due to gravity or miscalibration:

{%include image.html src="/img/imu-filter/equations/equation7.png" %}
{%include image.html src="/img/imu-filter/equations/equation8.png" %}
{%include image.html src="/img/imu-filter/equations/equation9.png" %}
{%include image.html src="/img/imu-filter/equations/equation10.png" %}

Afterward, the deviation of the velocity (relative to a known target velocity), along with the variance of the acceleration, is used to determine the Kalman gain of the velocity. This relationship causes small velocity changes or small accelerations to reduce the gain, and the velocity is forced to match the target velocity:  

{%include image.html src="/img/imu-filter/equations/equation11.png" %}
{%include image.html src="/img/imu-filter/equations/equation12.png" %}
{%include image.html src="/img/imu-filter/equations/equation13.png" %}

The velocity is then updated using the trapezoidal rule to integrate the filtered acceleration:

{%include image.html src="/img/imu-filter/equations/equation14.png" %}

This approach led to a fairly decent estimation of velocity for short periods of time.
The sensor would have to rapidly accelerate, then decelerate to get a accurate reading. If the operation was very prolonged or if the acceleration only occurred in one direction then did not reverse, the output of this algorithm would decay very rapidly to whatever target value was established.
Therefore, it was only well suited for short-term disturbances rather than large, long-term readings of velocity. For that type of information, another sensor would need to be used.


# Conclusions
The IMU filter was a very challenging project. It required developing additional libraries which were projects in of their own. Not only this, but developing a robust algorithm that could accurately determine heading, while not being distorted by unnecessary noise in the acceleration that was being measured was also challenging. It required careful analysis of the readings of the accelerometer to understand when it was prudent to use its data and when it was not. This complexity and difficulty was especially true when trying to convert the accelerometer values into useful estimates of velocity and position. Just getting a stable reading of velocity was very difficult as integrating the acceleration directly leads to massive instability. Therefore, whatever algorithm handled the integration of acceleration had to simultaneously rapidly suppress any deviations in the velocity estimate due to acceleration, but at the same time be responsive to any sudden changes in the acceleration to know when to integrate it.

In the end, the Kalman-like system that was devised may have not been the best algorithm to obtain velocity estimates, but it worked, and it was simple. After a point, it became clear that there are limitations to what an algorithm can do if the sensor behind it is simply not very accurate. Evidently, some of this was the case with the MPU 60-50 since it's a very cheap and inexpensive sensor. If a much more expensive IMU was used with the filter, it's very possible that the velocity estimates would be much better. Notwithstanding any limitations of inherent in the sensors, it's also possible to use completely different approaches to estimate velocity and orientation. For example, it's possible to use neural networks to provide very strong estimates based on the precise analysis of a lot of data correlating it with known displacements.

See: [Robust Double Integration - RIDI](https://github.com/higerra/ridi_imu)

{% include youtube.html id='IroLp5VOPDE' %}    
<p align="center"><i>Its possible to use large data sets to train a fusion algorithm</i></p>


# Github repository
The filter library can be downloaded directly from the Arduino Library catalog. It can also be downloaded from its GitHub repository found at the following link: [imuFilter](https://github.com/RCmags/imuFilter)
