---
layout: post
title: Connecting an external graphics card (eGPU) to a Thinkpad T540p
---

In an attempt to maximize the performance of my think pad T540p, I explored the possibility of adding an external graphics card via the express card slot. 
These older think pads were equipped with a special slot that connected directly to the PCIE lanes on the  motherboard. 
Unlike more modern computers that use a Thunderbolt connection to PCIE connections between external devices and the computer, these older think pads released in 2013 make use of the deprecated express card.
As the name suggests, these are large rectangular cards that slide into the laptop.
Given how they work, they can be used to connect PCIE devices to the computer, assuming that one has an appropriate adapter to physically make the connection.
Thankfully, this is a common modification for this era of thinkpads and 
Inexpensive adapters are available for this use case.
The most commonly used and perhaps the most recommended device is the EXP GDC the Beast adapter, which is a small rectangular part with a PCIEX16 connection and a HDMI cable that connects to a male express card connector. 
Moreover, the adapter is made to be connected to a Dell DA-2 12-volt power brick, such that when the adapter is connected to the computer, the power supply automatically turns on and enables the video card or whatever device is connected to the PCI slot. 
Therefore, this entire system is very easy to set up and only involves buying three components: 
The express card adapter, the DA2 power supply, and a video card that is appropriately sized for the use case.

This last requirement is not necessarily easy to solve, simply because the express card to PCIE connection has a severe bottleneck. And these old think pads, they are only capable of a maximum of a Gen 2 connection, meaning that the maximum bandwidth between the card in the computer is limited to about 500 megabytes per second. That's equivalent to Sata 3, speeds. This is far lower than the gigabyte speeds that are achievable through a direct PCIE X-16 connection.
In practice, this means that the graphics card, the one connects, is ultimately limited by this communication bottleneck. 
While one can physically connect a powerful graphics card to the adapter, it does not mean that it will be fully utilized because of this bottleneck.
Therefore, there is a maximum practical limit of what graphic card is connected to the adapter, simply because it makes no sense to run something that is more powerful than this ideal device.
According to the manual of the EXP adapter, this transition roughly occurs for a graphics card of similar performance to the Nvidia GTX 750. 
If a more powerful video card is connected, the bandwidth limitation will begin to severely hamper the performance. And if a weaker video card is connected to the adapter, then there is still some possibility to obtain some significant performance improvement by adding a more powerful card.

Still, while this might represent an optimal point for the type of performance that one can extract from the adapter,
It doesn't mean that the video card will run at its maximum performance. If we were to take the same video card connected to a desktop computer, it would see much greater performance.
Nonetheless, when we compare this adapted video card compared to, say, the integrated graphics of the think pad, then the difference is significant. 

With all of this in mind, I went ahead and purchased both the adapter and the power supply and procured an Nvidia Quadro K2200 video card from a used desktop workstation.
This graphics card is very comparable to the GTX 750. However, it has significantly more V-RAM, boasting 4 gigabytes of V-RAM compared to the common 2-Gigabytes on the GTX-750.
This is important because whatever computations are performed on the graphics card can be isolated to this device if the VRM is greater, simply because more information can be loaded to it, and whenever the computations are completed, they can be passed through the PCI bottleneck onto the actual computer.
This was particularly important if one is interested in playing around with machine learning algorithms, for example, code that runs on the GPU through PyTorch or TensorFlow.
In these cases, being able to upload as much computations to the GPU increases the importance of having additional VRAM.

Once the components had all arrived in the mail, I was able to connect them together to get a working system. However, the compatibility of this device, or this configuration rather, is greatly dependent on the operating system being used. In my case, I would be using Windows 10 and Ubuntu 24.04.
Thankfully, there are many videos online of similar configurations, albeit not when necessarily the same laptop and graphics card, something that is equally comparable. Overall, the configuration seems to be pretty simple, although there can be some issues trying to get video output from the discrete graphics card. 
In any case, in my particular configuration, it was pretty much a straightforward act of connecting everything together.
And then powering on the laptop. This is important because the express card slot can be used in theory for hot swapping, meaning that device is going to be connected and disconnected from it while the computer is on. However, to avoid any compatibility issues, I made sure to the card to the computer before turning it on.

