---
layout: post
title: "GUI for a basic calculator"
---

While learning how to program in the [Python programming language](https://en.wikipedia.org/wiki/Python_(programming_language)) (specifically __Python 3__), one of the topics I was taught was the [TKinter library](https://docs.python.org/3/library/tkinter.html) in order to make graphical user interfaces. As part of the course I was taking, I had to submit a moderately complex project that used this library. In my case, I chose to make a calculator application similar to the one that you might find in Microsoft Windows. This would be a simple program with multiple buttons. Each button would represent a number or a function that the could press them to make a calculation. Any result could then be used to make new a calculation.

![image](/img/calculator/windows-calculator.png)
<p align="center"><i>The Windows 7 calculator was the inspiration for the project</i></p>

This functionality made the project appealing because it had a large user interface, and the actual function of the application was very simple. Therefore the main focus could be on the graphical interface rather than the output of the program. To accomplish this functionality, I wrote a class that [encapsulated](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)) the function and interface of a single button. This class could be replicated across multiple locations, and since each class contained its own independant functionality, it was trivial to assign different operations to each button. The __special buttons__ were programmed differently, as it became nessesary to store and retrieve the result of the calculator as a [string of characters](https://en.wikipedia.org/wiki/String_(computer_science)). This format made it possible to delete the last input character (__DEL__) and clear the stored input (__CE__). 

<img src="https://raw.githubusercontent.com/RCmags/Calculator-GUI/refs/heads/main/sample_shot.png" style="max-width: 250px;">
<p align="center"><i>The Python calculator looked basic but it worked</i></p>

This allowed the calculator to perform basic operations such as addition, subtraction, multiplication and division. It effectively mimmicked a cheap hand-held calculator. In the end, this was a nice project that taught me a lot about how to make graphical interfaces. It was not complex but it did highlight the importance of __factoring__ graphical elements to reuse them later.

### Github repository
To use the calculator, simply execute "simple_calc.py" with the python shell. The repository can be found here:
[Calculator-GUI](https://github.com/RCmags/Calculator-GUI)

