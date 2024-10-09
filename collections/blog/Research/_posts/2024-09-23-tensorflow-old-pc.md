---

layout: post  
title: "Using Tensorflow with old intel core2quad processors"

slider1:  
- url: /img/laptop-ups/complete/ups-0.jpg
---

# Oh no, it doesn't work
While learning about neural networks, I tried to set up my work environment to use some old computers I had lying around. One of those computers was an old desktop with a [Core2Quad Q9550](https://www.cpu-monkey.com/en/cpu-intel_core_2_quad_q9550) processor from 2008. In its time, it was a very good processor, but trying to perform modern computations in 2024 on this processor was not straightforward. This wasn’t necessarily because the processor was underpowered compared to more recent ones, but rather that I had issues installing the latest version of [TensorFlow](https://www.tensorflow.org/). Unfortunately, the old Core2Quad did not have the necessary instructions to run the software.

![image](https://www.profesionalreview.com/wp-content/uploads/2019/11/1280px-Core_2_Q6600_G0.jpg)
<p align="center"><i>A glorious processor of old</i></p>

As it turns out, each processor has a [particular set of instructions](https://www.learncomputerscienceonline.com/instruction-set-architecture/) it can perform at a very basic level. More modern processors are capable of performing more complicated operations. Perhaps one of the most important are the [AVX instruction set](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions) to perform vector manipulations. These allow quick vector operations at a hardware level, greatly increasing the performance of certain computations. Since the Core2Quad didn't have the required **AVX2** instructions, I had to find a workaround to get TensorFlow to work. As it stood, I could install the library with [Pip](https://pypi.org/project/pip/), but that didn’t mean the library could run. In fact, it would give me an error whenever I tried to import it in a Python script.

# Figuring it out
Since that didn’t work, I had to find another way to get the library to at least load. According to some *stackoverflow posts*, one solution is to [compile TensorFlow](https://www.tensorflow.org/install/source) from scratch and optimize it for the instructions available on your processor. If you are successful, you obtain a library that only works for your computer and that is well optimized for its hardware. I thought to myself, "Hey, cool! If I can get this to work, I’ll have a faster library". Unfortunately, it was actually quite complicated to get the dependencies needed to compile TensorFlow to work. Once I was able to get all those packages installed, I tried to compile tensorflow and it **failed** in the middle of the process. After seeing the stream of errors, I thought, "Oh, crap, now what?". 

Well, it turns out this isn’t the only way to install TensorFlow. An alternative solution is to download an installation file from someone who successfully compiled the library. These packages come in a [whl (wheel) format](https://realpython.com/python-wheels/) that you can open with a Python terminal and install like any other package. The only difference is that the installation is done locally rather than through a download. That sounds good in theory, but in practice, it's somewhat difficult to find the particular file that works with your hardware. This is a bit of a two-fold problem. You have to ensure compatibility with your processor, and at the same time, if you want to use your discrete graphics card, you have to ensure that the compiled file works with your specific device. 

![image](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpreview.redd.it%2Fttb1uz1hn0w21.jpg%3Fauto%3Dwebp%26s%3D1765524ea1567141fd66bba13df144d43d13e5df&f=1&nofb=1&ipt=fbb9f9037e7de685d3b38eff2f6935f910dbe9d0b40815f93479128db029a277&ipo=images)
<p align="center"><i>What the fuck happened here. How does this even work</i></p>

Eventually, after browsing around on the internet, I found some _GitHub repositories_ that contained _compatible whl files_. They weren’t the most recent versions of TensorFlow, but they worked. I succesfully installed one and tensorflow was finally able to finally run on my computer. Hurray! but the hardware compatibility problem persisted. While I could get a version of TensorFlow that worked with just the processor, it was another challenge to find one that also worked with my graphics card, an [Nvidia GTX 750](https://www.nvidia.com/en-us/geforce/graphics-cards/geforce-gtx-750/specifications/). Granted, this graphics card is old and not particularly noteworthy, but it can still be used to perform neural network computations. The fact that it was an NVIDIA card meant that I could utilize [CUDA](https://en.wikipedia.org/wiki/CUDA), which is greatly beneficial because it greatly _accelerates_ the performance of Tensorflow when any training a neural network.

# Graphics card issues
Unfortunately, after a while of experimenting with different installation files, I wasn’t able to get the graphics card to work with TensorFlow. Still, I managed to get a relatively modern version of it running. It was a bit disappointing because it would have been nice to fully utilize TensorFlow with all my hardware. However, this was better than not being able to use it at all. In any case, I wasn’t too worried about getting TensorFlow to work because I had successfully installed [PyTorch](https://pytorch.org/). It worked fine out of the box and I didn’t have to fiddle with any complicated compiled files. My graphics card also worked without any issues or additional configurations. In fact, I was even able to use [Keras](https://keras.io/) with the PyTorch backend, and that all worked seamlessly. For this type of old hardware I think it's better to use PyTorch. You can get TensorFlow to work, but it seems much more opinionated regarding the type of hardware it can utilize, and is overall messier to deal with.

![image](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fraw.githubusercontent.com%2Fpytorch%2Fpytorch%2Fmaster%2Fdocs%2Fsource%2F_static%2Fimg%2Fpytorch-logo-dark.png&f=1&nofb=1&ipt=d73956ed9b540acbaa135beece1ccb12c30c7b3a15afb2753c4507b9876b0cfc&ipo=images)
<p align="center"><i>This saved my arse. It just works</i></p>

So, would I recommend using very old hardware—15 years or so after its introduction—to run training algorithms for neural networks? If the projects are simple, then yes. Obviously, if you are dealing with very large and complex networks, then old equipement is not the way to go. But for small pet projects, it’s a good use of equipment that still has some usable lifespan. Granted, its a bit weird to try and use really old equipment for modern processing tasks, but in many respects it’s similar to attempting to use a modern low-powered equipment for these types of computations.

Many **laptop processors**, especially the low-end variants, do not have the same instruction set as desktop processors of the same generation. Therefore, they too face the problem of being unable to run TensorFlow due to compatibility issues. In these cases, you can use pre-compiled wheels to install TensorFlow. In fact, the builds that depend only on the processor and do not use the graphics card are well-suited for laptops because many laptops lack a dedicated graphics card. Instead, they rely on their [integrated graphics](https://www.intel.com/content/www/us/en/support/articles/000057824/graphics.html) which are incompatible with TensorFlow. You don't need to find a wheel that includes support for a graphics card; you can simply use the much easier-to-find CPU-only builds.

![image](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fsd57cRYz9JM%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=9f299e983bd428e41260430e745b070f27eb9ce3f44ca34d00872e007f9664eb&ipo=images)
<p align="center"><i>This always works because you won't use it</i></p>

# References
Here are all the repositories and sites that I visited while trying to find compatible TensorFlow builds. I highly recommend the GitHub repositories, as they contain various hardware combinations that may be compatible with your specific setup.
