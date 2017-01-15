# Getting and cleaning data - Course project

## Load packages

library(dplyr)
library(tidyr)
library(readr)
library(curl)
library(data.table)
library(dtplyr)

## Create directory for the project

myproject<-"CourseProject"

if (file.exists(myproject)) {
      setwd(file.path(getwd(), myproject))
}else{
      dir.create(file.path(getwd(), myproject))
      setwd(file.path(getwd(), myproject))
}

## Download data file

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

downloadedfilename<-"CourseProjectData.zip"

curl_download(fileurl, destfile = downloadedfilename)

## Unzip file

unzip(downloadedfilename)

## Reading data files

activitieslabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
activitieslabels<-as.data.table(activitieslabels)

measurementsnames<-read.table("./UCI HAR Dataset/features.txt")
measurementsnames<-as.data.table(measurementsnames)

testactivities<-read.table("./UCI HAR Dataset/test/y_test.txt")
testactivities<-as.data.table(testactivities)
testmeasurements<-read.table("./UCI HAR Dataset/test/X_test.txt")
testmeasurements<-as.data.table(testmeasurements)
testsubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
testsubjects<-as.data.table(testsubjects)

trainactivities<-read.table("./UCI HAR Dataset/train/y_train.txt")
trainactivities<-as.data.table(trainactivities)
trainmeasurements<-read.table("./UCI HAR Dataset/train/X_train.txt")
trainmeasurements<-as.data.table(trainmeasurements)
trainsubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
trainsubjects<-as.data.table(trainsubjects)

## Merge test and train sets

### Merge test and train activities

activitiesdata <- rbind(testactivities, trainactivities)

### Merge test and train measurements

measurementsdata <- rbind(testmeasurements, trainmeasurements)

### Merge test and train subjects

subjectsdata <- rbind(testsubjects, trainsubjects)

### Create one data set containing all the information

completedata <- cbind(subjectsdata, activitiesdata, measurementsdata)

## Extract measurements on the mean and standard deviation
## for each measurement.

### Extract columns index matching means and standard
### deviations

meanstdindex <- grep(pattern = "mean[^Freq]|std", measurementsnames$V2)

### Add 2 to the result as complete data has two additional
### columns

datameanstdindex <- meanstdindex + 2

### Create final vector for columns of interest. Columns 1
### and 2 are included which correspond to subjects and
### activities, respectively.

meanstdcols <- c(1, 2, datameanstdindex)

### Dataset with only mean and standard deviation for each
### measurement

meanstddata <- completedata[, meanstdcols, with = FALSE]

## Label data set with descriptive variable names

### Extract names of means and standard deviations for
### measurements.

meanstdnames <- measurementsnames[meanstdindex, V2]

### Turn names to characters

meanstdnames <- as.character(meanstdnames)

### Set names to data set variables. First two columns
### correspond to subjects and activities, respectively.

names(meanstddata) <- c("subject", "activity", meanstdnames)

## Assign descriptive names to activities

### Change format in activities labels. All to lower case.

activitieslabels$V2<-tolower(activitieslabels$V2)

### Change format in activities labels. No underscore.

activitieslabels$V2<-gsub("_","",activitieslabels$V2)

### Assign activities labels to dataset.

meanstddata$activity<-factor(meanstddata$activity, levels = 1:6, labels = as.character(activitieslabels$V2))

## Create independent tidy data set with averages of each
## measurement.

tidydata <- group_by(meanstddata, subject, activity)

tidydata <- summarize_each(tidydata, funs(mean(., na.rm = TRUE)))