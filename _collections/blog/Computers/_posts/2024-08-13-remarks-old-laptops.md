---

layout: post  
title: "Remarks on Slow Laptops and Low-Performance Computers"

slider1:  
- url: /img/laptop-ups/complete/ups-0.jpg

---

For several years, I had the misfortune of using a very slow laptop without knowing any better. What do I mean by this? One of the challenges with computers, from a user standpoint, is that performance is relative. You perceive something as "fast" if it operates within a timeframe you deem acceptable. For instance, in 1995, rendering a relatively simple 3D image of a landscape could take hours.

![image](https://i.pcmag.com/imagery/lineups/03osSl1r3F5I1dhTDdpMJDO-1.fit_lim.size_768x432.v1569492816.jpg)  
<p align="center">Some 90s-style image</p>

By comparison, almost any commercial device in 2024 can recreate that image in much less time. Despite this tremendous increase in computing power, for people in 1995, their equipment seemed relatively quick based on their expectations. The same effect can occur if you're not exposed to something you can qualify as "better." In my case, this lack of perception developed gradually through using a very slow fanless laptop from HP. Specifically, the [HP 15-f223wm](https://support.hp.com/us-en/product/product-specs/hp-15-f200-notebook-pc-series/model/8857447):

![image](https://shop.usapawn.com/files/inventory/ebay/1545226/1643212257-lg.jpg)

It featured a modest [Celeron N3050](https://ark.intel.com/content/www/us/en/ark/products/87257/intel-celeron-processor-n3050-2m-cache-up-to-2-16-ghz.html) processor, 4GB of single-channel RAM, and a 500GB 5200 RPM hard drive. For 2005, the performance of this device would have been noteworthy, especially considering its size and the **very low** power consumption of the processor (only **6W** TDP). In that era, a similar processor would easily consume **110W**. For example, the [AMD Opteron 170](https://www.cpu-upgrade.com/CPUs/AMD/Dual-Core_Opteron/170.html):

![image](https://c1.neweggimages.com/ProductImage/19-103-585-01.jpg)

There's a tremendous difference in power draw for similar computational power. The Celeron (with 14nm lithography) was released in 2015, while the Opteron (90nm lithography) came out in 2005, and the reduction in power consumption is significant. This decrease is due to the thinner layers in processors, which result in much less heat.

Technical details aside, I used this laptop for years until I couldn’t tolerate its slowness any longer. In retrospect, struggling with this device wasn't entirely a bad idea. It taught me how to squeeze out performance from limited hardware and demonstrated the impact **lightweight** software has on user experience. It also highlighted the benefits of **optimizing** software, even if it's easy to run. Both adjustments greatly enhance the perceived performance of a device. However, no matter how optimized the software, if the task is too computationally intensive, the machine will slow down. While optimization has its place, hardware ultimately limits the tasks one can comfortably perform.

The HP laptop came with [Windows 10 Home 2016 Edition](https://pureinfotech.com/windows-10-pro-vs-home-which-you-should-buy/). Initially, this version of Windows didn’t feel completely sluggish. What was evident, however, was the aggressive behavior of the antivirus. Windows Defender constantly saturated the processor, doing who-knows-what, and it would randomly slow down the computer.

![image](https://skyeybureau.weebly.com/uploads/1/2/4/3/124340256/348029392.png)

After a few years of dealing with this, I switched to Linux, specifically the lightweight version of Ubuntu using the LXQt desktop environment: [Lubuntu](https://lubuntu.me/). The change was remarkable. Despite still using the very slow hardware, compared to an unbloated version of Windows 10 Home, the computer felt much faster. While many programs, like web browsers, didn’t run significantly better, the operating system itself didn’t cause the computer to slow down. There was no antivirus causing massive slowdowns!

After about six months, I decided to make the best upgrade possible for such a device: switching from a [mechanical hard drive](https://en.wikipedia.org/wiki/Hard_disk_drive) to a [SATA solid-state drive](https://en.wikipedia.org/wiki/Solid-state_drive). The improvement was incredible. The computer ran much faster with this switch. Programs loaded quickly, boot time was significantly reduced (taking seconds instead of minutes), and the software manager in Lubuntu loaded in seconds rather than hanging up. Overall, this was an excellent upgrade, and I regret not doing it earlier.

![image](https://basic-tutorials.de/wp-content/uploads/2020/10/bigstock-SSD-state-solid-drives-disk-on-311822974.jpg)

Seeing the benefits of hardware upgrades, I also increased the RAM from **4GB to 8GB**. In practice, this didn’t seem to make a huge difference, but having maxed out this parameter felt appropriate. Over time, I appreciated the greater stability this added when using multiple tabs in a browser or having several programs open. 

I had learned the importance of critical upgrades, both in hardware and software, that transformed a nearly unusable computer into a useful tool. Although the laptop still had limitations—mainly that any modest program would quickly saturate the processor—the experience was much improved. At this point, with all possible upgrades performed, the main focus became **lightweight software** and **optimizing** it. For example, [tuning optimization flags](https://github.com/TrueHerobrine/trues-chromium-optimizations) for [ungoogled Chromium](https://github.com/ungoogled-software/ungoogled-chromium) is one such optimization.

The key takeaway from these reflections is that seemingly underpowered computers, when given the right hardware upgrades and appropriate software selection, can go from near-useless devices to valuable everyday tools. The equipment just needs to be fast enough to meet the **subjective** speed requirements of the user. Beyond that, additional computational power yields minimal gains. The equipment should be optimized for the user’s needs, and old and _apparently_ slow hardware can _definitely satisfy_ many use cases.
