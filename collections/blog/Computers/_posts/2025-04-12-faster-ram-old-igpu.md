---
layout: post
title: Testing Higher Frequency RAM on Intel HD4600 Integrated Graphics
---

In my efforts to improve the performance of my **ThinkPad T540p** laptop, I experimented with increasing the frequency of its RAM to potentially enhance the [integrated graphics](https://www.intel.com/content/www/us/en/support/articles/000057824/graphics.html). The version I have lacks a discrete graphics card and the only GPU is the **Intel HD 4600** that is embedded into the **i7-4800MQ** processor. Integrated graphics cards [operate differently](https://en.wikipedia.org/wiki/Graphics_processing_unit#Integrated_graphics) from their discrete counterparts. They are inherently less powerful and share the system RAM with the CPU for graphical computations. One key factor influencing integrated graphics performance is the frequency at which the shared RAM operates. Higher frequencies generally mean greater bandwidth, allowing the graphics processor to handle more data per second. This improved throughput can enhance graphical performance by enabling faster rendering of complex or high-resolution images. 

{% include youtube.html id='lXFbYU6cvZw' %}  
<p align="center"><i>Comparison of RAM speed on AMD APU</i></p>

After some research online, it seems this principle is more relevant for [AMD's integrated graphics solutions](https://en.wikipedia.org/wiki/AMD_APU), but its impact on Intel-based integrated graphics like the HD 4600 is less certain, despite faster ram being a relatively inexpensive upgrade option. This was particularly true for the ThinkPad T540p which uses DDR3L SODIMM RAM. This is an older standard dating back to around 2012, and has become significantly cheaper due to technological advancement.

See: [Thinkpad T540p Platform Specifications](https://psref.lenovo.com/syspool/Sys/PDF/ThinkPad/ThinkPad_T540p/ThinkPad_T540p_Spec.PDF)

### Slower RAM
At the start of this experiment, the laptop was equipped with __Kingston KVR16LS11/8 @ 1600 MHz and CL11 timings__. This consisted of two 8GB modules for a total of 16GB. This is a very standard configuration for laptops running DDR3L.

![Image](/img/igpu-ram-test/kingston-ram-stick.png)

Using [Furmark](https://geeks3d.com/furmark/), a GPU benchmark tool on Windows 10, I measured performance under this RAM setup. The test resulted in a rating between **615 and 625 points**:

![Image](/img/igpu-ram-test/1600-ram.png)

Compared to discrete graphics cards, these results were modest; however, they equaled or surpassed the performance of a _low-end Nvidia GT730 video card_ (often considered one of the least powerful budget options), despite its age. The GT730 is frequently cited as an entry-level discrete GPU benchmarked against integrated solutions.

### Faster RAM
To hopefully boost performance, I installed two __Crucial MT16KTF1G64HZ-1G9E2 RAM @ 1866 MHz and CL13 timings__, also totaling 16GB (8GB each). These Crucial sticks were originally sourced from a Mac computer. As RAM-sticks sold in bulk to manufacturers for repurposing (often found with specific branding), they are essentially generic devices.

![Image](/img/igpu-ram-test/crucial-ram-stick.png)

After installing the higher-frequency RAM, objective performance – such as boot times and basic application loading speed – felt slightly faster in Windows. A similar observation was noted on Linux; programs like Firefox seemed marginally quicker to launch. However, running the same Furmark benchmark showed no significant change in GPU performance. The rating remained roughly **615 points**:

![Image](/img/igpu-ram-test/1866-ram.png)


### Conclusions
There was a marginal difference (generally less than 5 points) between tests, but it wasn't substantial enough to conclude meaningful improvement from the higher frequency alone. If anything, the higher frequency ram had slightly worse performance. It's worth noting that these Crucial sticks had a higher CL rating compared to the original. This means while they ran at a faster clock speed, their access timings were slower. Therefore the overall "effective" speed difference was negligible between 1600 MHz CL11 and 1866 MHz CL13.

See: [RAM Latency calculator](https://www.xbitlabs.com/ram-speed-calculator/)

Given: `Absolute latency = (CAS latency*2000) / Frequency`
We can calculate:

- For 1600 Mhz and CL11, the absolute latency is: `13.75 ns`
- For 1866 Mhz and CL13, the absolute latency is: `13.93 ns`

It's crucial to remember this test was performed on relatively old hardware. The DDR3 RAM and the underlying Intel CPU platform are significantly outdated by the standards of 2025. Given this, results might differ for much newer systems or different generations of integrated graphics. Despite the lack of significant objective improvement in graphical performance, my own subjective experience indicates that the feeling of increased responsiveness when multitasking – having multiple programs open and switch between them – was noticeable. The overall system fluidity appeared marginally better. I would recommend this type of upgrade as a low-cost option for those looking to potentially squeeze slightly more performance from their computer. However, it is essential to understand that the gains are generally very minor.