Once the computer booted up, I did not make any significant changes to the BIOS configuration. The think pad can be adjusted so that the express card runs at either Gen 1 or Gen 2 speeds. I left it at automatic, meaning that it would default to Gen 2 speeds should the device connected to it support that protocol.
This is not necessarily the most recommended configuration, as Gen 1 tends to be a more stable protocol with this particular adapter. 


As I understand, this is due to the nature of the HTML cable that is used to transfer information between the EXP adapter and the express card slot.
There are some posts online that recommend covering the cable and aluminum foil to remove any electrical interference that might come from the exposed graphics card.
Or other sources of electromagnetic waves, that might somehow distort the signals running through the HDMI cable.

Despite these warnings, I ignored this safer configuration for I wasn't sure whether running it at this slower speed would necessarily be necessary. Perhaps the video card that I was using would be stable enough and so this configuration would not be needed.

That being the case, I first booted into Windows to see how the video card would be detected. This is because Windows tends to have much better compatibility with Invidio cards as opposed to Linux. Moreover, based off of the videos that I mentioned before, there does seem to be slightly more configuration that is required on Linux, so I wanted to avoid any unnecessarily tweaking and just be sure that the adapter and and the hardware would actually detected by the operating system and the computer.
Thankfully, upon logging into the operating system, I was able to go into the device manager, and there I clearly saw the NVIDO card being detected. After installing the appropriate drivers, which in this case were the 550 and G-Force drivers, the graphics card was effectively detected on the task manager.

After rebooting the computer, to be sure that any configurations done by the drivers were loaded properly, I was able to run a series of tests with different video games to see if the adapter and the video card made any difference in terms of the performance of whatever graphical process is being run.
At first, I did not have an external video card connected to the graphics card. This was done simply with the graphics card sitting isolated onto the adapter, and any communication would have to go through the express card adapter back and forth between the graphics card and the computer.

The first game that I tested was a 2007 version of Crisis, and I maximized all the settings. Since the think pad had a 1080P,
Monitor connected to it, I ran the game from that display.
Under these conditions, the game would reach around 45 frames per second, on average, sometimes dipping to 30 frames per second, but overall the performance was consistent at around 45 frames per second. This was significantly better than running on the integrated graphics, which with this configuration would somewhere operate at 10 to 12 frames per second, but generally around 10 frames per second.

So with this in mind, the seeming increase in performance was somewhere around two to three times better than the integrated graphics, which is very significant.
In an effort to minimize the amount of information going through the express card bottleneck, 
I connected another external monitor directly to the video output of the graphic card. This had a noticeable effect on the smoothness of the video played on the monitor.
When the external monitor was connected directly to the laptop and not the video card, the integrated graphics were the main device handling the image on the monitor. And so the motion was fluid and seamless compared to the inbuilt monitor attached to the laptop.
However, when the external monitor was connected to the video card and not the laptop, the video on the screen became significantly more choppy and jerky, as if the frame rate it was running at was slower. I attribute this decrease in performance to the bandwidth limitation simply because 
The integrated graphics have a much higher bandwidth because they are physically connected to the processor and the internal components of the computer rather than going through this much slower external adapter.
Despite this seeming jerkier behavior, once he actually ran a game with it, the effect was not necessarily noticeable. For example, going back to crisis, the game actually ran significantly better. Now, the external screen had to run at a low resolution, in this case around 720p, but the frame rate would go up to a consistent 60 frame per second with all the configuration. graphical options at maximum. It's hard to say whether this was necessarily due to the reduced resolution, but nonetheless, it does indicate that the ability to unload data transfer from the Express card made a noticeable difference in the actual performance of the graphics card, meaning that this bottleneck had a very large effect on the overall perceived performance.

