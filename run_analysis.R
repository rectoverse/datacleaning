run_analysis <- function(){
    ###########################################################################
    #              PREMISE 
    #
    # Here you will find ALL R code necessary (in my opinion)
    # to accomplish what required by "Getting and Cleaning Data Course Project"
    #
    # In 'real' work it will be better split the R script into multiple files.
    # Here I've kept all into one file to simplify the "Evaluation Phase" to 
    # the reader.
    # I'll try to emphasize well every step, and I'll try to follow the order 
    # given by the assignment, also if it is not always the most efficient way.
    # 
    # There are some lines commented with #DEBUG, you can uncommentthat lines
    # to reduce memory utilization and/or increase speed
    #
    # The script is done as a function that save data.frame on disk and return
    # also in memory for further elaborations
    # 
    ###########################################################################
    
    ###########################################################################
    #STEP 0 - check for the existences of datafiles 
    ###########################################################################
    cat ("Hello. I'll go to check if there are data required \n")
    test_files<- c("./UCI HAR Dataset/test/subject_test.txt",
                   "./UCI HAR Dataset/test/X_test.txt",
                   "./UCI HAR Dataset/test/y_test.txt")
    if(!all(file.exists(test_files[]))) {
        cat ("Some file of test set not found. Check working directory.\nCurrent working directory is:\n")
        cat(getwd());
        return(-1);        
    }
    train_files<- c("./UCI HAR Dataset/train/subject_train.txt",
                    "./UCI HAR Dataset/train/X_train.txt",
                    "./UCI HAR Dataset/train/y_train.txt")
    if(!all(file.exists(train_files[]))) {
        cat ("Some file of train set not found. Check working directory.\nCurrent working directory is:\n")
        cat(getwd());
        return(-1);        
    }

    # here we have all file, the go to load
    cat ("OK - all files founded. Start loading\n")
    cat ("loading ", test_files[1],"...")
    subject_test<-read.table(test_files[1])
    cat ("DONE\n")
    cat ("loading ", test_files[2],"...")
    # X_test is a big file. Passing colClasses to read.table speedup the process
    # rep("numeric",561) generate a vector of 561 "numeric" string
    X_test<-read.table(test_files[2], colClasses=rep("numeric",561))
    cat ("DONE\n")
    cat ("loading ", test_files[3],"...")
    y_test<-read.table(test_files[3])
    cat ("DONE\n")
    cat ("loading ", train_files[1],"...")
    subject_train<-read.table(train_files[1])
    cat ("DONE\n")
    cat ("loading ", train_files[2],"...")
    # see comment for X_test
    X_train<-read.table(train_files[2], colClasses=rep("numeric",561))
    cat ("DONE\n")
    cat ("loading ", train_files[3],"...")
    y_train<-read.table(train_files[3])
    cat ("DONE\n")
    
    ###########################################################################
    #STEP 1 - Merges the training and the test sets to create one data set 
    ###########################################################################
    
    cat ("step 1 ...")
    allData<-rbind(cbind(X_test,subject_test,y_test),
                   cbind(X_train,subject_train,y_train))
    cat ("DONE\n")
    
    ###########################################################################
    #STEP 2 - Extracts only the measurements on the mean and standard deviation 
    #         for each measurement. 
    ###########################################################################
    
    cat ("step 2 ...")
    reqData<-allData[,c(  1,  2,  3,  4,  5,  6,
                         41, 42, 43, 44, 45, 46,
                         81, 82, 83, 84, 85, 86,
                        121,122,123,124,125,126,
                        161,162,163,164,165,166,
                        201,202,
                        214,215,
                        227,228,
                        240,241,
                        253,254,
                        266,267,268,269,270,271,
                        345,346,347,348,349,350,
                        424,425,426,427,428,429,
                        503,504,
                        516,517,
                        529,530,
                        542,543,
                        562,563)]
    #DEBUG rm(allData)
    cat ("DONE\n")
    
    ###########################################################################
    #STEP 3 - Uses descriptive activity names to name the activities in the data set 
    ###########################################################################

    # create a dataset with activity label, taken from activity_labels.txt file
    # changed '_' into space
    
    cat ("step 3 ...")
    activityLabel<-data.frame(c(1:6),c( "WALKING",
                                        "WALKING UPSTAIRS",
                                        "WALKING DOWNSTAIRS",
                                        "SITTING",
                                        "STANDING",
                                        "LAYING"))
    # merge data.frame reqData with activityLabel, retaining also the original
    # activity id for reference
    
    lblData<-merge(activityLabel,reqData,by.x=1,by.y=68)
    
    #DEBUG rm(reqData)
    #DEBUG rm(activitiLabel)
    cat ("DONE\n")
    
    ###########################################################################
    #STEP 4 - Appropriately labels the data set with descriptive variable names 
    ###########################################################################
    
    cat ("step 4 ...")
    colnames(lblData) <- c("ActivityCode","ActivityDescription",
                           "tBodyAcc_mean_X","tBodyAcc_mean_Y","tBodyAcc_mean_Z","tBodyAcc_std_X","tBodyAcc_std_Y","tBodyAcc_std_Z",
                           "tGravityAcc_mean_X","tGravityAcc_mean_Y","tGravityAcc_mean_Z","tGravityAcc_std_X","tGravityAcc_std_Y","tGravityAcc_std_Z",
                           "tBodyAccJerk_mean_X","tBodyAccJerk_mean_Y","tBodyAccJerk_mean_Z","tBodyAccJerk_std_X","tBodyAccJerk_std_Y","tBodyAccJerk_std_Z",
                           "tBodyGyro_mean_X","tBodyGyro_mean_Y","tBodyGyro_mean_Z","tBodyGyro_std_X","tBodyGyro_std_Y","tBodyGyro_std_Z",
                           "tBodyGyroJerk_mean_X","tBodyGyroJerk_mean_Y","tBodyGyroJerk_mean_Z","tBodyGyroJerk_std_X","tBodyGyroJerk_std_Y","tBodyGyroJerk_std_Z",
                           "tBodyAccMag_mean","tBodyAccMag_std",
                           "tGravityAccMag_mean","tGravityAccMag_std",
                           "tBodyAccJerkMag_mean","tBodyAccJerkMag_std",
                           "tBodyGyroMag_mean","tBodyGyroMag_std",
                           "tBodyGyroJerkMag_mean","tBodyGyroJerkMag_std",
                           "fBodyAcc_mean_X","fBodyAcc_mean_Y","fBodyAcc_mean_Z","fBodyAcc_std_X","fBodyAcc_std_Y","fBodyAcc_std_Z",
                           "fBodyAccJerk_mean_X","fBodyAccJerk_mean_Y","fBodyAccJerk_mean_Z","fBodyAccJerk_std_X","fBodyAccJerk_std_Y","fBodyAccJerk_std_Z",
                           "fBodyGyro_mean_X","fBodyGyro_mean_Y","fBodyGyro_mean_Z","fBodyGyro_std_X","fBodyGyro_std_Y","fBodyGyro_std_Z",
                           "fBodyAccMag_mean","fBodyAccMag_std",
                           "fBodyBodyAccJerkMag_mean","fBodyBodyAccJerkMag_std",
                           "fBodyBodyGyroMag_mean","fBodyBodyGyroMag_std",
                           "fBodyBodyGyroJerkMag_mean","fBodyBodyGyroJerkMag_std",
                           "subject")
    cat ("DONE\n")
    
    ###########################################################################
    # STEP 5 - Creates a second, independent tidy data set with the average of 
    #          each variable for each activity and each subject.
    ###########################################################################
    
    cat ("step 5 ...")
    cat (" 5a ...")
    #5a put column subject in front of dataset and remove ActivityCode
    finalData<-lblData[,c(69,2:68)]
    #DEBUG rm(lblData)
    
    cat (" 5b ...")
    #5b convert subject column from int to factor
    finalData$subject<-as.factor(finalData$subject)
    
    cat (" 5c ...")
    #5c compute result
    result<-aggregate(finalData[,3:68], list(finalData$subject, finalData$ActivityDescription), mean)
    #DEBUG rm(finalData)
    
    cat (" 5d ...")
    #5d label group
    colnames(result)[1]<-"subject"
    colnames(result)[2]<-"ActivityDescription"
    
    cat (" 5e ...")
    #5e write out result
    write.table(result, file="dcprjResult.txt", row.names=FALSE)
    cat ("DONE\n")
    
    return(result);
    
}