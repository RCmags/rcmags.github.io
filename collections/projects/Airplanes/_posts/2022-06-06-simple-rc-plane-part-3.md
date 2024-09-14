---
layout: post
title: "AR-1 | Combined aileron and flap mixing with elevons"

# image sliders:
slider1:
- url: /img/simple-rc-airplane/part-3/views/view-diagonal-1.jpg
- url: /img/simple-rc-airplane/part-3/views/view-diagonal-2.jpg
- url: /img/simple-rc-airplane/part-3/views/view-front-1.jpg
- url: /img/simple-rc-airplane/part-3/views/view-front-2.jpg
- url: /img/simple-rc-airplane/part-3/views/view-front-3.jpg
- url: /img/simple-rc-airplane/part-3/views/view-side-1.jpg

slider2:
- url: /img/simple-rc-airplane/part-3/views/view-bottom.jpg
- url: /img/simple-rc-airplane/part-3/views/view-bottom-3.jpg
- url: /img/simple-rc-airplane/part-3/views/view-bottom-2.jpg

slider3:
- url: /img/simple-rc-airplane/part-3/views/view-controls-2.jpg
- url: /img/simple-rc-airplane/part-3/views/view-controls-1.jpg
- url: /img/simple-rc-airplane/part-3/views/view-back.jpg
- url: /img/simple-rc-airplane/part-3/views/view-back-1.jpg

slider4:
- url: /img/simple-rc-airplane/part-3/views/view-airfoil-1.jpg
- url: /img/simple-rc-airplane/part-3/views/view-airfoil-2.jpg
- url: /img/simple-rc-airplane/part-3/views/view-airfoil-3.jpg
- url: /img/simple-rc-airplane/part-3/views/view-airfoil-4.jpg

---

In the last iteration of the simple RC airplane, I experimented with an inverted V-tail to enhance roll control. However, it didn't work as expected and did little to improve control response. Since that approach failed, the next logical step was to add roll control by changing the wing camber using [ailerons](https://en.wikipedia.org/wiki/Aileron). The model was only equipped with two servos and I didn’t want to add more just for this purpose. This imposed the constraint of using two servos with V-tail mixing to implement ailerons. Roll control wasn’t an issue, as the servos would deflect in unison to raise or lower the ailerons. The challenge came with pitch control: in this case, both ailerons would move up or down together. 

![image](/img/simple-rc-airplane/part-3/vtail-mix-control.png)
<p align="center"><i>Pitch and roll control through V-tail mixing of full span flaps</i></p>

Assuming the airplane’s wing isn’t stalled, up elevator benefits from increased wing camber, meaning the ailerons need to deflect downward to increase lift. Conversely, down elevator benefits from raising the ailerons to decrease lift. In this way, the airplane gains automatic flap control through the V-tail mixing. This control concept can be seen in [wingerons](https://aviation.stackexchange.com/questions/97242/is-it-possible-to-use-a-planes-entire-wing-as-an-elevon), where the entire wing is rotated to achieve the same effect. Here’s an example:

{% include youtube.html id='jKVom5tBdlA' %}  
<p align="center"><i>Pitch and roll control achieved by directly rotating the wings</i></p>

One drawback of this system is the higher load on the servos, as they have to rotate the entire wing. By simply moving a flap on the trailing edge, the control loads are reduced, and the wing's robustness is increased (since it can remain a solid structure without needing a large central bearing). In a sense, the automatic flap deployment caused by the V-tail mixing is similar to lift-enhancing mechanisms used on larger aircraft. One example is the automatic leading-edge slats on the [BF-109](https://en.wikipedia.org/wiki/Messerschmitt_Bf_109#Design_features). While these slats act on the leading edge rather than the trailing edge, the logic behind automatic lift enhancement remains the same.

![image](https://upload.wikimedia.org/wikipedia/commons/a/ab/Bundesarchiv_Bild_146-1980-005-05%2C_Fl%C3%BCgel_einer_Messerschmitt_Me_109.jpg)  
<p align="center"><i>The BF-109 had slats that extended at low airspeeds and high angles of attack</i></p>

Although the V-tail flaps in the RC airplane are manually controlled, flight dynamics impose complementary control deflections. When the aircraft flies slowly and needs to maintain lift, the elevator is deflected upwards, which in turn lowers the flaps. At higher airspeeds, the elevator is lowered, causing the flaps to add [reflex](https://www.mh-aerotools.de/airfoils/nf_3.htm), reducing lift and increasing stability:

![image](/img/simple-rc-airplane/part-3/implicit-airspeed-deflection.png)

Another benefit of adding ailerons is that the airplane can now maintain consistent roll control, independent of the propeller propwash hitting the tail. This consistency becomes especially important when flying in gusty wind conditions. Here’s how the model looked after the flaps were added to the wing:

{% include image-slider.html list=page.slider1 aspect_ratio="16/9" %}  
<p align="center"><i>Views of the airplane with an inverted v-tail</i></p>

{% include image-slider.html list=page.slider2 aspect_ratio="16/9" %}  
<p align="center"><i>The full span flaps did not have gap covers while testing the concept</i></p>

{% include image-slider.html list=page.slider3 aspect_ratio="16/9" %}  
<p align="center"><i>The servos that controlled the tail also controlled the ailerons</i></p>

{% include image-slider.html list=page.slider4 aspect_ratio="16/9" %}  
<p align="center"><i>The flying surfaces had thin airfoils with rounded edges</i></p>

The improvement was as expected. Pitch control was slightly better, though not dramatically so, but roll control was significantly enhanced. The model reacted faster to control inputs and maintained better control at lower airspeeds. Here’s the result:

{% include youtube.html id='l2lmqK2Ux4Y' %}  
<p align="center"><i>Improved control through ailerons and automatic flaps</i></p>
