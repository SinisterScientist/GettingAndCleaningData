#run_analysis.R
#This file downloads and creates a tidy data set from Samsung Galaxy phone movements
#Copyright 2018 SinisterScientist (Michael Schumaker)

#Update the following directory to be able to run the script
#Set current location of this file:
script.location <- "C:/Users/Michael Schumaker/Documents/Course-work/GettingAndCleaningData/GettingAndCleaningData"

#Libraries to install and add
#data.table
data.table.test <- find.package("data.table", quiet=TRUE)
if(length(data.table.test) == 0) {
   install.packages("data.table")
}
library(data.table)

#dplyr
dplyr.test <- find.package("dplyr", quiet=TRUE)
if(length(dplyr.test) == 0) {
   install.packages("dplyr")
}
library(dplyr)

#Create a subdirectory as the working directory
setwd(script.location)
if(!file.exists("run_analysis_working_dir")) {
   dir.create("run_analysis_working_dir")
}
setwd("run_analysis_working_dir") 

datasetSubdir <- "UCI HAR Dataset"

#Test if the data directory exists. If not, download the zip file, unzip it
if(!file.exists(datasetSubdir)) {
   #Download file from source location and unzip
   #https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
   destfileName <- "./getdata_projectfiles_UCI HAR Dataset.zip"
   download.file(fileUrl, destfile=destfileName, method = "curl")
   dateDownloaded <- date()
   unzip(destfileName)
}

#Read the features and activity labels files
features <- read.table(paste(datasetSubdir, "features.txt", sep="/"), header=FALSE)
activity.labels <- read.table(paste(datasetSubdir, "activity_labels.txt", sep="/"), header=FALSE)

#Process the subject data set by appending the test and train sets, provide descriptive column name
subject_test <- read.table(paste(datasetSubdir, "test", "subject_test.txt", sep="/"), header=FALSE)
subject_train <- read.table(paste(datasetSubdir, "train", "subject_train.txt", sep="/"), header=FALSE)
subject_all <- rbind(subject_test, subject_train)
names(subject_all) <- "Subject Number"

#Process the y data set, which contains the activity type. Append sets, provide new column name
y_test <- read.table(paste(datasetSubdir, "test", "y_test.txt", sep="/"), header=FALSE)
y_train <- read.table(paste(datasetSubdir, "train", "y_train.txt", sep="/"), header=FALSE)
y_all <- rbind(y_test, y_train)
names(y_all) <- "Activity Type"

#Process the x data set, which contains the observations for 561 variables. Append sets, name the columns
x_test <- read.table(paste(datasetSubdir, "test", "X_test.txt", sep="/"), header=FALSE)
x_train <- read.table(paste(datasetSubdir, "train", "X_train.txt", sep="/"), header=FALSE)
x_all <- rbind(x_test, x_train)
#The names of the variables in the x set come from the second features column
names(x_all) <- features$V2

#Bind the columns from the subject, y, and x data sets to make a complete data set
full.data.set <- cbind(subject_all, y_all, x_all)






