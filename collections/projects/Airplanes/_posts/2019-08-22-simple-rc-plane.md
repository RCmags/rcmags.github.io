---
layout: post
title: "Simple low wing-loading RC airplane"

# image sliders:
slider1:
- url: /img/simple-rc-airplane/airplane-1.jpg
- url: /img/simple-rc-airplane/airplane-2.jpg
- url: /img/simple-rc-airplane/airplane-3.jpg

---

For a long time, I wanted to create an airplane inspired by the design of a radio-controlled [pylon racer](https://www.rcgroups.com/forums/showthread.php?315267-New-Pylon-Racer-VOODOO). These aircraft are essentially overpowered gliders that are built to sustain large G-forces. Their appeal lies in using a highly energy-efficient platform that's modified for high speed. This can result in an overpowered aircraft with low wing loading that is capable of abrupt maneuvers. Plus, I find the aesthetic pleasing: a simple tube-like fuselage with a straight wing and tail. Many of these models use composite materials for the fuselage and wings, which leads to efficient airframes at the cost of a complex manufacturing process.

![image](https://static.rcgroups.net/forums/attachments/2/6/2/6/3/2/a5572226-163-Voodoo2.jpg)

On the other side of the spectrum, there are designs like the [GWS Slow Stick](https://www.rcgroups.com/forums/showthread.php?209416-GWS-Slow-Stick). The design is very simple as it's just a stick with supports that hold the aerodynamic surfaces, electronics, and motor. While this exposed setup creates a lot of drag, it’s easy to build and maintain. The simplicity results in a lightweight airframe with low wing-loading. As the name implies however, the plane is designed for slow fligh so the larger drag caused by the fuselage isn't as important.

![image](https://static.rcgroups.net/forums/attachments/1/7/8/4/8/8/a17337695-67-Slow%20Ultra%20Stick%202.jpg)

Both of these approaches are interesting in their own ways. The pylon racer is fast but complex, while the stick design is slow and simple. Since both have their appeal, it’s a good challenge to find a middle ground that offers both: ease of construction and relatively low drag. This is where scale plays an important role. Since we’re dealing with small radio-controlled models and won’t be reaching very high speeds, we can safely expect to operate at low [Reynolds numbers](https://en.wikipedia.org/wiki/Reynolds_number). Specifically, in the range of **30,000 to 100,000**. In this range, studies have shown that [airfoils for low Reynolds numbers](https://www.rcgroups.com/forums/showthread.php?2529943-P1%29-Autogyros-Choosing-an-airfoil) can be simple yet effective. A curved flat plate works well in these conditions:

![image](https://ideas-inspire.com/wp-content/uploads/2014/04/airfoils.jpg)

With this in mind, we can simplify our wing to a flat 2D sheet with some [camber](https://en.wikipedia.org/wiki/Camber_(aerodynamics)). Similarly, the tail surfaces can be thin flat plates with rounded edges. To further simplify the aircraft, we can opt for a V-tail wherein the angle of the V determines how the effective stabilization along the vertical and horizontal axes.

![image](https://www.researchgate.net/profile/Yueksel-Eraslan/publication/348150678/figure/fig8/AS:975472972288000@1609582288794/Tail-configurations-5-T-tail-configuration-has-horizontal-tail-located-on-top-of.ppm)

A V-tail has the added benefit of lower mechanical complexity. Each side only requires one movable flap, controlled by an actuator. Since both sides are symmetrical, the mechanism is identical for each using the same servos and control linkages. The only drawback is the mixing required for pitch and yaw control, as both sides must move together to achieve control. However, this can be easily handled electronically with programmable servo motion.

![image](https://static.rcgroups.net/forums/attachments/6/1/5/4/5/a5930210-45-VTailMovement.jpg)

We’ll shall reduce the fuselage to a stick with the components attached as per the slow-stick design. By placing these components close together, we can also reduce their combined drag. For example, it’s easier to push a box with many boxes behind it through the air than pushing each box separately through undisturbed air. There are other drag-reducing effects to consider as well, such as the [corrugated airfoil of a dragonfly wing](https://www.researchgate.net/publication/303316802_Effects_of_Cambers_on_Gliding_and_Hovering_Performance_of_Corrugated_Dragonfly_Airfoils?_tp=eyJjb250ZXh0Ijp7ImZpcnN0UGFnZSI6Il9kaXJlY3QiLCJwYWdlIjoiX2RpcmVjdCJ9fQ):

![image](https://www.researchgate.net/profile/Yao-Zheng-11/publication/303316802/figure/fig6/AS:395637863534598@1471338825674/Streamline-for-flow-over-cambered-corrugated-airfoil.png)  
<p align="center">Despite its non-streamlined shape, the air flows smoothly over the corrugated wing.</p>

Similarly, a properly tailored non-streamlined shape can still have relatively low drag at low Reynolds numbers if airflow conditions are stable. In the case of a fuselage, this holds true since it's usually aligned with the airflow. Both the [angle of attack](https://en.wikipedia.org/wiki/Angle_of_attack) and [sideslip angle](https://en.wikipedia.org/wiki/Slip_(aerodynamics)) remain small.

With all of this in mind, it took me about a day to build a model airplane. The flying surfaces were made from **Depron foam**  that was reinforced with carbon fiber strips and fiber-reinforced kite tape. The fuselage was a **5mm pultruded carbon fiber tube**. The tail was controlled by two **3g analog servos**, and I used a **1306 brushless motor** with a **5030 propeller** for power. To keep things simple, only the tail was actuated so roll control relied on the wing’s [dihedral angle](https://en.wikipedia.org/wiki/Dihedral_(aeronautics)). The wing was split into two sections and joined at an acute angle of about **10 degrees**. The energy source was a **400mAh 2S LiPo** battery that powered the servos, a **6-channel receiver**, and a **6A brushless ESC**. Here’s the result:

{% include image-slider.html list=page.slider1 aspect_ratio="4/3" %}  
<p align="center"><i>A few photos of the airplane on the beach</i></p>

The total weight of the model is about **180 grams**, with a wingspan of **70 cm** and a root chord of **20 cm**. The wing had a tapered [planform](https://en.wikipedia.org/wiki/Wing_configuration#Chord_variation_along_span) with rounded edges. These tips prevent the wing from digging into the ground during landings and improves lift distribution across the wing as it has a small taper ratio. A simple cambered plate with a rounded leading edge and a triangular trailing edge was used for the airfoil.

{% include youtube.html id='gadIYbNib1U' %}  
<p align="center"><i>Flight of the airplane in a calm beach breeze</i></p>

Overall, this was a very satisfying project. The airplane flew well—not super fast, but not slow either. The controls weren’t very aggressive, but with V-tail control and dihedral, the roll response was sufficient for calm flight. Pitch control was quite responsive. The low wing loading allowed for tight turns at full throttle. While its gliding performance wasn’t extraordinary, I’d estimate a glide ratio of around **4:1** when trimmed correctly in calm conditions. Overall, this was a great result given how easy the plane was to build. This platform offers plenty of potential for trying out other concepts in the future as it’s both simple and highly modifiable.