The effects of this restriction were very noticeable when one brought up the task manager, simply because one could see the actual GPU utilization that was reported.
For example, when running the free-to-play Sky Children of the Light game available on Steam, it was interesting to see how changing the video setting did not necessarily impact the frames for second significantly, despite the GPU being used at 100%.
When the game was run at its lowest graphical settings,
It would run at around 20 frames per second. Nonetheless, when the details of the game were increased to their maximum level and the resolution was set 1080p, the frame rate would only go down to around 18, or sometimes even remain the same at 20. It was noticeably more jerky, but the actual frame rate that was reported was not significantly different.
This indicates that the low frame rates are not necessarily due to the graphics card itself being incapable of providing a higher performance, but rather that the express card bottleneck was restricting the card from literally passing enough information to achieve those frame rates. And so that's why we can observe that changing the graphical settings did nothing to the actual reported frame rate.

With this in mind, I decided to try an additional game to verify whether there was an improvement. This was Dark Souls, the Prepare to Die Edition.
When the game was set to 720p at high graphical settings, it would obtain about 30 frames per second on the integrated graphics, sometimes dropping down to 25. When running on the external graphics card, it could go up to around 55 frames per second, sometimes dropping to 45, but generally reaching around 50 to 55 frames per second on average.
So overall, almost twice the frames per second by using the external GPU, which is consistent with the test involving crisys.

 
Having received significant improvements that having an external graphics card made in Windows, it was time to switch over to Linux to see if the effects were just as large.
When I booted into Linux, the first thing was to see if the device was recognized by the operating system. Thankfully, it was by running the LSPCI command, and not much had to be done afterwards to interface with the device. The additional step was to download the proprietary drivers for the graphics card. These were the same version that I used for Windows, so the 550 G-Force drivers.
Like before, I had to restart the computer after the drivers were installed to be able to use the GPU correctly. 
After the proprietary drivers were installed, I performed the same test as before, first running the graphics card without an external monitor connected directly to it. At this point, it was the same test as before of basically running a game to see if it made any significant improvement in the video performance.
To this end, I use the PSP emulator, P-P-S-S-S-P, running God of War, to stress the video card.
It's interesting to note that I was using the Flatpack version of the application, so the video card was not necessarily detected by default. To circumvent this problem, because of how Flatpack works, one needs to install separately a copy of the Nvidia drivers within the Flatpack environment in order for the applications that run within Flatpack to recognize the device.
While on an initial install, this does not really matter. Whenever one updates the global drivers installed on the actual operating system, one also needs to update the drivers in Flatpack, because if there is a difference between the versions, then Flatpack will not recognize that there is a GPU connected to the system. And so this adds an additional layer of unnecessary compatibility that needs to be taken into account.


Once the configuration was completed, the PSP emulator was able to recognize the video card, and I was able to run the game. Compared to running the IGPU, I noticed that the frames per second were actually lower. The IGPU running roughly 720p, and with some minor anti-aliasing applied to the image, the game would run around at 60 f.p.s. However, with the external graphics card, it was running at around 50 to 55 fps. By using NVTOP to check the GPU performance, I noticed that the GPU was being run at 100% utilization.
Moreover, the bandwidth utilization, which is reported by NVTOP, was pretty much saturated with the incoming information, outgoing information, roughly matching the 500 megabytes per second limit of the express card. 
Despite this bottleneck and the seemingly lower frames per second, I was able to increase the resolution at which the game was rendered at to around times 3 to times 4, so native 1080p for the actual order that I was using. Despite this increased graphical load, the frames per second didn't change and stated about 50 frames per second, meaning that a similar effect was occurring on Linux as compared to Windows, where the bandwidth was ultimately limiting the maximum frames per second.
To see if connecting an external monitor made any significant difference, I connected the monitor directly to the graphics card as opposed to passing it through the laptop. In this configuration, the performance on Linux was significantly worse than on Windows, meaning that the image rendered on the external monitor was noticeably more jerky and delayed. Moreover, once the ESP emulator was up and running, the frame rates were not significantly different, and in fact they might seem a little worse, simply because the image was a little choppier in general. So, in that sense, running at external monitor did nothing to improve the performance. Moreover, it seemed like the PCIE usage of the video card was not significantly reduced because NVTOP reported, significant income and outgoing data transfer. 
This discrepancy was shocking simply because it didn't align with the experience in Windows. Upon doing some research, it seems that this might actually be due to the way in which Nvidia drivers work on both operating systems. Fortunately, on Linux, they seem to be worse than on Windows. So this performance is likely due to the driver simply being not as well optimized on Linux.

