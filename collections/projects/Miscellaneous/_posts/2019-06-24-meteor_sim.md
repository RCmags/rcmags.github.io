---
layout: post
title: "Simple meteor simulator displayed on a terminal"
---

One time I was dating a girl, and to give her a birthday present I decided to make her a __terminal program__. It's a bit weird make someone a _terminal program_ out of all things, but at the time, I was learning how to program, and I figured this was a good excuse to simply work on another coding project. The gist of this project was to make a simulation of a meteor that collided against a planet. After the collisions had settled down, a surprise message would appear that would display a corny birthday message.

![image](/img/meteor-sim/terminal.png)
<p align="center"><i>What a beautiful birthday gift</i></p>

Since the program was centered around a terminal, it was necessary to be able to generate an image with this interface. Obviously, it would be a pixelated image since the terminal has fixed pixels in its grid. It would also be necessary to change the color of each pixel in order to generate a nice image. Otherwise, everything would have the same color and only the outline would be seen. The discrete nature of the terminal also meant that the motion of the meteor would have to be determined through integer values rather than floating point values. This made integration very simple as it just involved an accumulator. However, it decreased the precision of the simulation so certain situations would have to be avoided to not cause [numerical instability](https://en.wikipedia.org/wiki/Numerical_stability).

A collision system would also have to be developed to detect whenever the meteor hit something. To this end, I used a simple model where each body had  apre-determined [bounding boxe](https://developer.mozilla.org/en-US/docs/Games/Techniques/3D_collision_detection). This included the meteor, a planet, and the world itself. The logic was that whenever the bounding boxes intersected, the momentum of the meteor would be redirected. If the meteor reached the boundary of the world, it would elastically collide the boundary and continue to bounce around in the confined space. If the meteor hit the planet, the collision would be [inelastic](https://en.wikipedia.org/wiki/Inelastic_collision) and the momentum would decay with each impact. It was fun to work on this problem, as at the time, I had recently taken an engineering dynamics course so I got to implement the physics that I had learned.

![image](https://raw.githubusercontent.com/RCmags/MeteorSim/main/img/meteor_motion.gif) 
<p align="center"><i>The meteor could orbit and collide with the planet</i></p>

The end result was pretty good. The collision model worked and the meteor would bounce around in space. I would recommend anyone with an interesting in coding to make a similar project. Making images and interfaces with a terminal is surprisingly fun and the results can be quite good. It's also a good skill to have since simpler than making a __graphical interface__ for a program. This type of project also serves as a good introduction to [command line interfaces](https://en.wikipedia.org/wiki/Command-line_interface), which are ubiquitous in more serious projects.

![image](https://raw.githubusercontent.com/RCmags/MeteorSim/main/img/menu_pic.png)
<p align="center"><i>A simple command line interface let you play with the meteor</i></p>

### Github Repo:
The code for this project can be found at the following repository: [MeteorSim](https://github.com/RCmags/MeteorSim). The code will need to be compiled for your computer using [Microsoft Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) due to dependending on the [conio.h](https://en.wikipedia.org/wiki/Conio.h) library. 
