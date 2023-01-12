#R-script for Week 4 assignment

library(dplyr)

#set working directory to where the downloaded UCI HAR dataset sits.
#I put the data under ~/Document/R Course/ need to change if diferent

setwd("~/Documents/R Course/")

#Part 1

#Starting with the test data, load the relevant files, test/subject_test.txt, 
#X_test.txt, y_test.txt

#also load the features.txt as this describes the columns in X_test.txt

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")

feature <- read.table("UCI HAR Dataset/features.txt")

#housekeeping rename columns of ytest, subtest to relevant names

colnames(ytest) <- c("activitycode")
colnames(subtest) <- c("subject")

#rename column of xtest according to features.txt

colnames(xtest) <- feature[,2]

#pierce together subtest, ytest and xtest to form the right dataset

test <- cbind(subtest, ytest, xtest)

#repeat process for the training data set
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

colnames(ytrain) <- c("activitycode")
colnames(subtrain) <- c("subject")
colnames(xtrain) <- feature[,2]

train <- cbind(subtrain, ytrain, xtrain)

#combine the training and test data and arrive at the requested data set
#for part 1 of the assignment

combine <- rbind(test, train)

#note that some of the columns have duplicated names. The bands energy ones,
#for instance col 303-316, are repeated twice in columns immediately after. 
#Similarly for other bands energy variables. This seems not to impact the 
#current assignment so I just note it here.

#Part 2

#extract only those with means and std. The question is ambiguious here, 
#in the dataset there are variables and their mean() and std(). However there
#there are variables in features.txt that have "mean" in the variable name
#but probably not directly computed as mean of a measurement, 
#eg "fBodyAcc-meanFreq()-X" which is probably not the mean intended by the 
#question. Hence here I only select the columns corresponding to variables
# with "mean()" and "std()" in the name.

meanstd <- select(combine, subject, activitycode, 
                  contains("mean()") | contains("std()"))

#making this easier to view
meanstd <- tibble(meanstd)

#meanstd now contains the subject, activity code, and those means and stds
#as output for part 2

#Part 3

#For the activity names load the relevant file activity_labels.txt

actlabel <- read.table("UCI HAR Dataset/activity_labels.txt")

#change column names to make it match with meanstd

colnames(actlabel) <- c("activitycode", "activity")

meanstd <- meanstd %>% left_join(actlabel, by="activitycode")

#tidy up meanstd by removing the numeric label and moving activity_label
#to the second column. This is the result of Part 3

meanstd <- meanstd %>% select(!"activitycode") %>% 
  relocate("subject", "activity")

#Part 4 tidy up variable names by: changing suffic "t" to time and "f" to
#"freq" to make it more readable; change to all lower casse; remove special characters 
#"()" and "-"

colnames(meanstd) <- gsub("^t","time",colnames(meanstd))
colnames(meanstd) <- gsub("^f","freq",colnames(meanstd))
colnames(meanstd) <- gsub("[-()]","",colnames(meanstd))
colnames(meanstd) <- tolower(colnames(meanstd))

#For Part 5, first we sort meanstd to by subject and then by activity, according
#to the order as specified in the file activity_labels.txt, being read a actlabel
#in previous step

meanstd <- meanstd[order(meanstd$subject,
                         factor(meanstd$activity,levels=actlabel$activity)),]

#group meanstd by subject and activity and compute mean for the rest of 
#variables, and store the result in a new tidy database meanall

meanall <- meanstd %>% group_by(subject, activity) %>% 
  summarize(across(everything(),mean),.groups="drop")

#write meanall to a text file called meanall.txt, this is the data file
#being uploaded for part 5

write.table(meanall, file="meanall.txt", row.names = FALSE)
