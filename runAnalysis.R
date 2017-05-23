

library(data.table)
library(RCurl)

setwd("C:/Coursera/")


## Download and unzip file into working directory

fileUrl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileUrl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}


## Read in the X Train and Y Train data sets

X_Train<- read.table("UCI HAR Dataset/train/X_train.txt")
Y_Train<- read.table("UCI HAR Dataset/train/y_train.txt")
Subject_Train <-read.table("UCI HAR Dataset/train/subject_train.txt")


## Read in the X Test and Y Test data sets

X_Test<- read.table("UCI HAR Dataset/test/X_test.txt")
Y_Test<- read.table("UCI HAR Dataset/test/y_test.txt")
Subject_Test <-read.table("UCI HAR Dataset/test/subject_test.txt")


## Create one data set
X_All <- rbind(X_Train,X_Test)
Y_All <- rbind(Y_Train,Y_Test)
Subject_All <- rbind(Subject_Train,Subject_Test)

## Read in the features and activity data sets

features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")



## Retrieve rows from features.txt file that have either mean() or std() in their name and pull rows from X_All

myRowNums <- grep("mean\\(\\)|std\\(\\)", features[,2])
X_All <- X_All[,myRowNums]


## Replace the number values in Y_All with description from the activity.txt file

Y_All[,1] <- activity[Y_All[,1],2]
 


## Rename columns to user friendly names
myNames<-features[myRowNums,2] 

names(X_All) <- myNames 
names(Subject_All) <- "ID"
names(Y_All) <- "Activity"

myCleanData <- data.table(cbind(Subject_All, Y_All, X_All))


## Create tidy data set and write to .txt file

myTidyData <- myCleanData[, lapply(.SD, mean), by = 'ID,Activity']
write.table(myTidyData, "tidyData.txt", row.names = FALSE)





