---
layout: post
title: "Sorting algorithm comparison and linked lists"
---

For this emperical study four different sorting algorithms were compared. 
These were: Selection sort, Bubble sort, Insert sort, and Merge sort.

Each algorithm was asked to sort an array filled with random interger values.
The length of the array was 15000 entries long, while the random values were 
kept in the range of 0 to 1000. 

To improve the consistency of the results, a single random array was generated
and each algorithm was asked to sort it. The execution time of each algorithm 
was then recorded and stored.

By doing so, a fairer comparison could be made between the algorithms as they 
would sort the same array. Any differences in the excution time could then be
atritubed to the algorithms themselves rather than due to favorable or unfavorable
input arrays. 

Once this sequence of testing was complete, the entire process was then repeated with 
a newly generated random array. This larger event was then  repeated 20 times. 


The results of the twenty seperate tests show a definite trend when average times are 
analyised: 
	
	1) On the whole, Merge sort was the fastest of all the algorithms. With an	
	average execution time an order of magnitude lower than all other sorts, it
	dominated in terms of performance. In all likelihood this is due to it not 
	wasting time repeatedly scanning and comparing entries it already visited.
	
	2) Bubble sort was by far the slowest of all algorithms. On average it took
	almost twice as long as the next slowest algorithm. As it only compares adjacent
	array entries, it has no way of identifying more distant entries that could be 
	compared and swapped. Consequently it performs many unnecesary swaps that do little
	sorting.
	
	3) Selection sort was the second slowest algorithm. While it does not execute as 
	many trivial swaps as Bubble sort, it still leaves the array mostly unchanged after
	it performs a swap. This means the time it spends scanning the array does nothing to
	sort it. Naturally this leads to more scans, swaps, and excution time. 
	
	4) Insertion sort was the second fastest algorithm. While nowhere near as fast as 
	merge sort, it still outperformed the other algorithms by a large margin. This can 
	be atritubed to the way it "slides" the entries of an array as it scans them. This 
	tends to reduces the number of unnecesary comparisons by biasing EVERY seemingly 
	larger value towards one side of the array. 
	

In terms of the variation between excutions of the same algorithm, a different trend is 
apparent: 

	1) 	Merge sort had a much lower standard deviation than other algorithms. This 
	means that its execution time varied little with input array. The extent to which 
	the radom array was ordered had little effect. Apparently there was no "favorable" 
	input, but likewise no "unfavorable" input.
	
	2) Bubble sort had the largest standard deviation. How "sorted" the input array was 
	had a large effect on the excution time of this algorithm. 
	
	3) Selection sort and Insertion sort had similar standard deviations. Between the
	two, Insertion sort was more sensitive to how "ordered" the input array was, but not
	by much. In either case, the "sorting" of the input had a significant effect on 
	excution time.
	
Even though merge sort was the fastest and most consistent of all the algorithms, this 
consistency may be a drawback. If the input array is partially sorted, an atractive quality 
may be that the sorting algorithm takes less time to complete the sort. If this is important,
then the slower algorithms may have a quality that is worth studying and replicating.

---

While attending college, I took a course in programming structures in C++. This was a standard course that anyone who had any interest in computer science had to take. Moreover, in a lot of curriculums, it's a required course.

As part of the final grade for this course I was taking, I had to submit a report that compared different types of algorithms that sorted array in order to see how effective they were and the time they took to complete their operations.

The comparison made sense because different types of algorithms converge towards a specific O-time when dealing with large data set.
That is, the particular time to execute an algorithm can drastically change, depending on the nature of the algorithm, when it is dealing with very large amounts of information.

For example, algorithms increase linearly with the dataset, such that if you double the dataset, takes twice as long for the algorithm to complete.

Alternatively, an algorithm could increase logarithmically with the dataset. That means that a great increase in the amount of information that has to be processed is a relatively minor effect on the actual time needed to process the algorithm.

This is a very good situation as the algorithm process more information does not mean it will run significantly slower.

Conversely, some algorithms have a quadratic behavior with data, meaning that if you double the sample size, the time to execute the algorithm increases by four times. This is obviously a very bad situation as even minor increases in the amount of data being processed means the algorithm takes far longer to execute.

Analyzing the algorithms allows us to predict how long they will take to execute based off their convergence rate. Evidently, this is extremely important when we are dealing with time-critical situations where we want the absolute best performance for our computing power.

The program compared four different algorithms. These included selection sort, bubble sort, insertion sort, and emerge sort.

Each algorithm had its pros and cons. Some were more complicated than others, while others were more simple, but they also performed worse.

An example of this is bubble sort. It has a very simple, but its performance is underwhelming compared to other algorithms.

By comparison, merge sort is a far more complicated algorithm with many more lines of code. However, its performance is much better with large datasets.

Selection sort and insertion sort lie somewhere in between these extremes, and each have their use cases depending on how large the dataset is.

---

For another assignment, I had to submit a data structure known as a linked list.

This is an interconnected structure that stores data in something analogous to a chain, wherein there are small elements interconnected with each other, and each element, can store a certain amount of information.

There is an element at the start of this chain, then successive elements that are attached one after the other, and at the end there is a chain that terminates the entire linked list.

This data structure is flexible in that different elements can be inserted at different positions along the linked list. However, there must always be an element at the head of the list and an element at the tail or the end of the list.

This structure is flexible in that an arbitrary number of elements can be added to the list.

Likewise, we can remove elements from the list to the point at which we have no list remaining.

This flexibility means that we can separate the behavior of a linked list from another data structure like an array.
In an array, the length is fixed, and the number of elements that can exist within the array are known.

We can replace the data that is stored in each element of the array, but we cannot necessarily delete elements from the array. Likewise, we cannot necessarily add more elements to the array to make it longer.

The details of this behavior naturally changed depending on the programming language in question.

In some languages, the length of an array can be modified after it is created. So in that sense, it mimics the behavior of a linked list much more closely.

In other languages, arrays cannot be easily modified after their creation. Before, the distinction between an array and a linked list is more pronounced.

In the case of C++, we can declare arrays by giving them an initial length. However, afterwards, it's a bit more complicated to actually change the length or add entries to the array.

Therefore, making your own data structure for a linked list can make sense depending on the data that's being stored in that list.

For example, we may want to create a linked list that stores classes, which themselves store more complicated information. In this case, by making a linked list data structure, we can ensure a known relationship between each class that we can then use to make a more complicated program.

---

These are programs to compare the speed of basic sorting algorithms an a linked list data type. For an array of 15000 elements, this is how the algorithms fare:  
![image](https://raw.githubusercontent.com/RCmags/SortingAlgorithmCompare/main/data/sort_compare.png)

The linked list is easily visualized with this diagram:  
![image](https://3.bp.blogspot.com/-sXOQBd_OCR8/WBBn3QNhOiI/AAAAAAAAALQ/ysaUNOhKMoY59zw2cRxcHioHzdvn8HdNgCLcB/s1600/simpleLinkedList.png)

### Github Repo:
[SortingAlgorithmCompare](https://github.com/RCmags/SortingAlgorithmCompare)
