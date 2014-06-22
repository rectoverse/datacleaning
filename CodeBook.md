The resulting dataset contains these measures:<br/>
tBodyAcc for X, Y, Z axis<br/>
tGravityAcc for X, Y, Z axis<br/>
tBodyAccJerk for X, Y, Z axis<br/>
tBodyGyro_mean for X, Y, Z axis<br/>
tBodyGyroJerk for X, Y, Z axis<br/>
tBodyAccMag<br/>
tGravityAccMag<br/>
tBodyAccJerkMag<br/>
tBodyGyroMag<br/>
tBodyGyroJerkMag<br/>
fBodyAcc_mean for X, Y, Z axis<br/>
fBodyAccJerk for X, Y, Z axis<br/>
fBodyGyro_mean for X, Y, Z axis<br/>
fBodyAccMag<br/>
fBodyBodyAccJerkMag<br/>
fBodyBodyGyroMag<br/>
fBodyBodyGyroJerkMag<br/>

for each measure there is the mean and the standard deviation.
Dataset colums are labeled with these schema:<br/>
measureName_function_axis<br/>
where measureName is one of the measures reported at the beginning of this file<br/>
function can be mean or std <br/>
axis (if present) is X or Y or Z<br/>

So, for example, for the measure tBodyAcc, we have <br/>
tBodyAcc_mean_X <br/>
tBodyAcc_mean_Y <br/>
tBodyAcc_mean_Z <br/>
tBodyAcc_std_X <br/>
tBodyAcc_std_Y <br/>
tBodyAcc_std_Z <br/>

but for tBodyAccMag we have only<br/>
tBodyAccMag_mean<br/>
tBodyAccMag_std<br/>

In the resulting dataset, the values are summarized by subject and activity.<br/>
For further details you can refer to original data source, at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
