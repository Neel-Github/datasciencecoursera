---
title: "CodeBook"
author: "Neel Deshmukh"
date: "9/6/2020"
output: html_document
---
# Code Book

This code book summarizes the resulting data fields in `FinalData.txt`.

## The original data was transformed by

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement. 
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive activity names. 
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

## Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset.

## Activity Labels

* `WALKING` (`1`):            subject was walking during the test
* `WALKING_UPSTAIRS` (`2`):   subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (`3`): subject was walking down a staircase during the test
* `SITTING` (`4`):            subject was sitting during the test
* `STANDING` (`5`):           subject was standing during the test
* `LAYING` (`6`):             subject was laying down during the test