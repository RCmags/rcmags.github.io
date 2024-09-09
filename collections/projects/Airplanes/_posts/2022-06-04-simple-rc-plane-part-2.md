---
layout: post
title: "AR-1 | Experiments with an inverted V-tail"

# image sliders:
slider1:
- url: /img/simple-rc-airplane/part-2/inverted-tail-1.jpg
- url: /img/simple-rc-airplane/part-2/inverted-tail-2.jpg
- url: /img/simple-rc-airplane/part-2/inverted-tail-3.jpg

---

After building and flying the [simple RC plane](/projects/airplanes/2019/08/22/simple-rc-plane.html), I enjoyed how it flew but ultimately felt dissatisfied with the roll control. It worked well enough when the propeller was on, but during a glide the control response was slow and unresponsive. To improve the control, I figured I could apply a lesson learned from building [ornithopters](https://www.rcgroups.com/forums/showpost.php?p=41439849&postcount=87): the orientation of the tail also plays a role in control response, in addition to the size and deflection of the control surfaces. The idea is that by inverting the tail so it points downward rather than upward, the torques created by the tail combine to produce a roll torque that rolls the airplane into a turn, rather than out of it, as is the case with a tail oriented upward.

![image](https://static.rcgroups.net/forums/attachments/1/5/7/8/9/a9392934-66-v-tail%20vs%20inverted%20v-tail.gif)
<p align="center"><i>A V-tail generates both roll and yaw torque when deflected asymmetrically</i></p>

Since this inverted V-tail configuration worked well for an ornithopter, I figured it might have a similar effect on an airplane. The conversion was very simple. I loosened the tail from the boom that held it and used a bit of glue to fasten it into its new orientation. Afterwards, the control linkages had to be swapped to prevent the control rods from being overly twisted, and the pitch/yaw mixing had to be adjusted to reverse the yaw control deflections. To further enhance the tail, I added small covers to the control surfaces to close the gap caused by the flexure hinge. A cross-section view of a tape hinge sheds more light on the function of the cover:

![image](/img/simple-rc-airplane/part-2/control-cover.png)

As seen above, the tape hinge consists of two surfaces joined at the vertices of a triangle via flexible tape. This causes the surfaces to have a gap above the hinge union, which naturally disturbs airflow across the flying surface. To reduce this disruption, a flexible strap can be placed on one side of the hinge so that the moving control surface can slide in and out of the strap. This results in a simple way of maintaining a smooth, uninterrupted airfoil surface with a lightweight and easy-to-build solution. With these modifications complete, the airplane had a streamlined inverted V-tail, and the model looked more bird-like, which was a pleasant side effect:

{% include image-slider.html list=page.slider1 aspect_ratio="16/9" %}  
<p align="center"><i>Modified airplane with inverted V-tail</i></p>

Once tested in the air, the inverted V-tail showed that it didn’t make much difference. Perhaps the controls were slightly better, but the improvement wasn’t significant. The controls during a glide were still poor, and powered flight remained more authoritative. These results were underwhelming and quite different from what I observed with the ornithopter. I suspect the root cause of this difference lies in the nature of the two aircraft. In an airplane, the wings do not act as propulsion devices, while in an ornithopter, the wings **do** act as propellers, meaning they tend to **dampen** any motion that differs from their pitch speed. We can see this tendency in the thrust curve of a propeller. As airspeed increases (advance ratio), thrust decreases. Conversely, decreasing velocity causes thrust to rise. 

![image](https://www.mh-aerotools.de/airfoils/images/jp_validation_ct.png)
<p align="center"><i>See: <a href="https://www.mh-aerotools.de/airfoils/javaprop.htm">JavaProp</a> – a browser-based propeller simulator</i></p>

If we simplify an ornithopter to something like an airplane with two propellers, yawing the aircraft causes one propeller to move faster through the air than the other, which generates a thrust difference that resists the rotation—this results in strong [angular damping](https://en.wikipedia.org/wiki/Damping). Therefore, an ornithopter requires a constant torque to maintain the aircraft's rotation, while an airplane with a single propeller requires much less torque. Thus, the inverted V-tail only plays a significant role if the tail produces **strong** torque. If the torque is small, the orientation of the tail will have little effect. In an ornithopter, where the required torque is much larger, the tail's torque also plays a larger role. Here's how the airplanes flew with the modest effects of modified tail:

{% include youtube.html id='6PYJGD716CE' %}  
<p align="center"><i>A soothing flight on a cloudy day</i></p>

While the inverted V-tail was an interesting modification, it did not improve control significantly, and another method will be needed to enhance control during gliding flight. The obvious next step would be to add [ailerons](https://en.wikipedia.org/wiki/Aileron) to the aircraft. Despite this setback, the airplane flew well overall.
