# Getting-and-cleaning-data
based on coursera assignment 2
1.You should create one R script called run_analysis.R that does the following. 

2.Merges the training and the test sets to create one data set.

*i just use the rbind to do the task. i know theres some other way but little time to search for it.

3.Extracts only the measurements on the mean and standard deviation for each measurement. 

*this question doesnt want you to compute any result but just extract the value of mean and std dev from the files.

4.Uses descriptive activity names to name the activities in the data set

*load the activity in the files given from the folder to get all activities and then fill the column 

5.Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* just use dplyr summarise_each & group_by to achieve this
