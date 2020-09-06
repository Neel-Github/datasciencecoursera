library(dplyr)
filename <- "Getting&CleaningDataCourseProject.zip"

#Checking if name already taken

if(!file.exists(filename)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, destfile = filename)
}

#Checking if folder is already created

if(!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#--------------------------------------------------------------------
#Step 1.Merges the training and the test sets to create one data set.
#--------------------------------------------------------------------

# 1.1 Reading files & Assignig Column names

features         <-    read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities       <-    read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test     <-    read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test           <-    read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test           <-    read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train    <-    read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train          <-    read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train          <-    read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# 1.2 Merging all data in one set

mrgX             <-    rbind(x_train, x_test)
mrgY             <-    rbind(y_train, y_test)
mrgSubject       <-    rbind(subject_train, subject_test)
MergedData       <-    cbind(Subject, Y, X)

#------------------------------------------------------------------------------------------------
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#------------------------------------------------------------------------------------------------

CleanData <- MergedData %>% 
             select(subject, code, contains("mean"), contains("std"))

#--------------------------------------------------------------------------------
# Step 3: Uses descriptive activity names to name the activities in the data set.
#--------------------------------------------------------------------------------

CleanData$code <- activities[CleanData$code, 2]

#---------------------------------------------------------------------------
# Step 4: Appropriately labels the data set with descriptive variable names.
#---------------------------------------------------------------------------

names(CleanData)[2]  =    "activity"
names(CleanData)    <-    gsub("Acc", "Accelerometer", names(CleanData))
names(CleanData)    <-    gsub("Gyro", "Gyroscope", names(CleanData))
names(CleanData)    <-    gsub("BodyBody", "Body", names(CleanData))
names(CleanData)    <-    gsub("Mag", "Magnitude", names(CleanData))
names(CleanData)    <-    gsub("^t", "Time", names(CleanData))
names(CleanData)    <-    gsub("^f", "Frequency", names(CleanData))
names(CleanData)    <-    gsub("tBody", "TimeBody", names(CleanData))
names(CleanData)    <-    gsub("-mean()", "Mean", names(CleanData), ignore.case = TRUE)
names(CleanData)    <-    gsub("-std()", "STD", names(CleanData), ignore.case = TRUE)
names(CleanData)    <-    gsub("-freq()", "Frequency", names(CleanData), ignore.case = TRUE)
names(CleanData)    <-    gsub("angle", "Angle", names(CleanData))
names(CleanData)    <-    gsub("gravity", "Gravity", names(CleanData))

#---------------------------------------------------------------------------------------------------------------------------
# Step 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
#---------------------------------------------------------------------------------------------------------------------------

FinalData           <-    CleanData %>%
                          group_by(subject, activity) %>%
                          summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

#-------
#Output.
#-------

str(FinalData)
