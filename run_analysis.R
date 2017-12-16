######################################################
###     PRE-STEP 1: Check for required packages    ###
###       download/install/load if not present     ###
######################################################

if (!require('data.table')) {
      install.packages('data.table', dependencies = TRUE)
}

if (!require('dplyr')) {
      install.packages('dplyr', dependencies = TRUE)
}

library('data.table')
library('dplyr')


######################################################
### ASSIGNMENT STEP 1: Merges the training and the ###
###        test sets to create one data set        ###
######################################################

###Import/Clean Test Measurments###
testX <- readLines("UCI HAR Dataset/test/X_test.txt")
testX <- trimws(testX, which = "both")
testX <- gsub("  ", " ", testX)
testX <- strsplit(testX, " ")
index <- 1
while (index <= length(testX)) {
      testX[[index]] <- as.numeric(testX[[index]])
      index <- index+1
}
testMeasurements <- mapply(function(y) sapply(testX, function (x) x[y]), 1:lengths(testX)[1])
remove(testX)
remove(index)

###Import Test Factors###
testSubjects <- readLines("UCI HAR Dataset/test/subject_test.txt")
testActivites <- readLines("UCI HAR Dataset/test/y_test.txt")

###Create Test Data Table, remove old test vectors###
TestDataTable <- data.table(Subject = testSubjects, Activity = testActivites, testMeasurements)
remove(testSubjects)
remove(testActivites)
remove(testMeasurements)


###Import/Clean Train Measurments###
trainX <- readLines("UCI HAR Dataset/train/X_train.txt")
trainX <- trimws(trainX, which = "both")
trainX <- gsub("  ", " ", trainX)
trainX <- strsplit(trainX, " ")
index <- 1
while (index <= length(trainX)) {
      trainX[[index]] <- as.numeric(trainX[[index]])
      index <- index+1
}
trainMeasurements <- mapply(function(y) sapply(trainX, function (x) x[y]), 1:lengths(trainX)[1])
remove(trainX)
remove(index)

###Import Train Factors###
trainSubjects <- readLines("UCI HAR Dataset/train/subject_train.txt")
trainActivites <- readLines("UCI HAR Dataset/train/y_train.txt")

###Create Train dataframe###
trainDataTable <- data.table(Subject = trainSubjects, Activity = trainActivites, trainMeasurements)
remove(trainSubjects)
remove(trainActivites)
remove(trainMeasurements)

###Merge Train and Test Data Tables, drop Test and train DTs###
mergedDataTable <- rbind(trainDataTable, TestDataTable)
remove(TestDataTable)
remove(trainDataTable)



######################################################
###      ASSIGNMENT STEP 2: Extracts only the      ###
###     measurements on the mean and standard      ###
###        deviation for each measurement          ###
######################################################

mergedDataTable <- data.table( Subject = mergedDataTable$Subject,
                               Activity = mergedDataTable$Activity,
                               mergedDataTable$V1,
                               mergedDataTable$V2,
                               mergedDataTable$V3,
                               mergedDataTable$V4,
                               mergedDataTable$V5,
                               mergedDataTable$V6,
                               mergedDataTable$V41,
                               mergedDataTable$V42,
                               mergedDataTable$V43,
                               mergedDataTable$V44,
                               mergedDataTable$V45,
                               mergedDataTable$V46,
                               mergedDataTable$V81,
                               mergedDataTable$V82,
                               mergedDataTable$V83,
                               mergedDataTable$V84,
                               mergedDataTable$V85,
                               mergedDataTable$V86,
                               mergedDataTable$V121,
                               mergedDataTable$V122,
                               mergedDataTable$V123,
                               mergedDataTable$V124,
                               mergedDataTable$V125,
                               mergedDataTable$V126,
                               mergedDataTable$V161,
                               mergedDataTable$V162,
                               mergedDataTable$V163,
                               mergedDataTable$V164,
                               mergedDataTable$V165,
                               mergedDataTable$V166,
                               mergedDataTable$V201,
                               mergedDataTable$V202,
                               mergedDataTable$V214,
                               mergedDataTable$V215,
                               mergedDataTable$V227,
                               mergedDataTable$V228,
                               mergedDataTable$V240,
                               mergedDataTable$V241,
                               mergedDataTable$V253,
                               mergedDataTable$V254,
                               mergedDataTable$V266,
                               mergedDataTable$V267,
                               mergedDataTable$V268,
                               mergedDataTable$V269,
                               mergedDataTable$V270,
                               mergedDataTable$V271,
                               mergedDataTable$V345,
                               mergedDataTable$V346,
                               mergedDataTable$V347,
                               mergedDataTable$V348,
                               mergedDataTable$V349,
                               mergedDataTable$V350,
                               mergedDataTable$V424,
                               mergedDataTable$V425,
                               mergedDataTable$V426,
                               mergedDataTable$V427,
                               mergedDataTable$V428,
                               mergedDataTable$V429,
                               mergedDataTable$V503,
                               mergedDataTable$V504,
                               mergedDataTable$V516,
                               mergedDataTable$V517,
                               mergedDataTable$V529,
                               mergedDataTable$V530,
                               mergedDataTable$V542,
                               mergedDataTable$V543
)

