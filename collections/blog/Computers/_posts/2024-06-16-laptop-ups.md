---
layout: post
title: "DIY Laptop powerbank / Battery power supply"

slider1:
- url: /img/hawkmoth/view/hawkmoth-1.jpg
- url: /img/hawkmoth/view/hawkmoth-2.jpg
---

Sometimes its cool to try out different projects just to see if you can pull them off. One of them happened to be making a battery backup for a laptop. Now, at first this sort of doesn't make sense. Don't laptops already have batteries? Yes, they _generally_ do, but there are times when either the capacity is insufficient, or the battery doesn't work or is too much work to replace. In those cases, what can we do to run the laptop without AC power? Simple! Just "mimick" the power provided by an AC adapter with a battery! 

How exactly can this be done? Batteries differ greatly from AC power supplies. They have variable voltage and need a charging circuit, and the batteries need to be the right size to power the laptop a reasonable time. All of these things are true, but the project itself is not that hard. Here's an example of such a powerbank built by [GreatScott!](https://www.youtube.com/@greatscottlab):

{% include youtube.html id='ZQjazsiyr8s' %}   
<p align="center">Video 1. DIY laptop powerbank</p>

It's possible to make something very similar with a few inexpesive components. These may inclue:

- A large capacity battery: Its possible to use any kind of battery so long as its rechargable and can safely output the power needed by the laptop. To this, one can use an inexpesive lead-acid battery, or a slightly more expensive and better performing lithium-ion battery.  For this project, we shall stick to a 12v 3S Lithium-Ion pack made of multiple 18650 cells. 

- DC-to-DC step down converter: This component serves as the charging module for the ups. By settings its maximum current and voltage output, we can easily charge a wide range of arbitrary batteries. Whatever is used, the input voltage to this module MUST exceed the charge voltage of the battery. On the other hand, the maximum current will be limited to what's safe for the battery, and the power output of the voltage input source.

- An AC-to-DC power converter: A typical 65W charger brick from a laptop will work well. They are rated at approximately __20v__ output and a maximum current of __3.25A__. It's possible to use any similar converter so long as the voltage is higher than the fully charged voltage of the battery, and the maximum power is greater than that of the laptop plus the step-down converter at constant current.

- DC-to-DC step up converter: Since the battery has a variable output voltage that changes with capacity and instantaenous current load, we need a module to regulate this variable voltage into a steady output. By assuming that our battery will always have a lower voltage than that required by the load (in our case, 20v for the laptop), we must always increase the battery voltage.

- Some communation module or a relay: The ups needs to switch between charging and discharging the battery, so some kind of device needs to be used to redirect the AC current into either case, depending on whether AC is available or not. To this end, a very simple solution is a relay switch and that activates with the AC current, and connects the battery to the step-down converter/charger.

![image](/img/laptop-ups/laptop-ups.png)
