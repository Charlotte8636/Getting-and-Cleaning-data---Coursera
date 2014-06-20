Getting-and-Cleaning-data---Coursera
====================================

> Purpose and data
 
The purpose of this project was to collect, work with, and clean a data set. The data were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 The goal was to prepare tidy data that can be used for later analysis. 


> Repository content
 
This repository contains:

 1) This README.md file
 
 2) an R script for performing the analysis (run_analysis.R)
 
 3) a Code book that describes the variables, the data, and transformations (CODE BOOK)

The Tidy data set is not included in the repository. It is submitted directly in Coursera "Assignment".
 
> The tidy data set 

The code combines the following raw data:

 'activity_labels.txt': Links the class labels with their activity name
 
 'train/X_train.txt': Training set.
 
 'train/y_train.txt': Training labels.
 
 'test/X_test.txt': Test set.
 
 'test/y_test.txt': Test labels.
 
 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The result is a tidy dataset in a txt file of 68 columns and 180 rows. The 66 variables represent the average of a subset of variables in the original raw data. This subset has been produced by filtering and selecting only the mean or the standard deviation of the raw signals. 


> The R script and how to use it
 
1) Keep your raw data in the "UCI HAR Dataset" folder under your current working directory.
 2) Download the “reshape2” package, on R Studio. 
3) Open “run_analysis.R” script with RStudio.
 4) Setup the working directory.
 5) Run “run_analysis.R” script
 6) Obtain the output, “TidyDataSet”, inside the "UCI HAR Dataset" folder.