Moreover, I learned that on Linux, the Nvidia drivers are not configured to make use of system memory to supplement any additional V-RAM that is required by the graphics card.
This is very different from how the drivers work on Windows, where there is shared memory such that whenever there isn't enough V-RAM to run a particular video process, the GPU will begin to use system RAM to supplement this limitation, similar to how a computer uses swap on a physical hard drive to supplement a limitation in RAM.
I'm unsure why this is necessarily the case, but my impression is that this is actually a deliberate move by NVIDIA because it forces people to buy X cards with more V-RAM than they would otherwise need if they could simply swap to their system RAM.
This is completely the opposite scenario when using AMD video cards. In this case, AMD video cards do have good drivers that have shared system memory enabled by default on Linux. So their performance is comparable and many times better, apparently, on Linux than on Windows. Therefore, this is a significant thing to take into account when buying a video card. and choosing the operating system that one is going to use it on.

To further test the video card in Linux in a situation that did not involve gaming, I ran a small program that implemented Keras with a high torch backend to offloads of computations to the GPU.
When running this program on the Nvidia Quadro, through the Express card, performance was approximately twice to 2.5 times better when simply running the program directly on the CPU. So it was significantly faster. 
It's unclear whether this necessarily makes use of the maximum computational power of the video card. Most likely it does not. But it's worth noting that this change in performance comparable to simply using a more potent processor. So very likely that simply using a newer computer running the same program on the CPU would yield comparable results to using this external adapter. running a graphics card. Given these results, it's not necessarily clear whether getting this external adapter and the video card is a worthwhile investment if one is interested in performing machine learning computation on the cheap. It seems that a similar amount of money can be spent on simply getting a used desktop computer and getting an actual video card that can connect to it at full speed. The results will be significantly better and likely more stable because the express card to a PCI, adapter is not necessarily known for maximum stability. And so all of this is avoided, simply using the graphics card on a desktop computer as intended.

In conclusion, this was a very educational project. It highlighted the importance of PCIE bandwidths on the maximum computational performance that a graphics card is capable of, and how an operating system can have a significant difference on the actual performance of a device because of how the drivers are optimized for that particular OS. In general, I would recommend that if one is interested in following such a project, that it's better to use an AMD card when using this adapter on Linux, simply because the drivers seem to work significantly better, and the performance is undoubtedly better with the ability to use shared system RAM. This means that one could use graphics card with lower V-RAM and still get good performance because one can make use of system RAM to supplement it.
If one is just interested in gaming, then the improvements are still very noteworthy. And on Windows, the graphics card does its job and does increase the performance. Whether this is necessarily any better than simply running a newer computer with better integrated graphics card is not necessarily clear, since the performance increase while significant is not necessarily huge. And so integrated graphics, while maybe being weaker would actually run better simply because they have a much higher bandwidth.
Moreover, this type of system is not worth it if one is interested in machine learning computations. It's better to simply get a desktop computer and avoid all this unnecessarily bottleneck and lack of performance.

