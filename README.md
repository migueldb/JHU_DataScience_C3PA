# Summarizing Human Activity Recognition Using Smartphones Data Set

This repository contains the submission files and scripts for the **Johns Hopkins University** specialization course "Getting and Cleaning Data" programming assignment available on Coursera.

## Objective
The purpose of this project is to demonstrate the student's ability collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis from the data set described in the section *Input Data*.

## Input Data
[The Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been generated from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The data set is downloaded from [this location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Output Data
The output data set is a summarized version of the *Input Data* dataset following the summary of transformation steps described in the *CodeBook.md* file as well as in the comments within the *run_analysis.R* script

## Submission Files
### README.md
This file.

### CodeBook.md
This is the code book with a description of the variables and data stored in the tidy data set generated using the *run_analysis.R* script from the *Input Data* and saved as *summarizedDS.txt*.  This code book includes the transformations or work performed to clean up and summarize the data.

### run_analysis.R
This is the script that downloads and processes the *Input Data* and transforms it into the tidy data set saved as *summarizedDS.txt*.

### summarizedDS.txt
This is the tidy data set generated using *run_analysis.R* from the *Input Data*.  This file was created with write.table() using row.name=FALSE.

### NOTE:
The script can download and generate the tidy data set from scratch if the zipfile and *Input Data* dataset folder don't exist yet.  Otherwise the script will use them if they are already saved in the working directory with the correct names.

## Acknowledgments
### Publication
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

### Authors of the Data Set
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

### Course
Course provided by Coursera and Johns Hopkins University