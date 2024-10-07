---
layout: post
title: "Sensor fusion algorithm for an IMU based on a quaternion"
---

# Old version ----------

This library contains a sensor fusion algorithm to combine the outputs of a 6-axis inertial measurement unit (IMU). It's based on a modified version of the Mahony filter that replaces the PI controller with something akin to a 2nd order low pass filter. The proportional term was removed and the integral term has been forced to decay in order to damp the system. The correction steps of each filter are shown below:

- Mahony:  
_integral += error.dt   
dtheta = theta_dot.dt + kp.error + ki.integral_  

- Modified Mahony:  
_integral += error.kp - integral.kc    
dtheta = theta_dot.dt + integral_  

The behavior of the modified filter is analogous to spring-mass system. Kp (stiffness) and Kc (damping) are related by the damping ratio Q which is held constant. This allows the behavior of the filter to be controlled via a single parameter.  

The filter uses a quaternion to encode rotations. This makes it easy to perform coordinate transformations. These include:  
- Transfor a vector from the local frame to the global (and vice versa)
- Get unit vectors of the X, Y and Z axes in the local or global frame.

Since a 6-axis IMU has no absolute reference for heading there is a function to rotate the orientation estimate about the yaw axis. Basic vector operations have been included to easily implement a heading correction algorithm should one have an additional sensor (such a magnetometer or some other absolute heading sensor).

For more information on the Mahony filter see these links:
- [IMU Data Fusing: Complementary, Kalman, and Mahony Filter](http://www.olliw.eu/2013/imu-data-fusing/#chapter23)
- [Mahony Filter](https://nitinjsanket.github.io/tutorials/attitudeest/mahony)

---

# Original =========

# imuFilter
This library fuses the outputs of an inertial measurement unit (IMU) and stores the heading as a quaternion. It uses a _kalman-like_ filter to check the acceleration and see if it lies within a deviation from (0,0,1)g. If the acceleration is within this band, it will strongly correct the orientation. However, if the acceleration lies outside of this band, it will barely affect the orientation. To this end, the deviation from vertical is used to update the variance and kalman gain: 

$\ \overrightarrow{a_{rel}} = \overrightarrow{a_{local}} - (0,0,1) $

$\ K_{\sigma} = 1/(1 + \frac{ {\sigma}^2 }{ {\sigma}_{acc}^2 } ) $

$\ {\sigma}^2 = | \overrightarrow{a_{rel}} |^2 + K_{\sigma}{\sigma}^2 $ 

The kalman gain then scaled by a delay parameter and used to correct the attitude. This scaling allows the filter to act like a 1rst-order low pass filter that smoothens the acceleration at the cost of slower response: 

$\ E_{k} = \theta_{accel} - \theta_{k-1} $

$\ K_{\theta} = {\alpha} K_{\sigma} {\Delta t} $

$\ \theta_{k} = \theta_{k-1} + \dot{\theta}{\Delta t} + K_{\theta}E_{k} $

As the filter uses a quaternion to encode rotations, it's easy to perform coordinate transformations. The library has functions to:
- Transfor a vector to the local or global frame.
- Get the unit vectors of the X, Y and Z axes in the local or global frame.

Moreover, since a 6-axis IMU (gyro-accelerometer) cannot measure an absolute heading, a function is included to rotate the orientation about the vertical (yaw) axis. One can use vector operations to correct the heading with an additional sensor like a magnetometer.

# Velocity estimate
The library can integrate acceleration to obtain an estimate of velocity. This is accomplished by using a set of Kalman-like filters like the one shown above. The acceleration is checked against a rest condition of (0,0,0)g and any deviations that lie within a specified uncertainty band are suppressed. This eliminates much of the bias due to gravity or miscalibration:

$\ K_{acc} = 1/(1 + \frac{ S_{acc}^2 }{ {\sigma}_{acc}^2 } ) $

$\ S_{acc}^2 = | \overrightarrow{a_{rel}} |^2 + K_{acc}S_{acc}^2 $ 

$\ a_{k} = a_{k} - \overline{a_{k}} $

$\ \overline{a_{k}} = \overline{a_{k-1}} + K_{acc}{a_{k}} $

Afterward, the deviation of the velocity (relative to a known target velocity), along with the variance of the acceleration, is used to determine the Kalman gain of the velocity. This relationship causes small velocity changes or small accelerations to reduce the gain, and the velocity is forced to match the target velocity:  

$\ \Delta{V} = V_{k-1} - V_{target} $

$\ S_{vel}^2 = | \overrightarrow{ {\Delta}V } |^2 + K_{vel}S_{vel}^2 $ 

$\ K_{vel} = 1/(1 + ( \frac{ S_{vel} S_{acc} }{ \sigma_{vel} \sigma_{acc} } )^2 ) $

The velocity is then updated using the trapezoidal rule to integrate the filtered acceleration:

$\ V_{k} = V_{k-1} + K_{vel}{\Delta}{V} + \frac{dt}{2}( a_{k} + a_{k-1} ) $

# Dependecies
This library depends on the [vector_datatype](https://github.com/RCmags/vector_datatype) library.

# References
The form of the filter is inspired by the [SimpleKalmanFilter](https://github.com/denyssene/SimpleKalmanFilter) library.


### Github Repo:
[imuFilter](https://github.com/RCmags/imuFilter)
