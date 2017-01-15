# getcleandata-project
This repo contains the R script for completing the assignment as well as a README file explaining the steps taken and a codebook for the variables in it.

## Script description

1. Load packages.
2. Create directory for the project.
3. Download data file.
4. Unzip file.
5. Read data files.
6. Merge test and train activities.
7. Merge test and train measurements
8. Merge test and train subjects.
9. Create one data set containing all the information.
10. Extract columns index matching means and standard deviations.
11. Add 2 to the result as complete data has two additional columns.
12. Create final vector for columns of interest. Columns 1 and 2 are included which correspond to subjects and activities, respectively.
13. Create dataset with only mean and standard deviation for each measurement.
14. Extract names of means and standard deviations for measurements.
15. Turn names to characters.
16. Set names to data set variables. First two columns correspond to subjects and activities, respectively.
17. Change format in activities labels. All to lower case.
18. Change format in activities labels. No underscore.
19. Assign activities labels to dataset.
20. Create independent tidy data set with averages of each measurement.

## Codebook

The set of variables are averages taken on each measurement's mean value and standard deviation values for each subject and activity.

The original codebook is referred here as a guidance on where do the variables come from and what they mean.

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

### Variables list
subject: integer. Subject's id in data.

activity: factor. Code for activities coded as walking (1), walkingupstairs (2), walkingdownstairs (3), sitting (4), standing (5), laying (6).

tBodyAcc-mean()-X: numeric

tBodyAcc-mean()-Y: numeric

tBodyAcc-mean()-Z: numeric

tBodyAcc-std()-X: numeric

tBodyAcc-std()-Y: numeric

tBodyAcc-std()-Z: numeric

tGravityAcc-mean()-X: numeric

tGravityAcc-mean()-Y: numeric

tGravityAcc-mean()-Z: numeric

tGravityAcc-std()-X: numeric

tGravityAcc-std()-Y: numeric

tGravityAcc-std()-Z: numeric

tBodyAccJerk-mean()-X: numeric

tBodyAccJerk-mean()-Y: numeric

tBodyAccJerk-mean()-Z: numeric

tBodyAccJerk-std()-X: numeric

tBodyAccJerk-std()-Y: numeric

tBodyAccJerk-std()-Z: numeric

tBodyGyro-mean()-X: numeric

tBodyGyro-mean()-Y: numeric

tBodyGyro-mean()-Z: numeric

tBodyGyro-std()-X: numeric

tBodyGyro-std()-Y: numeric

tBodyGyro-std()-Z: numeric

tBodyGyroJerk-mean()-X: numeric

tBodyGyroJerk-mean()-Y: numeric

tBodyGyroJerk-mean()-Z: numeric

tBodyGyroJerk-std()-X: numeric

tBodyGyroJerk-std()-Y: numeric

tBodyGyroJerk-std()-Z: numeric

tBodyAccMag-mean(): numeric

tBodyAccMag-std(): numeric

tGravityAccMag-mean(): numeric

tGravityAccMag-std(): numeric

tBodyAccJerkMag-mean(): numeric

tBodyAccJerkMag-std(): numeric

tBodyGyroMag-mean(): numeric

tBodyGyroMag-std(): numeric

tBodyGyroJerkMag-mean(): numeric

tBodyGyroJerkMag-std(): numeric

fBodyAcc-mean()-X: numeric

fBodyAcc-mean()-Y: numeric

fBodyAcc-mean()-Z: numeric

fBodyAcc-std()-X: numeric

fBodyAcc-std()-Y: numeric

fBodyAcc-std()-Z: numeric

fBodyAccJerk-mean()-X: numeric

fBodyAccJerk-mean()-Y: numeric

fBodyAccJerk-mean()-Z: numeric

fBodyAccJerk-std()-X: numeric

fBodyAccJerk-std()-Y: numeric

fBodyAccJerk-std()-Z: numeric

fBodyGyro-mean()-X: numeric

fBodyGyro-mean()-Y: numeric

fBodyGyro-mean()-Z: numeric

fBodyGyro-std()-X: numeric

fBodyGyro-std()-Y: numeric

fBodyGyro-std()-Z: numeric

fBodyAccMag-mean(): numeric

fBodyAccMag-std(): numeric

fBodyBodyAccJerkMag-mean(): numeric

fBodyBodyAccJerkMag-std(): numeric

fBodyBodyGyroMag-mean(): numeric

fBodyBodyGyroMag-std(): numeric

fBodyBodyGyroJerkMag-mean(): numeric

fBodyBodyGyroJerkMag-std(): numeric
