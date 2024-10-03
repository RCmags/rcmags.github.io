---
layout: post
title: "Simple meteor simulator displayed on a terminal"
---

One time I was dating a girl, and as part of a birthday project, they decided to make her a small terminal program. That would have been a fun little gift.
It's a bit weird maybe to make someone a terminal program out of all things, but I figured it would have been simple to execute and would have been fun as a computer science project.
At the time, I was learning how to program in different languages, so I figured this would have been a good excuse to simply work on another project.
The gist of this project was to make a simulation of a meteor. And then at the end of the collisions, a surprise message would appear at the end of the program. In this case, with some corny, happy birthday messages.

Since the program around the terminal, it was necessary to be able to generate an image with this interface. Obviously, this would have to be a pixelated image since the terminal just illuminates a series of pixels in its grid.
It would also be necessary to change the color of each pixel in order to generate a nice image. Otherwise, everything would have the same color and only the outline could be drawn.
The stepped nature of the terminal also meant that the motion of the meteor or anything else in the space would have to be discrete. So the position of any object would actually have to be determined by an integer value rather than a floating point value.
This made any integration very simple as it just involved some addition, an accumulator. However, it did decrease the precision of the simulation. So certain situations would have to be avoided to not cause the motion of the meteor to become unstable.
A collision system would also have to be developed so that whenever the meteor hit something, in this case a planet, which was the idea to have in the middle of the screen, that it could detect that collision and then it react accordingly.
A simple inelastic collision model was used where the momentum of the meteor was preserved, such that it could be made to decay after each impact.
At the time, I had recently taken an engineering dynamics course, so it felt like a nice use of the physics that I had learned to implement this collision model.


Once I completed the project, the end result was pretty good. The meteor could bounce around in this space, and the collision model worked all right. Moreover, the collision model ended up being used for the walls, since the meteor moved in was finite, so it just bounced elastically off this confine like a pinball.
I would totally recommend anyone make a similar project simply because making graphical images or interfaces with a terminal is surprisingly fun and the results can be actually quite good. And to some extent, it's also simpler than using an actual graphical interface. So it's definitely a good skill or experience to have.
This can also be considered an introduction to command line interfaces, which are ubiquitous in much more serious projects. So that ability is also a positive thing to acquire.

---

This is a program that attempts to simulate a meteor around a planet through the windows console. 
The code uses the [conio.h](https://www.programmingsimplified.com/c/conio.h) library to move the cursor and change the text color.
It's fairly simple to use and has a small menu that is executed at the start of the program. 
In case the the meteor reaches the boundary of the console, 
it will elastically collide the boundary and continue to bounce around the confined space.  

![image](https://raw.githubusercontent.com/RCmags/MeteorSim/main/img/meteor_motion.gif)  

![image](https://raw.githubusercontent.com/RCmags/MeteorSim/main/img/menu_pic.png)

### Github Repo:
[MeteorSim](https://github.com/RCmags/MeteorSim)
