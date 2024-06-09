---
layout: post
title: "Machine learning frameworks | A newbie perspective"
---

The first time I dabbled with machine learning was during college for a undergraduate reasearch assignment. The task was to update some code written in [Python](https://www.python.org/) and [Julia](https://julialang.org/). The code involved algorithms used for aircraft traffic control, and due to the complexity of preventing multiple aircraft from crashing into each other, machine learning was used to obtain a solution that would otherwise be much harder to find manually.

![image](https://www.mdpi.com/symmetry/symmetry-12-00985/article_deploy/html/images/symmetry-12-00985-g001-550.jpg)

This project introduced me to some of the frameworks of that are used for ML. The python scripts used [Tensorflow 1.x](https://www.tensorflow.org/) and the Julia scripts used a mixture of [DeepRL](https://github.com/mkschleg/DeepRL.jl), [DeepQLearning](https://github.com/JuliaPOMDP/DeepQLearning.jl), [JuliaML](https://github.com/JuliaML), [Flux](https://fluxml.ai/Flux.jl/stable/), and probably some other stuff I've forgotten. At the time I didn't understand any of these libraries, and even less how they worked, so needless to say I completely failed to fix the code. I also felt ML was a bit of a fad and wasn't interested in getting caught up in a short-lived wave of popularity. 
 
With time, it made sense it wasn't just a fad and that learning more about ML would be positive, as the last time I encountered it I was completely dumbfounded. After stumbling upon __FreeCodeCamps's__ [Machine Learning with Python](https://www.freecodecamp.org/learn/machine-learning-with-python/) and completing the course (which involved multiple choice questions, there are no code exercise unfortunately), I vaguely understood that there were a few popular python frameworks for ML. Some of these include:

- [Tensorflow](https://www.tensorflow.org/): _An end-to-end open source machine learning platform for everyone._
- [Keras](https://keras.io/): _Keras is an API designed for human beings, not machines._
- [Pytorch](https://pytorch.org/): _PyTorch is a fully featured framework for building deep learning models._   
<br>

The course focused on Keras (despite claiming its focused on tensorflow), which is a layer that goes atop another package that actually handles the ML algorithms. The default back-end is Tensorflow but you can also use __Pytorch__. Unfortunately, I recall my experience with Tensorflow and it wasn't the best one. While I didn't understand the library, the code felt confusing and read like a convoluted mess. Objects upon object upon nested objects. By comparison, Pytorch's code seems a lot less dependant on special objects and uses more of Python's basic building blocks. Pytorch feel more... [Pythonic](https://builtin.com/data-science/pythonic)?.

![image](/img/machine-learning/framworks.jpg)

For a beginner this familiarity feels a lot simpler and easier to understand. A more tecnical comparison between the two libraries can be found here: [Pytorch vs Tensorflow](https://realpython.com/pytorch-vs-tensorflow/). Instead of using Python it's also possible to use Julia, but its ecosystems seem smaller and less newbie friendly than their python equivalents. The [pre-compiled](https://julialang.github.io/PrecompileTools.jl/stable/) nature of Julia can pose a benefit for re-running code efficiently, but that's an optimization that seems irrelevant for student learning through small projects. As a beginner, it makes more sense to stick to what's popular due to the plethora of answered questions that can be found online.
