---
layout: post
title: "2D simulation of a tracked vehicle"

slider1:
- url: https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/main/example_pics/high_coeff_anim.gif
- url: https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/main/example_pics/med_coeff_anim.gif
- url: https://raw.githubusercontent.com/RCmags/TrackVehicleSimulation/main/example_pics/low_coeff_anim.gif
---

As part of the project to develop an autonomous tracked robot, I made a small script to simulate the motion of such a vehicle in two dimensions. This would allow me to experiment with parameters which are more difficult to control in real life, such as the friction between the surface and the tracks, or the dimensions of the treads. At the core of the simulation would be a model for friction. This is a complicated force which has non-linear behavior. Therefore, the model had to be chosen carefully to be accurate enough to represent realistic behavior, but also being simple enough to not be computationally very expensive. 

See: <b><a href="https://rcmags.github.io/projects/robots/2020/05/10/autonomous_tracked_vehicle.html">Autonomous Tracked Robot | Project Review</a></b>

A good compromise was a modified model for Coulomb friction, wherein the force due to friction only depended on the sliding velocity of the rubbing surfaces. This is not entirely accurate as in the Coulomb model (as well as in real life), static friction is a behavior that  is very prevalent. Under these conditions, the two rubbing surfaces do not slide relative to each other, but adhere to one another so there is no sliding velocity between the two surfaces.

![image](/img/tracked-robot/smooth-friction.png)  
<p align="center"><i>Friction can be approximated as a non-linear damping force</i></p>

In the modified Coulomb model, the two surfaces will always move relative to each other. However, the velocity of this motion can be very small by making the slope of the friction with respect to velocity very large. This means that even the most minute sliding velocity generates a large reaction force, which keeps the displacements of the two surfaces very low. In transient situations where friction only applies a force for short periods of time, these displacements can small enough to be irrelevant. Therefore, the modified Coulomb model provides a reasonable approximation to the actual behavior of friction. 

![image](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fd10lpgp6xz60nq.cloudfront.net%2Fphysics_images%2FALN_PHY_MOD_1_KIN_E01_003_Q01.png&f=1&nofb=1&ipt=2d932402475a8a36ba00671d02dc8ca097ddf57b1c7c9916d92572859e82d8cc&ipo=images)
<p align="center"><i>An ideal wheels rolls about a contact point</i></p>

Unlike a wheeled vehicle that distribute their weight across small patches that can be assumed to be points of contact, a tracked vehicle distributes its weight across a large area. This means that the friction force is distributed over an area and not concentrated at a single point. If we sub-divide the contact area into a grid of elements, the friction acting on these elements can be numerically integrated, and these sums can be used as estimate the net force and torque acting on an individual track. By repeating these computations for two tracks, these force can combined to obtain the net force acting on the vehicle.

![image](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3.us-east-2.amazonaws.com%2Fhartleymathbc180f0aa10147f0b1ef6d0521a12073%2Fpublic%2Fimages%2FVolumeDoubleIntegral.jpg&f=1&nofb=1&ipt=cde6782cb23f80352fb2dc64b4df318371764b2228fc68cd7d98956fe5ca4322&ipo=images)
<p align="center"><i>Friction had to integrated across the surface area of the tracks</i></p>

The net force and torque can be integrated twice to find the vehicle's instantaneous velocity and position. These velocity estimates are fed back into the friction model to calculate a new iteration of velocity and position. This results in a system of ordinary differential equations that are solved simultaneously with help of the estimates for the net friction of the tracks. The solution to these equations provides the state of the vehicle, which consisted of the rectangular coordinates of the center of the chassis, and angle of the vehicle with respect to the coordinate axes. The simulation was written in __Python 3__ since it could easily perform these computations and to animate the results. The Matplotlib library was used to make a small drawing of the vehicle and it was also used to draw the trajectory of the vehicle. That way, it was possible to view the trajectory of the vehicle and how it moved across this path in real time. This animation was displayed at the end of the program once it completed the computations for the simulation. Here are some examples of the script's output:

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %} 
<p align="center"><i>Friction greatly affected the trajectory of the vehicle during turns</i></p>

When we sit back and analyze the motion of the vehicle, it's obvious that the friction coefficient played a very large role in the behavior of the vehicle, especially during turns. When the friction was very high, the tracks behaved very similar to a set of wheels located at the center of the tracks. However, if the friction was very low, the tracks would continuously slide throughout a turn. In the animations, it can be seen that there are sections of the tracks whose instantaneous velocity does not align with the velocity of the vehicle. The track that was located farther away from the instantaneous center of rotation would slide more than the inward facing track. This is because the length of the chassis caused the outermost track to have a larger tangential velocity and that induced more local sliding.

![image](https://www.researchgate.net/publication/308764140/figure/download/fig10/AS:1086742568402968@1636111027330/Schematic-drawing-of-tracked-vehicle.jpg)
<p align="center"><i>The simulation considered the postion and angle of the vehicle</i></p>

We can better understand this local sliding of the tracks by subdividing it into small sections and considering each one as a small wheel. Since a track does not have steering, all of the "wheels" must rotate in the same direction. But because they are at different radial positions relative to the center of rotation, they will move in a direction which is not tangential to the radial direction.
Therefore each "wheel" is lacking the equivalent of Ackerman steering to provide this necessary steering that would be needed to have no sliding.

![image](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.racecar-engineering.com%2Fwp-content%2Fuploads%2F2021%2F04%2FFigure-1-1024x584.jpg&f=1&nofb=1&ipt=ae074d2b8cccdf9489169ba88255dad0400c5cf33b2ec1ce7a834ee6d65bc466&ipo=images)
<p align="center"><i>Wheels must rotate tangetially to the center of rotation to avoid sliding</i></p>

It was obvious through these simulations that a tracked vehicle would be incapable of using odometry to navigate. Tracks, especially during low friction conditions, would slide far too much to be used to measure displacements. This meant that rotating the tracks did not always ensure the vehicle actually moved across the surface it was in contact with. In conclusion, this project taught me that simulating a vehicle before attempting to build it is very useful. It allows us to take action against unexpected behavior and to have a far better intuitive feel for what the vehicle will do. In light of this information, we can create closed-loop control systems that can compensate for these deficiencies, or we can discard this vehicle as inadequate for the purposes we have in mind.

### Github repository
The simulation can be run executing the python file included in the repository. The code will then perform the simulation based on a series of arbitrary control inputs, which can be modified by opening the script and rewriting the "__inputVel__" function. The animation will then be saved as a video next to the python file. To download the file, see the following link: [TrackVehicleSimulation](https://github.com/RCmags/TrackVehicleSimulation)
