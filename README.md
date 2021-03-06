# Get_Clean_Data_Course_Project
Course Project for Coursera Getting and Cleaning Data Course

## Exercise Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Requirements of runAnalysis.R file

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Description of runAnalysis.R code

First, any required libraries are loaded into R and the working directory is set. Next, the required .zip file is downloaded
and unzipped. Then, the applicable files are read into R. Next, a single data table is created, descriptive column names 
(variables) are given, and numeric code values for activities are replaced with their corresponding character descriptions. 
Finally, a tidy data set with the average for each variable for each activity and subject is obtained and written to a .txt file.
