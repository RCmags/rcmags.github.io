---
layout: post
title: "Simulation of a four-bar linkage"
---

This is a simple 2D simulation of a four bar linkage written in __python 2__. The lengths of the bars can be changed at the start of the program, as can the mass of the driving and driven bars. For simplicity, the intermiate bar that acts as a conrod is assumed to be massless. Other inputs are the initial angular velocity of the driving bar and a constant external torque acting on said bar. 

As the system reduces to a single degree freedom, only one variable is solved for, mainly, the angle of the driving bar with respect to the horizontal. The solution to the resulting differential equation is then used to control the angle of the input bar during the animation phase of the program. 

The output is a canvas animation of the linkage mechanism rotating under the absense damping forces (System energy is conserved). This animation can then be saved as a video that is created in the same location as the .py file. 

Here are some examples of the script's output: 
![image](https://raw.githubusercontent.com/RCmags/FourBarSimulation/main/example_pics/short_bar_anim.gif)
![image](https://raw.githubusercontent.com/RCmags/FourBarSimulation/main/example_pics/short_graph.png)  

![image](https://raw.githubusercontent.com/RCmags/FourBarSimulation/main/example_pics/long_bar_anim.gif)
![image](https://raw.githubusercontent.com/RCmags/FourBarSimulation/main/example_pics/long_graph.png)

### Github Repo:
[FourBarSimulation](https://github.com/RCmags/FourBarSimulation)

