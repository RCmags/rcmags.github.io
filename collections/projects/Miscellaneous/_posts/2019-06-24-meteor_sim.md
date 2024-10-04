---
layout: post
title: "Simple meteor simulator displayed on a terminal"
---

One time I was dating a girl and to give her a birthday present I decided to make her a small terminal program. It's a bit weird make someone a terminal program out of all things, but at the time, I was learning how to program in different languages, and I figured this would have been a good excuse to simply work on another coding project. The gist of this project was to make a simulation of a meteor that collided against a planet. After the collisions had settled down, a surprise message would appear that displayed corny happy birthday messages.

![image](https://www.lifewire.com/thmb/zyY3p9eZutbT2qG0CSU3ifYzFR0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/windows-terminal-4fd5502f69374c75a8189796c6691ad9.png)

Since the program was centered around the terminal, it was necessary to be able to generate an image with this interface. Obviously, it would be a pixelated image since the terminal has fixed pixels in its grid. It would also be necessary to change the color of each pixel in order to generate a nice image. Otherwise, everything would have the same color and only the outline would be seen. Since I was using Windows at the time, I used the [conio.h](https://www.programmingsimplified.com/c/conio.h) library to move the terminal cursor and change the color.

The discrete nature of the terminal also meant that the motion of the meteor would have to be determined through integer values rather than floating point values. This made integration very simple as it just involved an accumulator. However, it decreased the precision of the simulation so certain situations would have to be avoided to not cause numerical instability.

A collision system would need to be developed to detect whenever the meteor hit something. A simple model was used wherein each body in this space, which included a meteor, a planet, and the world itself had pre-determined bounding boxes. Whenever the bounding boxes intersected, the momentum of the meteor would be redirected. If the meteor reached the boundary of the console, it would elastically collide the boundary and continue to bounce around in the confined space. If the meteor hit the planet, the collision would be inelastic and the momentum would decay with each impact. At the time, I had recently taken an engineering dynamics course so it felt nice to use the physics that I learned to implement this model.

![image](https://raw.githubusercontent.com/RCmags/MeteorSim/main/img/meteor_motion.gif)  

Once I completed the project, the end result was pretty good. The meteor could bounce around in this space, and the collision model worked well. I would totally recommend anyone make a similar project. If anything because making images and interfaces with a terminal is surprisingly fun and the results can be quite good. To some extent, it's also simpler than using an actual graphical interface, so it's definitely a good skill to have. This type of project can also be considered an introduction to command line interfaces, which are ubiquitous in much more serious projects and is a positive topic to learn about. 

![image](https://raw.githubusercontent.com/RCmags/MeteorSim/main/img/menu_pic.png)

### Github Repo:
The code for this project can be found at the following repository: [MeteorSim](https://github.com/RCmags/MeteorSim)
The code will need to be compiled for your computer using the Windows operating system. 
