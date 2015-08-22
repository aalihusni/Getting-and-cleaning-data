#Q1
#Variable name based on files and their respective folder
trainSubject 
trainSet
trainLabel 

#Variable name based on files and their respective folder
testSubject 
testSet 
testLabel

#Merging the files from 2 folders into their each category 
subject
mergedData #this one contains all the data 
label 

#Q2
features <- read.table("./UCI HAR Dataset/features.txt")
meanStdIndices #clean most of the std deviation the mean and std deviation for header
mergedData #Assign header name with cleaned header name
names(mergedData)  #remove "()"
#Extracts only the measurements on the mean and standard deviation for each measurement. 
names(mergedData) # remove "-" in column names 

#Q3 Uses descriptive activity names to name the activities in
activity
activity[, 2] #format the name to suit output
label[, 1] 
names(label) 


#Q4 Appropriately labels the data set with descriptive activity 
#insert all the data into one last df to print into txt
cleanedData <- cbind(subject, label, mergedData)
write.table(cleanedData, "merged_data.txt") # write the data to text file


cleanedDataGroup
#grouping the cleaned data by subject and activity 
tidyData
#put the summarized value of each column within group df 
write.table(cleanedData, "merged_data.txt",row.names = FALSE) # write the data to text file for upload
