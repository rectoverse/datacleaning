# DESCRIPTION #
The script it's been developed all in one file.
Probably can be better to subdivide in multiple files, each one for each step but 
for brevity and semplicity of control it is been choose to mantain a single file,
named run_analysis.R

# USAGE #
The script is configured as an R function, require no parameters, and returns
a data.frame as required by the project.
It has to be executed with th files of original dataset in the working directory
with the original structure


working dir
* UCI HAR Dataset
	* test
		* subject_test.txt
		* +X_test.txt
		* +y_test.txt
	* train
		* subject_train.txt
		* X_train.txt
		* y_train.txt			
			
In the same time the script save on file (txt) the dataset resulted.
In the code there are a lot of lines outputting messages to the user with the
current state of execution (cat('Step 1...') and so on...).
There are also same lines, NOT ACTIVATED, commented with #DEGUG that can be 
uncommented to increase speed and save resource (deleting intermediate result
from memory).

For meaning of measure and labels, refer to CoodeBook.md
