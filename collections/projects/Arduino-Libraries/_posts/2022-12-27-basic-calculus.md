---
layout: post
title: "Real time Calculus functions"
---

In Arduino, there is often a need to calculate derivatives and integrals of variables or sensor signals. While these operations have simple mathematical definitions, their implementation is not always straightforward due to the following reasons:

1. Data procured through an Arduino is [discretized](https://en.wikipedia.org/wiki/Discretization) and suffers from white noise.
2. These factors easily violate the requirement of [continuity](https://en.wikipedia.org/wiki/Continuous_function) for calculus operations.

![image](/img/calculus/noisy-signal.png)

_See:_ [Reducing noise in signals](https://www.predig.com/whitepaper/reducing-signal-noise-practice)

For instance, a highly [noise](https://en.wikipedia.org/wiki/White_noise) signal will generate an even noisier derivative, and the overall trend in the data can be completely lost. We can reduce the loss of relevant information by applying a filter to suppress the noise in the original data. The filtered signal can then be used to apply the calculus operators.

# Embedded filter
To take into account the need for filtering, I devised a simple library to _approximate 1-dimensional calculus operations_ in real time. It uses an _alpha-beta filter_ to __smoothen__ and numerically __differentiate__ a variable. The library can also __integrate__ the variable should one choose to. Note the library relies on polling to provide a continuously changing variable to refresh the calculus operations.

![image](http://hyperphysics.phy-astr.gsu.edu/hbase/Math/immath/derint.png)

# Other
For the sake of simplicity and to reduce memory use, the library uses micros() to update the timestep. This step is shared by all instances of alpha-beta filter.

# References:
- [Alpha-beta filter](https://en.wikipedia.org/wiki/Alpha_beta_filter)
- [Derivatives and Integrals](http://hyperphysics.phy-astr.gsu.edu/hbase/Math/derint.html)
- [Trapezoidal rule](https://en.wikipedia.org/wiki/Trapezoidal_rule)

# Code
The library can be found at the following repository: [basicCalculus](https://github.com/RCmags/basicCalculus)

