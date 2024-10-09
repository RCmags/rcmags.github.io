---

layout: post  
title: "Using Tensorflow with old intel core2quad processors"

slider1:  
- url: /img/laptop-ups/complete/ups-0.jpg
---

# Understanding the problem
While learning about neural networks, I tried to set up my work environment to use some old computers I had lying around. One of those computers was an old desktop with a [Core2Quad Q9550](https://www.cpu-monkey.com/en/cpu-intel_core_2_quad_q9550) processor from 2008. In its time, it was a very good processor, but trying to perform modern computations in 2024 on this processor was not straightforward. This wasn’t necessarily because the processor was underpowered compared to more recent ones, but rather that I had issues installing the latest version of [TensorFlow](https://www.tensorflow.org/). Unfortunately, the old Core2Quad did not have the necessary instructions to run the software.

![image](/img/old-computer/core2quad.jpeg)
<p align="center"><i>Glorious old processor</i></p>

As it turns out, each processor has a [particular set of instructions](https://www.learncomputerscienceonline.com/instruction-set-architecture/) it can perform at a very basic level. More modern processors are capable of performing more complicated operations. Perhaps one of the most important are the [AVX instruction set](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions) to perform vector manipulations. These allow quick vector operations at a hardware level, greatly increasing the performance of certain computations. Since the Core2Quad didn't have the required **AVX** instructions, I had to find a workaround to get TensorFlow to work. As it stood, I could install the library with [Pip](https://pypi.org/project/pip/), but that didn’t mean the library could run. In fact, it would give me an error whenever I tried to import it in a Python script.

# Finding a working solution
Since that didn’t work, I had to find another way to get the library to at least load. According to some *stackoverflow posts*, one solution is to [compile TensorFlow](https://www.tensorflow.org/install/source) from scratch and optimize it for the instructions available on your processor. If you are successful, you obtain a library that only works for your computer and that is well optimized for its hardware. I thought to myself, "Hey, cool! If I can get this to work, I’ll have a faster library". Unfortunately, it was actually quite complicated to get the dependencies needed to compile TensorFlow to work. Once I was able to get all those packages installed, I tried to compile tensorflow and it **failed** in the middle of the process. After seeing the stream of errors, I thought, "Oh, crap, now what?". 

Well, it turns out this isn’t the only way to install TensorFlow. An alternative solution is to download an installation file from someone who successfully compiled the library. These packages come in a [whl (wheel) format](https://realpython.com/python-wheels/) that you can open with a Python terminal and install like any other package. The only difference is that the installation is done locally rather than through a download. That sounds good in theory, but in practice, it's somewhat difficult to find the particular file that works with your hardware. This is a bit of a two-fold problem. You have to ensure compatibility with your processor, and at the same time, if you want to use your discrete graphics card, you have to ensure that the compiled file works with your specific device. 

Eventually, after browsing around on the internet, I found some _GitHub repositories_ that contained _compatible whl files_. They weren’t the most recent versions of TensorFlow, but they worked. I succesfully installed one and tensorflow was finally able to finally run on my computer. Hurray! but the hardware compatibility problem persisted. While I could get a version of TensorFlow that worked with just the processor, it was another challenge to find one that also worked with my graphics card, an [Nvidia GTX 750](https://www.nvidia.com/en-us/geforce/graphics-cards/geforce-gtx-750/specifications/). Granted, this graphics card is old and not particularly noteworthy, but it can still be used to perform neural network computations. The fact that it was an NVIDIA card meant that I could utilize [CUDA](https://en.wikipedia.org/wiki/CUDA), which is greatly beneficial because it greatly _accelerates_ the performance of Tensorflow when any training a neural network.

# Getting the graphics card to work
Eventually, after experimenting with different wheel files, I found a build of TensorFlow that worked with my processor and graphics card. According to the file's description, it wasn't intended for a Core2Quad processor, but rather for some variant of the i7 series. For some mysterious reason, the wheel file worked on my computer, and TensorFlow loaded up with the GPU recognized. So whatever happened, something worked, and that was great news. It wasn't the latest version of TensorFlow (it was **v2.7.0**), but everything appeared to be functional. I tried running [Keras](https://keras.io/) with this version, and it worked. The test script executed just fine, and the GPU was definitely being utilized. It seemed like the time and effort I spent installing TensorFlow was finally paying off. Given my experience trying to compile TensorFlow from scratch, I'm very thankful to those who have uploaded their successful builds online. They're a lifesaver for those of us who couldn't do it ourselves but still need a working build of TensorFlow.

Driven by curiosity, I wanted to see if I could find a newer version of TensorFlow that would work on my computer. Unfortunately, after a lot of experimentation with different wheel builds, I wasn't able to find a file that supported both my processor and graphics card. I only found newer builds of TensorFlow that were compiled to only use **CPU**. This led me to a build of version **2.8.0** of TensorFlow. It wasn't a significant improvement over the GPU version, but it was something. The higher version builds either failed to install and generated errors during the process. I suspect this is because they were compiled for processors that aren't compatible with the Core2Quad series.

In any case, I wasn’t too worried about getting the latest TensorFlow to work because I had successfully installed [PyTorch](https://pytorch.org/). [Version 2.3.0](https://pytorch.org/blog/pytorch2-3/) worked fine out of the box and I didn’t have to fiddle with any complicated compiled files. My graphics card also worked without any issues or additional configurations. I was even able to use [Keras](https://keras.io/) with the PyTorch backend, and that also worked seamlessly. For this type of old hardware I think it's better to use PyTorch. You can get TensorFlow to work, but it seems much more opinionated regarding the type of hardware it can utilize, and is overall messier to deal with.

![image](/img/old-computer/pytorch.png)
<p align="center"><i>Pytorch is a less pickly alternative to TensorFlow</i></p>

So, would I recommend using very old hardware—15 years or so after its introduction—to run training algorithms for neural networks? If the projects are simple, then yes. Obviously, if you are dealing with very large and complex networks, then old equipement is not the way to go. But for small pet projects, it’s a good use of equipment that still has some usable lifespan. Granted, its a bit weird to try and use really old equipment for modern processing tasks, but in many respects it’s similar to attempting to use a modern low-powered equipment for these types of computations.

Many **laptop processors**, especially the low-end variants, do not have the same instruction set as desktop processors of the same generation. Therefore, they too face the problem of being unable to run TensorFlow due to compatibility issues. In these cases, you can use pre-compiled wheels to install TensorFlow. In fact, the builds that depend only on the processor and do not use the graphics card are well-suited for laptops because many laptops lack a dedicated graphics card. Instead, they rely on their [integrated graphics](https://www.intel.com/content/www/us/en/support/articles/000057824/graphics.html) which are incompatible with TensorFlow. You don't need to find a wheel that includes support for a graphics card; you can simply use the much easier-to-find CPU-only builds.

![image](/img/old-computer/intel-igpu.jpg)
<p align="center"><i>Pytorch can use Intel integrated graphics</i></p>

Another advantage of PyTorch is its ability to utilize the integrated graphics (iGPU) in Intel processors. This compatibility doesn’t extend to every iGPU, particularly those in older processors, but it's a capability that TensorFlow does not possess. Make no mistake: being able to use a GPU, even a weaker one, significantly impacts the time it takes to train a neural network. I noticed this difference when running the CPU-only build of PyTorch; the time it took to complete a training epoch was noticeably longer compared to the version of PyTorch that utilized the GPU.

# References
Here are all the repositories and sites that I visited while trying to find compatible TensorFlow builds. I highly recommend the GitHub repositories, as they contain various hardware combinations that may be compatible with your specific setup.

**I. Builds compatible with Core2 Processor - No AVX**

- This worked with a Core2Quad and an Nvidia **GPU**: [TensorFlow 2.7, No AVX, GPU, Python 3.8, Ubuntu 20.04, Intel I7, RTX2080TI
](https://github.com/jfrez/tensorflow-wheels/)

- Multiple Core2Quad builds, **CPU-only**: [TensorFlow 2.8.0 No AVX, No GPU, Python 3.7 - 3.10](https://github.com/yaroslavvb/tensorflow-community-wheels/issues/209)


**II. Builds for other processors - No AVX**
These builds did not work with the core2quad. 

- [TensorFlow 2.5.3 No GPU, No AVX, Intel pentium silver](https://github.com/yaroslavvb/tensorflow-community-wheels/issues/212)

- [Tensorflow 1.15 and 2.0, GPU with CUDA 10.1, AMD Phenom(tm) II X6 1045T Processor](https://github.com/Shenziger/tensorflow-wheels?tab=readme-ov-file)

- [TensorFlow 2.16.1 with GPU: no AVX (Nehalem), CUDA 12.2](https://github.com/yaroslavvb/tensorflow-community-wheels/issues/226)

- [Tensorflow 2.4 with Cuda 11](https://github.com/marcossilva/tensorflow-cuda11-wheel)

**III. General repositories**

- [Tensorflow-community-wheels](https://github.com/yaroslavvb/tensorflow-community-wheels/issues). This repository contains all sorts of builds for different hardware. 

- [Tensorflow Wheels built on Ubuntu 18.04](https://tf.novaal.de/). Huge listing of different tensorflow builds for old processors. From what I can tell, they are **cpu-only** builds. 


