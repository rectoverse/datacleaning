The resulting dataset contains these measures:
tBodyAcc for X, Y, Z axis
tGravityAcc for X, Y, Z axis
tBodyAccJerk for X, Y, Z axis
tBodyGyro_mean for X, Y, Z axis
tBodyGyroJerk for X, Y, Z axis
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc_mean for X, Y, Z axis
fBodyAccJerk for X, Y, Z axis
fBodyGyro_mean for X, Y, Z axis
fBodyAccMag
fBodyBodyAccJerkMag
fBodyBodyGyroMag
fBodyBodyGyroJerkMag

for each measure there is the mean and the standard deviation.
Dataset colums are labeled with these schema:
measureName_function_axis
where measureName is one of the measures reported at the beginning of this file
function can be mean or std 
axis (if present) is X or Y or Z

So, for example, for the measure tBodyAcc, we have 
tBodyAcc_mean_X 
tBodyAcc_mean_Y 
tBodyAcc_mean_Z 
tBodyAcc_std_X 
tBodyAcc_std_Y 
tBodyAcc_std_Z 

but for tBodyAccMag we have only
tBodyAccMag_mean
tBodyAccMag_std

In the resulting dataset, the values are summarized by subject and activity.
For further details you can refer to original data source, at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#