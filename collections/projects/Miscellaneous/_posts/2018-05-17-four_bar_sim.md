---
layout: post
title: "Simulation of a four-bar linkage"

slider2:
- url: https://raw.githubusercontent.com/RCmags/FourBarSimulation/refs/heads/main/example_images/long_graph.png
- url: https://raw.githubusercontent.com/RCmags/FourBarSimulation/refs/heads/main/example_images/short_graph.png

slider1:
- url: https://raw.githubusercontent.com/RCmags/FourBarSimulation/refs/heads/main/example_images/long_bar_anim.gif
- url: https://raw.githubusercontent.com/RCmags/FourBarSimulation/refs/heads/main/example_images/short_bar_anim.gif
---

When I was in college, I took a course in engineering dynamics, and as part of a final project, I had to submit a simulation of some mechanical system. Due to the plethora of different systems that are possible to simulate, it became difficult to select something in particular. After some deliberation and some counseling, I settled on four-bar linkage as a system to simulate. A four-bar linkage is a classic and widely used mechanism that consists of four bars that are connected to each other. The connections between the bars are rotary hinges, meaning that each bar can rotate relative to the other in the sequence in which they are connected. 

![image](/img/four-bar/fourbar.png)
<p align="center"><i>The mechanism has four bars with four joints</i></p>

The complexity in this mechanism stems from the fact that the bars can be of different lengths, and that depending on which bars are held fixed in space, the motion of the mechanism changes. For example, if we hold one of the bars fixed and rotate one of the adjacent bars, we can convert rotary motion into reciprocating motion. This type of relationship is the basis for mechanisms like crankshafts, which purposefully make this conversion between motion types. Another advantage of this mechanism is that the motion occurs in two dimensions which makes it a lot easier to simulate.

![image](/img/four-bar/fourbar-types.png)
<p align="center"><i>The lengths of the bars can greatly affect the motion</i></p>

The simulation was written in the [Python language](https://www.python.org/) due to its flexibility. While I did not know it at the time, there was a significant difference between [Python 2](https://www.python.org/downloads/release/python-272/) and [Python 3](https://www.python.org/download/releases/3.0/), and due to concern over compatibility, the class chose to use Python 2 to better implement some of the available libraries. I'm not sure if this had much of an effect for this own project, but that was the justification for using Python 2. 

When it came time to write the simulation, it was necessary to first analyze the kinematics of the mechanism. It was quickly noticed that by keeping one of the members fixed, the [kinematics](https://en.wikipedia.org/wiki/Kinematics) of the mechanism reduced to a single degree freedom. This meant that through one variable the rest of the motion of the mechanism could be determined through trigonometry. Since we are solving for the [dynamics](https://physics.info/dynamics/) of the system, it was the necessity to determine the equations of motion the bar that drove the mechanism. This was obtained by analyzing the mechanism with the [D'Alembert's principle of virtual work](http://kestrel.nmt.edu/~raymond/classes/ph321/notes/dalembert/dalembert.pdf). In this method, the mechanism is assumed to undergo very small deflections, such that if we analyze a _small deflection_ at the joints of each bar, each deflection is associated with a _small force_ at that point which induces a certain amount of [work](https://en.wikipedia.org/wiki/Work_(physics)). By adding each amount of work, and by also taking into account the _work due to accelerating_ each bar, it's possible to generate an equation which dictates the entire dynamics of the system. Moreover, since the kinematics of the mechanism are ultimately determined by a single variable, it greatly reduced the equation of motion of the entire system to a one-dimensional ordinary differential equation.

![image](/img/four-bar/dalembert.jpeg)
<p align="center"><i>'Alembert's method imagines small deflections</i></p>

To visualize the results of the equation of motion, it was necessary to make an animation of the mechanism. The solution of the [ordinary differential equation](https://en.wikipedia.org/wiki/Ordinary_differential_equation) could then be used to control the angle of the input bar during the animation. This was accomplished using the Canvas elements of the [Matplotlib library](https://matplotlib.org/). It was possible to make a drawing of the mechanism composed of line segments that joined at their vertices. These elements were then animated with respect to a _time variable_, which spanned from zero to an arbitrary amount of time in the future. Therefore, by knowing how one of the rods of the mechanism moved with respect to time, it was possible to make a complete animation. Thankfully, this information was known after solving the equation of motion. 

The final output of the program was a canvas animation of the linkage mechanism rotating under the absense of [damping forces](https://en.wikipedia.org/wiki/Damping). The __lengths__ of the bars could be changed at the start of the program, as could the __mass__ of the driving and driven bars. For simplicity, the intermiate bar that acted as a conrod was assumed to be _massless_. Other inputs were the initial angular velocity of the driving bar and a constant external torque acting on said bar. Here are some examples of the script's output: 

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %} 
<p align="center"><i>Animations generated by the simulation script</i></p>

To gain a better understanding of how the simulation works with the details of the analysis for the equations of motion and the animation itself, please see the following report, which was written for this project.

See: <b><a href="https://github.com/RCmags/FourBarSimulation/blob/main/Simulating%20a%20Four%20Bar%20linkage.pdf">Simulation of a four-bar linkage | Report</a></b>

It was interesting to analyze the results of the simulation. It was evident that the mass of the bars played a big role in the resulting motion. When one of the bars of the system was light and the other bar was heavy, then if the light bar was able to complete a full revolution, the motion of the entire system would be very jagged; there was a lot of variation in the angular velocity of the rotating member. In the opposite situation, when the rotating bar was very heavy in comparison to the rest of the bars, the angular velocity varied much less throughout the system. The rotating element moved with a much steadier angular velocity while the oscillating bars had a smoother overall oscillation. This can be interpreted as an exchange of [kinetic energy](https://en.wikipedia.org/wiki/Kinetic_energy). When the rotating bar is very heavy, most of the kinetic energy of the system is stored in this element, so its angular velocity remains roughly constant. However, when the oscillating bars store most of the energy, there are periods when that energy needs to be imparted to the rotating member in order to conserve the energy of the system, as the oscillating bars will not be moving or reversing direction. 

{% include image-slider.html list=page.slider2 aspect_ratio="4/3" %} 
<p align="center"><i>Angular velocity changed drastically with bar length and mass</i></p>

Overall, I was very pleased with the result of the simulation. It taught me a lot how to simplify the equations of motion of a system, and how to focus on the [energy](https://en.wikipedia.org/wiki/Mechanical_energy) of a system rather than on the individual forces acting on it. Prior knowledge of the motion of bodies that are involved can greatly simplify the analysis of their dynamics. If we do not have this information, we are must solve for the effects of the forces acting on the system, which leads to far more complicated equations.


### Github repository
To run the project, simply download the repository and run the "FourBarSimulation.py" file with the python terminal. It will automatically generate a video of the animation that will be saved in the same location as the .py file. The script will also generate a plot of the angular velocity of the driven rod with respect to time. See the following link: [FourBarSimulation](https://github.com/RCmags/FourBarSimulation)

