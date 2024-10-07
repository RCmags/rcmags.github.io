---
layout: post
title: "Datatypes for 3D vectors and quaternions"
---



---

This is a library for 3d vectors and quaternions. It includes two structs to define each datatype. Both vectors and quaternions can perform basic operations such as addition, subtraction, multiplication, division, increment, decrement, and their analogs for multiplication and division. Vectors and quaternions are also compatible with each other. Included are other operations such as vector dot product and cross product. Quaternions can also be constructed as unit quaternions to represent rotations. They can also rotate vectors. Both datatypes are compatible with arrays, meaning that a length-3 array can be added, subtracted, etc from a vector. This also applies to quaternions.  

# References
For more information on vector and quaternion operations, see these links:  

- [Quaternions and rotations](http://danceswithcode.net/engineeringnotes/quaternions/quaternions.html)
- [Quaternion operations](http://graphics.stanford.edu/courses/cs348a-17-winter/Papers/quaternion.pdf)  
- [Vector operations](http://emweb.unl.edu/Math/mathweb/vectors/vectors.html)

![image](/img/imu-filter/vectors.jpg)
<p align="center"><i>3D Vectors represent magnitude and direction</i></p>

![image](/img/imu-filter/quaternion.png)
<p align="center"><i>4D Quaternions represent an axis of rotation and rotation angle</i></p>

### Github repository
The library can be downloaded from its github repository or the arduino library catalog. See the following link to access the repository: [VectorDatatype](https://github.com/RCmags/vector_datatype)


