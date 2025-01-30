### DESCRIPTION:	
'''
Python script to automatically generate the urls for image sliders
'''

import sys

# inputs
input_begin = input("String: ")
input_end = input("Extension: ")

num_init = int( input("Initial number: ") )
num_end = int( input("End number: ") )

# write to file
with open('repeated-string.txt', 'w') as file:
	sys.stdout = file
	
	# insert index
	for index in range(num_init, num_end + 1):
		print(input_begin + str(index) + input_end)
	
	file.close()


### References
'''
https://stackoverflow.com/questions/70797/user-input-and-command-line-arguments#70833
https://www.geeksforgeeks.org/ways-to-save-python-terminal-output-to-a-text-file/
https://stackoverflow.com/questions/29843289/python-close-a-file-if-it-is-opened
'''
