---
layout: post
title: "2D simulation of a tracked vehicle"

slider1:
- url: https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/main/example_pics/high_coeff_anim.gif
- url: https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/main/example_pics/med_coeff_anim.gif
- url: https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/main/example_pics/low_coeff_anim.gif
---

As part of the project to develop an __autonomous tracked robot__, I created a small script to simulate the motion of such a vehicle in two dimensions. This would allow me to experiment with parameters that are more difficult to control in real life, such as the [friction](https://en.wikipedia.org/wiki/Friction) between the surface and the [tracks](https://en.wikipedia.org/wiki/Continuous_track), or the dimensions of the treads. At the core of the simulation was a model for friction. This is a complicated force with non-linear behavior. Therefore, the model had to be chosen carefully to accurately represent realistic behavior while also being simple enough to avoid high computational costs.

See: <b><a href="https://rcmags.github.io/projects/robots/2020/05/10/autonomous_tracked_vehicle.html">Autonomous Tracked Robot | Project Review</a></b>

A good compromise was a modified model of [Coulomb friction](https://link.springer.com/chapter/10.1007/978-3-642-10803-7_10), wherein the force due to friction depended only on the sliding velocity of the rubbing surfaces. This is not entirely accurate, as in the Coulomb model (as well as in real life), static friction is a prevalent behavior. Under these conditions, the two rubbing surfaces do not slide relative to each other but adhere to one another, resulting in no sliding velocity between the two surfaces.

![image](/img/tracked-robot/smooth-friction.png)  
<p align="center"><i>Friction can be approximated as a non-linear damping force</i></p>

In the modified Coulomb model, the two surfaces will always move relative to each other. However, the velocity of this motion can be very small by making the [slope](https://en.wikipedia.org/wiki/Slope) of the friction with respect to velocity very steep. This means that even the most minute sliding velocity generates a large reaction force, which keeps the displacements of the two surfaces very low. In transient situations where friction only applies a force for short periods, these displacements can be small enough to be considered irrelevant. Therefore, the modified Coulomb model provides a reasonable approximation of the actual behavior of friction.

![image](/img/tracked-robot/wheel-contact.png)
<p align="center"><i>An ideal wheel rolls about a contact point</i></p>

Unlike a _wheeled vehicle_ that distributes its weight across _small patches_ that can be assumed to be points of contact, a tracked vehicle distributes its weight over a much larger area. This means that the friction force is distributed across this area and not concentrated at a single point. If we subdivide the contact area into a grid of elements, the friction acting on these elements can be [numerically integrated](https://en.wikipedia.org/wiki/Numerical_integration). These sums can then be used to estimate the net force and torque acting on an individual track. By repeating these computations for both tracks, we can combine these forces to obtain the net force acting on the vehicle.

![image](/img/tracked-robot/double-integral.jpg)
<p align="center"><i>Friction had to be integrated across the surface area of the tracks</i></p>

The net force and torque can be integrated twice to find the vehicle's instantaneous velocity and position. These velocity estimates are fed back into the friction model to calculate a new iteration of velocity and position. This results in a system of __ordinary differential equations__ that are solved simultaneously with each estimate for the net friction of the tracks. The solution to these equations provides the _state_ of the vehicle, which consists of the rectangular coordinates of the center of the chassis and the angle of the vehicle with respect to the coordinate axes. The simulation was written in [Python](https://www.python.org/downloads/) since it could easily perform these computations and animate the results. The [Matplotlib library](https://matplotlib.org/) was used to create a small drawing of the vehicle and to illustrate the vehicle's trajectory. This way, it was possible to view the vehicle's path and how it moved in real time. This animation was displayed at the end of the program, once it completed the computations for the simulation. Here are some examples of the script's output:

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %} 
<p align="center"><i>Friction greatly affected the trajectory of the vehicle during turns</i></p>

When we analyze the motion of the vehicle, it's clear that the __friction coefficient__ played a significant role in its behavior, especially during turns. When the friction was very high, the tracks behaved similarly to a set of wheels located at the center of the tracks. However, if the friction was very low, the tracks would continuously slide during a turn. In the animations, it can be seen that there are sections of the tracks whose _instantaneous velocity_ does not align with the velocity of the vehicle. The track that was farther from the [instantaneous center of rotation](https://en.wikipedia.org/wiki/Instant_centre_of_rotation) would slide more than the inward-facing track. This is because the length of the chassis caused the outermost track to have a larger tangential velocity, leading to more local sliding.

![image](/img/tracked-robot/tracked-diagram.jpg)
<p align="center"><i>The simulation considered the position and angle of the vehicle</i></p>

We can better understand this local sliding of the tracks by subdividing it into small sections and considering each one as a small wheel. Since a track does not have steering, all of the "wheels" must rotate in the same direction. However, because they are at different radial positions relative to the center of rotation, they will move in a direction that is not tangential to the radial direction. Therefore, each "wheel" lacks the equivalent of an [Ackerman mechanism](https://en.wikipedia.org/wiki/Ackermann_steering_geometry) to provide the necessary steering to avoid sliding.

![image](/img/tracked-robot/ackerman-steering.jpg)
<p align="center"><i>Wheels must rotate tangentially to the center of rotation to avoid sliding</i></p>

These simulations clearly showed that a tracked vehicle would be incapable of using [odometry](https://en.wikipedia.org/wiki/Odometry) to navigate. Tracks, especially under low-friction conditions, would slide too much to be used to measure displacements. This means that rotating the tracks did not always ensure the vehicle actually moved across the surface it was in contact with. In conclusion, this project taught me that simulating a vehicle before attempting to build it is extremely useful. It allows us to address unexpected behavior and gain a far better intuitive feel for what the vehicle will do. With this information, we can create closed-loop control systems that can compensate for these deficiencies or discard the vehicle as inadequate for our intended purposes.

### Github Repository
The simulation can be run by executing the Python file included in the repository. The code will then perform the simulation based on a series of arbitrary control inputs, which can be modified by opening the script and rewriting the "__inputVel__" function. The animation will then be saved as a video next to the Python file. To download the file, see the following link: [TrackVehicleSimulation](https://github.com/RCmags/TrackVehicleSimulation)
