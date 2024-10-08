---
layout: post
title: "Datatypes for 3D vectors and quaternions"
---

While developing an algorithm to perform [sensor fusion](/projects/arduino libraries/2020/03/14/imu_sensor_fusion.html) between the gyroscope and accelerometer of an inertial measurement unit, I needed a way to execute basic [vector](https://es.wikipedia.org/wiki/Vector) operations and manipulate a [quaternion](https://en.wikipedia.org/wiki/Quaternion) to encode the gyroscope's heading. Although it was possible to hard-code these operations directly into the sensor fusion, it seemed prudent to separate this functionality in case it needed to be reused. This was especially relevant for spatial [navigation](https://en.wikipedia.org/wiki/Navigation), which requires manipulating vectors in different [frames of reference](https://en.wikipedia.org/wiki/Frame_of_reference). 

To create data types for vectors and quaternions, I first needed to understand the [operations](https://en.wikipedia.org/wiki/Operation_(mathematics)) they can perform. These operations, defined through mathematical notation, had to be converted into functions. By using [operator overloading](https://www.geeksforgeeks.org/operator-overloading-cpp/), I was able to employ these functions in a way that closely resembled mathematical notation. This is because an operation is simply a different way of writing a function that takes one or more parameters. This approach was applied to most of the operations possible for vectors and quaternions. For more information on vector and quaternion operations, see these links:

- [Quaternions and rotations](http://danceswithcode.net/engineeringnotes/quaternions/quaternions.html)
- [Quaternion operations](http://graphics.stanford.edu/courses/cs348a-17-winter/Papers/quaternion.pdf)  
- [Vector operations](http://emweb.unl.edu/Math/mathweb/vectors/vectors.html)

For example, the addition of two vectors can be written as **V1 + V2**. The **+** sign serves as shorthand for the function that takes two vectors and returns a new vector of their added values. When it came time to actually use these data types in code, it was straightforward because the corresponding operations could be written just as they would be in mathematical notation. This simplicity made the code easier to read, as operations reduced to a symbol rather than a _function call_. 

Inside the library, vectors and quaternions were declared as [structs](https://cplusplus.com/doc/tutorial/structures/) to define their [data types](https://en.wikipedia.org/wiki/Data_type). Both vectors and quaternions could perform basic operations such as _addition, subtraction, multiplication, division, increment, decrement_, and their analogs for _multiplication and division_. Vectors and quaternions were also compatible with each other through operations such as the vector [dot product](https://en.wikipedia.org/wiki/Dot_product) and [cross product](https://en.wikipedia.org/wiki/Cross_product). Quaternions could be constructed as unit quaternions to represent rotations, allowing them to be directly used to rotate vectors. Additionally, both data types were made compatible with [arrays](https://cplusplus.com/doc/tutorial/arrays/), meaning that a length-3 array could be added, subtracted, etc, from a vector. This compatibility also extended to quaternions.

![image](/img/imu-filter/vectors.jpg)
<p align="center"><i>3D Vectors represent magnitude and direction</i></p>

Vectors were the first data type to be defined as they were the more primitive structure. They consisted of an array with three components that could be manipulated to perform basic operations. Quaternions inherited from vectors by adding an additional scalar component to their structure. These four values, due to the mathematics of quaternions, allowed them to encode the [rotations of vectors](https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation) in three-dimensional space, enabling the quaternion data structure to act upon vectors through specific functions.

![image](/img/imu-filter/quaternion.png)
<p align="center"><i>4D Quaternions represent an axis of rotation and rotation angle</i></p>

Overall, I was very pleased with this project. I found it enriching because it taught me to view operations as functions and to see algebraic representations as translatable into code. It also helped me understand that what we do on paper is merely a representation of operations that are procedural, following an _input-output_ pattern. All the intermediate steps we perform are just a way to keep track of these operations. This step-driven nature emphasizes that these operations are algorithmic, in that they following a precise series of steps to achieve an output. I feel this experience increased my [mathematical maturity](https://en.wikipedia.org/wiki/Mathematical_maturity) by providing a more nuanced perspective on math.

### GitHub Repository
The library can be downloaded from its GitHub repository or the Arduino library catalog. See the following link to access the repository: [VectorDatatype](https://github.com/RCmags/vector_datatype)

