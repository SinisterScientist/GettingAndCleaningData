#run_analysis.R
#This file downloads and creates a tidy data set from Samsung Galaxy phone movements
#Copyright 2018 SinisterScientist (Michael Schumaker)

#Set current location of this file:
script.location <- "C:/Users/Michael Schumaker/Documents/Course-work/GettingAndCleaningData/GettingAndCleaningData"

#Create a subdirectory as the working directory
setwd(script.location)
if(!file.exists("run_analysis_working_dir")) {
   dir.create("run_analysis_working_dir")
}
setwd("run_analysis_working_dir") 

#Download file from source location and unzip
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
destfileName <- "./getdata_projectfiles_UCI HAR Dataset.zip"
download.file(fileUrl, destfile=destfileName, method = "curl")
dateDownloaded <- date()
unzip(destfileName)

#Read the files
datasetSubdir <- "UCI HAR Dataset"

X_train <- read.table(paste(datasetSubdir, "train", "X_train.txt", sep="/"), sep=",", header=FALSE)
y_train <- read.table(paste(datasetSubdir, "train", "y_train.txt", sep="/"), sep=",", header=FALSE)
subject_train <- read.table(paste(datasetSubdir, "train", "subject_train.txt", sep="/"), sep=",", header=FALSE)

X_test <- read.table(paste(datasetSubdir, "test", "X_test.txt", sep="/"), sep=",", header=FALSE)
y_test <- read.table(paste(datasetSubdir, "test", "y_test.txt", sep="/"), sep=",", header=FALSE)
subject_test <- read.table(paste(datasetSubdir, "test", "subject_test.txt", sep="/"), sep=",", header=FALSE)