######################################################
###  ASSIGNMENT STEP 3: Uses descriptive activity  ###
###  names to name the activities in the data set  ### 
######################################################

mergedDataTable$Activity <- gsub("1", "WALKING", mergedDataTable$Activity)
mergedDataTable$Activity <- gsub("2", "WALKING_UPSTAIRS", mergedDataTable$Activity)
mergedDataTable$Activity <- gsub("3", "WALKING_DOWNSTAIRS", mergedDataTable$Activity)
mergedDataTable$Activity <- gsub("4", "SITTING", mergedDataTable$Activity)
mergedDataTable$Activity <- gsub("5", "STANDING", mergedDataTable$Activity)
mergedDataTable$Activity <- gsub("6", "LAYING", mergedDataTable$Activity)


######################################################
###   ASSIGNMENT STEP 4: Appropriately labels the  ###
###    data set with descriptive variable names    ###
######################################################

names(mergedDataTable) <- c("Subject",
                            "Activity",
                            "tBodyAcc-mean()-X",
                            "tBodyAcc-mean()-Y",
                            "tBodyAcc-mean()-Z",
                            "tBodyAcc-std()-X",
                            "tBodyAcc-std()-Y",
                            "tBodyAcc-std()-Z",
                            "tGravityAcc-mean()-X",
                            "tGravityAcc-mean()-Y",
                            "tGravityAcc-mean()-Z",
                            "tGravityAcc-std()-X",
                            "tGravityAcc-std()-Y",
                            "tGravityAcc-std()-Z",
                            "tBodyAccJerk-mean()-X",
                            "tBodyAccJerk-mean()-Y",
                            "tBodyAccJerk-mean()-Z",
                            "tBodyAccJerk-std()-X",
                            "tBodyAccJerk-std()-Y",
                            "tBodyAccJerk-std()-Z",
                            "tBodyGyro-mean()-X",
                            "tBodyGyro-mean()-Y",
                            "tBodyGyro-mean()-Z",
                            "tBodyGyro-std()-X",
                            "tBodyGyro-std()-Y",
                            "tBodyGyro-std()-Z",
                            "tBodyGyroJerk-mean()-X",
                            "tBodyGyroJerk-mean()-Y",
                            "tBodyGyroJerk-mean()-Z",
                            "tBodyGyroJerk-std()-X",
                            "tBodyGyroJerk-std()-Y",
                            "tBodyGyroJerk-std()-Z",
                            "tBodyAccMag-mean()",
                            "tBodyAccMag-std()",
                            "tGravityAccMag-mean()",
                            "tGravityAccMag-std()",
                            "tBodyAccJerkMag-mean()",
                            "tBodyAccJerkMag-std()",
                            "tBodyGyroMag-mean()",
                            "tBodyGyroMag-std()",
                            "tBodyGyroJerkMag-mean()",
                            "tBodyGyroJerkMag-std()",
                            "fBodyAcc-mean()-X",
                            "fBodyAcc-mean()-Y",
                            "fBodyAcc-mean()-Z",
                            "fBodyAcc-std()-X",
                            "fBodyAcc-std()-Y",
                            "fBodyAcc-std()-Z",
                            "fBodyAccJerk-mean()-X",
                            "fBodyAccJerk-mean()-Y",
                            "fBodyAccJerk-mean()-Z",
                            "fBodyAccJerk-std()-X",
                            "fBodyAccJerk-std()-Y",
                            "fBodyAccJerk-std()-Z",
                            "fBodyGyro-mean()-X",
                            "fBodyGyro-mean()-Y",
                            "fBodyGyro-mean()-Z",
                            "fBodyGyro-std()-X",
                            "fBodyGyro-std()-Y",
                            "fBodyGyro-std()-Z",
                            "fBodyAccMag-mean()",
                            "fBodyAccMag-std()",
                            "fBodyBodyAccJerkMag-mean()",
                            "fBodyBodyAccJerkMag-std()",
                            "fBodyBodyGyroMag-mean()",
                            "fBodyBodyGyroMag-std()",
                            "fBodyBodyGyroJerkMag-mean()",
                            "fBodyBodyGyroJerkMag-std()"
)


