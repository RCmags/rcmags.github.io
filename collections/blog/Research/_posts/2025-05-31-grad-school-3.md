---
layout: post
title: "Getting into a research group and focusing on a project"
---

Having completed the first semester as a graduate school, I felt prudent to find a major professor begin doing some research. A couple of months had passed since I started school, and this gave enough time to get an idea to see how academic funding would evolve. It seemed like the **DOGE budget cuts** that began in **2025** would continue onto the future for a significant amount of time.

In my case, this meant that It was unlikely that I would receive any **research assistantships** in the foreseeable future. Rather, the only source of funding I would have access to would be **teaching assistantships**. I don't necessarily mind having to teach or grade, but I have some concern over my ability to remember the material for whatever course I might be assigned to. Since getting my undergraduate degree, I've mainly dedicated myself to topics related to programming, so that's a very different world from the core courses in Mechanical Engineering. In particular, the details of courses like _heat transfer_ and _thermodynamics_ I have by and large forgotten. It's incredible how quickly this happens!

_See_: [Teaching vs Research Assistantships](https://gradschool.cornell.edu/financial-support/assistantships/)

Despite these concerns, I chose to focus on more immediate matters. With the onset summer, it felt important to effectively use this time to perform some research. I ultimately chose to work for a lab that specialized in the development of **aerosol jet printing** due to the multidisciplinary nature of this field. For one, there is an inherent need for mechanical design as the systems involved need to physically manufacture something. Secondly, there is an necessary computational side to optimally control the mechanical components in a precise and automated manner. Finally, there is a theoretical side that involves analyzing gas dynamics of mixed fluids with micro particles, among other related topics. Moreover, there is a **practical** component to the subject as advancements in the field can directly yield benefits in industrial applications. Given the limited funding opportunities, this is especially important as it could lead to financing from industry in the future.

{% include youtube.html id='dYtSU7x-23M' %}  
<p align="center"><i>Overview of Aerosol Jet Printing</i></p>

_See:_
- [Aerosol jet printed electronics overview](https://optomec.com/wp-content/uploads/2014/04/AJ_Printed_Electronics_Overview_whitepaper.pdf)
- [Aerosol jet printing: simply explained](https://all3dp.com/2/aerosol-jet-printing-simply-explained/)

After a few orientation sessions, it was explained that my research would involve the **automatic tuning** of the parameters involved in _aerosol jet printing_. This is because there are many physical parameters that can be adjusted through software, that affect the characteristics and quality of the parts that can manufactured. To tackle this problem, it would very likely be necessary to use **machine learning** algorithms to obtain optimal parameters for a specific manufacturing process. 

_See:_ 
- [Machine Learning in Additive Manufacturing: A Review](https://scholarworks.indianapolis.iu.edu/server/api/core/bitstreams/77e20cdf-9ee2-44de-b51a-0f7bffecded1/content)
- [Toward autonomous additive manufacturing: Bayesian optimization on a 3D printer](https://link.springer.com/content/pdf/10.1557/s43577-021-00051-1.pdf)
- [Improving performance of aerosol jet printing using machine learning‐driven optimization](https://onlinelibrary.wiley.com/doi/epdf/10.1002/appl.202300110)
- Accelerated Multiobjective Calibration of Fused Deposition Modeling 3D Printers Using Multitask Bayesian Optimization and Computer Vision
- Autonomous Output-Oriented Aerosol Jet Printing Enabled by Hybrid Machine Learning

Moreover, since this is an ultimately physical process, there is a **limit** on the number of experimental trials that can be performed to find any optimal solution. It is simply **not practical** to perform an unrestricted number of manufacturing runs, as each sample requires significant amount of time and raw materials to complete. Therefore, one cannot use a generic optimization algorithm that will require hundreds of data samples, as these would take years to complete in real life. In light of this essential constraint, it would be fundamental to devise some theoretical or empirical process to reduce the number of data samples required by the optimization process. One could think of this as devising a set of **dimensionless parameters** that would encapsulate the most important parameters that affect the printing process. In essence, these parameters would reduce the number of variables and hence reduce the number of required data samples. Such procedures are seen in experimental fluid dynamics or heat transfer experiments.

_See:_
- [Physical Quantities and Dimensions](https://phys.ufl.edu/courses/phy2061/spring19/Physical%20Quantities%20and%20Dimensions.pdf)
- [Dimensionless numbers in fluid mechanics](https://en.wikipedia.org/wiki/Dimensionless_numbers_in_fluid_mechanics)

Overall, the totality of the above problem felt very much in accord with the skills I could bring to the table. It would fundamentally depend on computer programming to devise and implement the some automation process by making use of the _rapidly emerging_ field of machine learning. Moreover, the need to employ some form of theoretical analysis to reduce the number of experimental trials created a direct link between how the optimization is devised.



