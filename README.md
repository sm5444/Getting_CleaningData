# Getting and Cleaning Data
## Introduction

Hi, This repo contains my solution for the course project of course "Getting and Cleaning data".

##Raw data(not included in this repo)

Raw data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

*x_test.txt contained the test features (561) without labels
*y_test.txt contained the test activity labels
*subject_test.txt contained test subjects
*x_train.txt contained the train features (561) without labels
*y_train.txt contained the train activity labels
*subject_train.txt contained train subjects
*activity_labels.txt contained the links between class labels and activity name
*features.txt contained feature names

##Description
The R script (run_analysis.R) does the following things:
-Reading testing and training datasets into R
-Reading suppporting tables to get like features, subjects and activity labels
-Combining these pieces to obtain the full large Dataset (Dimension: 10299x563)
-Adding descriptive names for each activity
-Fixing unusual featurs of variable names,
-Subsetting a part of data responsible for variables having mean and standard deviation
-Calculating the average value of each variable for each subject and each activity
-Output result into tidy.txt(Dimension: 180x88)

##Codebook
Refer code book for details of processing steps followed

