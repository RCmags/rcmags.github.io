---
layout: post
title: "DIY Laptop powerbank / Battery power supply"

slider1:
- url: /img/laptop-ups/complete/ups-0.jpg
- url: /img/laptop-ups/complete/ups-1.jpg
- url: /img/laptop-ups/complete/ups-2.jpg
- url: /img/laptop-ups/complete/ups-3.jpg
- url: /img/laptop-ups/complete/ups-4.jpg
- url: /img/laptop-ups/complete/ups-5.jpg
- url: /img/laptop-ups/complete/ups-6.jpg
- url: /img/laptop-ups/complete/ups-6b.jpg
- url: /img/laptop-ups/complete/ups-7.jpg
- url: /img/laptop-ups/complete/ups-8.jpg

---

Sometimes it’s fun to try different projects just to see if you can pull them off. One such project was creating a battery backup for a laptop. At first, this might seem unnecessary since laptops already have batteries. However, there are situations where the battery's capacity might be insufficient, it might not work, or replacing it could be too challenging. In these cases, you can run the laptop without AC power by mimicking the power supplied by an AC adapter using a battery.

Batteries and AC power supplies are quite different. Batteries have variable voltage and need a charging circuit. Additionally, the battery must be the right size to power the laptop for a reasonable time. While this might sound complicated, the project itself is manageable. Here's an example of a power bank made by [GreatScott!](https://www.youtube.com/@greatscottlab):

{% include youtube.html id='ZQjazsiyr8s' %}   
<p align="center">Video 1. DIY Laptop Power Bank</p>

You can create something similar with a few inexpensive components. Here’s what you’ll need:

- **A Large Capacity Battery**: You can use any rechargeable battery that safely outputs the required power for the laptop. Options include inexpensive lead-acid batteries or better-performing lithium-ion batteries. For this project, we’ll use a 12V 3S Lithium-Ion pack made of multiple 18650 cells.

![image](/img/laptop-ups/parts/battery.jpeg)

- **DC-to-DC Step-Down Converter**: This component acts as the charging module for the UPS. By setting its maximum current and voltage output, it can charge various batteries. The input voltage to this module MUST be higher than the battery’s charge voltage. However, the maximum current will be limited to what’s safe for the battery and the power output of the voltage input source.

![image](/img/laptop-ups/parts/step-down.jpg)

- **An AC-to-DC Power Converter**: A typical 65W laptop charger works well. It usually has a __20V__ output and a maximum current of __3.25A__. You can use any similar converter as long as its voltage is higher than the fully charged battery voltage and its power exceeds the laptop's requirements plus the step-down converter.

![image](/img/laptop-ups/parts/ac-charger.jpg)

- **DC-to-DC Step-Up Converter**: Since the battery voltage varies with capacity and instantaneous load, you need a module to regulate this variable voltage into a steady output. Given that the battery voltage is always lower than the required load voltage (20V for the laptop), the step-up converter will increase the battery voltage.

![image](/img/laptop-ups/parts/step-up.jpg)

- **Communication Module or Relay**: The UPS needs to switch between charging and discharging the battery. A relay switch that activates with the AC current and connects the battery to the step-down converter/charger is a simple solution.

![image](/img/laptop-ups/parts/relay.jpg)

With these components, you can build a system that automatically switches between AC and DC power. If AC power fails, the relay will quickly switch to battery power. However, because the relay is mechanical, it takes a short time to change states. This brief delay will cause the laptop to briefly rely on its internal battery while the UPS transitions, resulting in an __interrupted power supply__. Despite this drawback, relays have some advantages:

1. Relays have very low contact resistance because they’re mechanical switches. The voltage drop across them is minimal, whether the coil is powered or not.

2. There is minimal heat loss in an unpowered relay due to its low contact resistance.

In contrast, other switching methods like transistors or diodes generate more heat when current flows through them. However, they have instant switching times compared to mechanical switches.

Combining these components, you can assemble the system as shown in the diagram below:

![image](/img/laptop-ups/laptop-ups.png)
<p align="center">Schematic of UPS Circuit</p>

The overall system is quite simple. It essentially serves as a pass-through for the AC-to-DC converter and an automatic charger for the battery. The __input voltage__ from the AC-DC converter only needs to be __higher__ than the __battery voltage__. It does NOT need to match the voltage required by the laptop. Thus, a ~12V to ~20V converter can be used with this design, offering flexibility in input voltage.

{% include image-slider.html list=page.slider1 %}
<p align="center">Views of the Completed Direct-Current UPS</p>

As the images show, the completed UPS is compact and functional. It can be completely turned off by unplugging the AC-DC power supply and disconnecting the battery via the power switch. Adding a handle to the device makes it easy to move around. Overall, this was a relatively simple project that proved useful in off-grid situations. With a 4th-generation Intel laptop drawing around 10W to 40W, I was able to keep it running for over **16 hours**. Quite an achievement for some inexpensive modules wired together!
