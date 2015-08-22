#read csv data 

#read training data
trainSubject <-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")

#read test data
testSubject <-read.table("./UCI HAR Dataset/test/subject_test.txt")
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Q1
subject <- rbind(trainSubject,testSubject)
#Merges the training and the test sets to create one data set.
mergedData <- rbind(trainSet,testSet)
label <- rbind(trainLabel,testLabel)

#Q2
features <- read.table("./UCI HAR Dataset/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
mergedData <- mergedData[, meanStdIndices]
names(mergedData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) #remove "()"
#Extracts only the measurements on the mean and standard deviation for each measurement. 
names(mergedData) <- gsub("-", "", names(mergedData)) # remove "-" in column names 

#Q3 Uses descriptive activity names to name the activities in
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[label[, 1], 2]
label[, 1] <- activityLabel
names(label) <- "activity"


#Q4 Appropriately labels the data set with descriptive activity 
# names. 
names(subject) <- "subject"
cleanedData <- cbind(subject, label, mergedData)
dim(cleanedData) # 10299*68
write.table(cleanedData, "merged_data.txt") # write the data to text file

#Q5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#group the data by activity and subject
cleanedDataGroup <- group_by(cleanedData,activity,subject) #group the data using activity and subject
tidyData <- summarise_each(cleanedDataGroup,funs(mean)) #summarise all the data
write.table(cleanedData, "merged_data.txt",row.names = FALSE) # write the data to text file for upload

