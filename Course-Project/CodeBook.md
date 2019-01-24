# Getting and Cleaning Data Course Project Code Book
&nbsp;

## Data
***
### Description
Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  <br />
Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The tidy data averages of each variable (features) for each activity and each subject/volunteer.

&nbsp;
&nbsp;

## Variables
***

### Activity
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIR
4. SITTING
5. STANDING
6. LAYING

### Subject
Volunteers numbered 1-30

### Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

Features are normalized and bounded within [-1,1].
<br />
<br />
*Only the mean and standard deviation measures are included*<br />

***

#### Acceleration Signals
Similarly, the acceleration signal was then separated into body and gravity acceleration signals:

- tBodyAcc-XYZ 
- tGravityAcc-XYZ

using another low pass Butterworth filter with a corner frequency of 0.3 Hz.


#### Jerk Signals
The body linear acceleration and angular velocity were derived in time to obtain Jerk signals:

- tBodyAccJerk-XYZ 
- tBodyGyroJerk-XYZ

#### Euclidean Norm

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm:

- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag 

#### Fast Fourier Transform
Fast Fourier Transform (FFT) was applied to some of these signals producing: 

- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccJerkMag
- fBodyGyroMag 
- fBodyGyroJerkMag. 

*(Note the 'f' to indicate frequency domain signals)* 

&nbsp;
&nbsp;

## Transformation
***
1. Merges the training and the test sets to create one data set & appropriately labels the data set with descriptive variable names.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.