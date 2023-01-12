Getting and Cleaning Data Week 4 Assignment

The purpose of this project is to manipulate, summarize and tidy up testing and training data collected from wearble device testing. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


The Raw Data: the data for this project 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz and then they were filtered using filters to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals  using another filter. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals. More detail can be found in "features_info.txt" in the dataset from the link below.

CodeBook: for the testing set of data, the observations contained in X_test.txt were merged together with the corresponding subject perfomming the experiment subject_test.txt and the corresponding activity being carried out y_test.txt, to arrive at a complete test data containing all observations with the correct subject and activity. Variable names representing the experiment output containing in X_test.txt are added from features.txt. The same operation was done to the training data set. Testing and training data set are then combined to form a complete data set.The complete data set was then sorted by subject and then by activity. Finally, for each subject and each activity, the mean of each variable was computed and summarized to the final ouput meansall.txt

