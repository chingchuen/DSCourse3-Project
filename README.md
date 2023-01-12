# DSCourse3-Project

Getting and Cleaning Data Week 4 Assignment

What is in this directory

README.md       This file
Codebook.md     Code Book for the analysis script
run_analysis.R  R script for the analysis
meanall.txt     test file containing the final tidy data

How the R script works:
- the script assumes that the data are unzipped into the current working directory, which will create a directory called "UCI HAR Dataset"
- dplyr package is required
- the outputs are data set meanstd, meanall and a text file meanall.txt
- How the script works and how that relates to anwering requirement for each part of the assignment:

Part 1

- Starting with the test data, load the relevant files, test/subject_test.txt, X_test.txt, y_test.txt.  also load the features.txt as this describes the columns in X_test.txt
- properly rename variables as "subject" and "activity", and rename column of observations from X_test.txt according to features.txt.
- the 3 dataset are combined together to form the test dataset
- repeat process for the training data set
- combine the training and test data and arrive at the requested data set for part 1 of the assignment
- note that some of the variables have duplicated names. The bands energy ones,for instance no 303-316 of features.txt, are repeated twice immediately after. Similarly for other bands energy variables. This seems not to impact the current assignment so I just note it here.

Part 2

- extract only those with means and std. The question is ambiguious here, in the dataset there are variables and their mean() and std(). However there there are variables in features.txt that have "mean" in the variable name but probably not directly computed as mean of a measurement, e.g., "fBodyAcc-meanFreq()-X" which is probably not the mean intended by the question. Hence here I only select the columns corresponding to variables with "mean()" and "std()" in the name.

- meanstd now contains the subject, activity code, and those means and stds as output for part 2

Part 3

- For the activity names load the relevant file activity_labels.txt, change column names to make it match with meanstd
- tidy up meanstd by removing the numeric label and moving activity_label to the second column. This is the result of Part 3

Part 4 
- tidy up variable names by: changing suffic "t" to time and "f" to "freq" to make it more readable; change to all lower casse; remove special characters #"()" and "-". THe purpose is to produce a tidy dataset with variable names that are in lower cases and no special symbol. 

Part 5
- first we sort meanstd to by subject and then by activity, according to the order as specified in the file activity_labels.txt, being read a actlabel in previous step
- group meanstd by subject and activity and compute mean for the rest of variables, and store the result in a new tidy database meanall
- write meanall to a text file called meanall.txt, this is the data file
- being uploaded to the github and is the desired for part 5, a tidy dataset with each observation forming a role and variables with readable names