######################################################
### ASSIGNMENT STEP 5: From the data set in step 4 ### 
###   creates a second, independent tidy data set  ###    
###   with the average of each variable for each   ###
###           activity and each subject            ###
######################################################

averagedDataTable <- group_by(mergedDataTable, Subject, Activity)
averagedDataTable <- averagedDataTable %>% summarise_all(mean)

names(averagedDataTable) <- c("Subject",
                              "Activity",
                              "averageOfTBodyAcc-mean()-X",
                              "averageOfTBodyAcc-mean()-Y",
                              "averageOfTBodyAcc-mean()-Z",
                              "averageOfTBodyAcc-std()-X",
                              "averageOfTBodyAcc-std()-Y",
                              "averageOfTBodyAcc-std()-Z",
                              "averageOfTGravityAcc-mean()-X",
                              "averageOfTGravityAcc-mean()-Y",
                              "averageOfTGravityAcc-mean()-Z",
                              "averageOfTGravityAcc-std()-X",
                              "averageOfTGravityAcc-std()-Y",
                              "averageOfTGravityAcc-std()-Z",
                              "averageOfTBodyAccJerk-mean()-X",
                              "averageOfTBodyAccJerk-mean()-Y",
                              "averageOfTBodyAccJerk-mean()-Z",
                              "averageOfTBodyAccJerk-std()-X",
                              "averageOfTBodyAccJerk-std()-Y",
                              "averageOfTBodyAccJerk-std()-Z",
                              "averageOfTBodyGyro-mean()-X",
                              "averageOfTBodyGyro-mean()-Y",
                              "averageOfTBodyGyro-mean()-Z",
                              "averageOfTBodyGyro-std()-X",
                              "averageOfTBodyGyro-std()-Y",
                              "averageOfTBodyGyro-std()-Z",
                              "averageOfTBodyGyroJerk-mean()-X",
                              "averageOfTBodyGyroJerk-mean()-Y",
                              "averageOfTBodyGyroJerk-mean()-Z",
                              "averageOfTBodyGyroJerk-std()-X",
                              "averageOfTBodyGyroJerk-std()-Y",
                              "averageOfTBodyGyroJerk-std()-Z",
                              "averageOfTBodyAccMag-mean()",
                              "averageOfTBodyAccMag-std()",
                              "averageOfTGravityAccMag-mean()",
                              "averageOfTGravityAccMag-std()",
                              "averageOfTBodyAccJerkMag-mean()",
                              "averageOfTBodyAccJerkMag-std()",
                              "averageOfTBodyGyroMag-mean()",
                              "averageOfTBodyGyroMag-std()",
                              "averageOfTBodyGyroJerkMag-mean()",
                              "averageOfTBodyGyroJerkMag-std()",
                              "averageOfFBodyAcc-mean()-X",
                              "averageOfFBodyAcc-mean()-Y",
                              "averageOfFBodyAcc-mean()-Z",
                              "averageOfFBodyAcc-std()-X",
                              "averageOfFBodyAcc-std()-Y",
                              "averageOfFBodyAcc-std()-Z",
                              "averageOfFBodyAccJerk-mean()-X",
                              "averageOfFBodyAccJerk-mean()-Y",
                              "averageOfFBodyAccJerk-mean()-Z",
                              "averageOfFBodyAccJerk-std()-X",
                              "averageOfFBodyAccJerk-std()-Y",
                              "averageOfFBodyAccJerk-std()-Z",
                              "averageOfFBodyGyro-mean()-X",
                              "averageOfFBodyGyro-mean()-Y",
                              "averageOfFBodyGyro-mean()-Z",
                              "averageOfFBodyGyro-std()-X",
                              "averageOfFBodyGyro-std()-Y",
                              "averageOfFBodyGyro-std()-Z",
                              "averageOfFBodyAccMag-mean()",
                              "averageOfFBodyAccMag-std()",
                              "averageOfFBodyBodyAccJerkMag-mean()",
                              "averageOfFBodyBodyAccJerkMag-std()",
                              "averageOfFBodyBodyGyroMag-mean()",
                              "averageOfFBodyBodyGyroMag-std()",
                              "averageOfFBodyBodyGyroJerkMag-mean()",
                              "averageOfFBodyBodyGyroJerkMag-std()"
)

write.table(averagedDataTable, file = "./averagedDataTable.txt", row.names = FALSE)