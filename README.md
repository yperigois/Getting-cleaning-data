# Getting-cleaning-data

##How the script is working:
  Loading "data.table" and "dplyr" packages
  
  Reading and loading raw data with fread fonction:
  
    -For test and training data set loading subject, y and x file
    
  For X, Y and subject data set, adding test and training data
 
  	-k_xx: global (Test+traing) dataset for X variable (561 data for each line)
 
  	-k_yy: global dataset for Y variable (activity code 1 to 6)
 
  	-k_subject: global dataset for subject variable (Id of person doing the test: 1:30)
  
  Read and load the features file to list all the items that are recorded in the X files
  
  Adding to k_xx the column names loaded from Features
  
  From Features extract only those that contain "mean" and "std"
  
  In k_xx, keep columns that contain "mean" and "std" in their name
  
  Create one table "k_all" with subject identification, activity identification, all records including mean and std features
  
  Loading the activity labels and  adding to k_all a new column called "Activity Name" with activity label corresponding to activity identification
  
  Keeping columns in the following order: "subject", "activity Name", and columns containing "mean" or "std"

  Group the table by subject and Acivity Name
  
  With simmarise_each function, calculate the mean of the features grouped by subject and "Activity Name"
  
  
##Codebook
  
  subject.V1: subject identification-integer 1..30
  
  Activity Name: Name of activity of subject: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
  
  Mean of each of the following features (containing either "mean" or "std" in their name)
  
    "tBodyAcc.mean...X"
    
    "tBodyAcc.mean...Y"
    "tBodyAcc.mean...Z"
    "tBodyAcc.std...X"
    "tBodyAcc.std...Y"
    "tBodyAcc.std...Z"
    "tGravityAcc.mean...X"
    "tGravityAcc.mean...Y"
    "tGravityAcc.mean...Z"
    "tGravityAcc.std...X"
    "tGravityAcc.std...Y"
    "tGravityAcc.std...Z"
    "tBodyAccJerk.mean...X"
    "tBodyAccJerk.mean...Y"
    "tBodyAccJerk.mean...Z"
    "tBodyAccJerk.std...X"
    "tBodyAccJerk.std...Y"
    "tBodyAccJerk.std...Z"
    "tBodyGyro.mean...X"
    "tBodyGyro.mean...Y"
    "tBodyGyro.mean...Z"
    "tBodyGyro.std...X"
    "tBodyGyro.std...Y"
    "tBodyGyro.std...Z"
    "tBodyGyroJerk.mean...X"
    "tBodyGyroJerk.mean...Y"
    "tBodyGyroJerk.mean...Z"
    "tBodyGyroJerk.std...X"
    "tBodyGyroJerk.std...Y"
    "tBodyGyroJerk.std...Z"
    "tBodyAccMag.mean.."
    "tBodyAccMag.std.."
    "tGravityAccMag.mean.."
    "tGravityAccMag.std.."
    "tBodyAccJerkMag.mean.."
    "tBodyAccJerkMag.std.."
    "tBodyGyroMag.mean.."
    "tBodyGyroMag.std.."
    "tBodyGyroJerkMag.mean.."
    "tBodyGyroJerkMag.std.."
    "fBodyAcc.mean...X"
    "fBodyAcc.mean...Y"
    "fBodyAcc.mean...Z"
    "fBodyAcc.std...X"
    "fBodyAcc.std...Y"
    "fBodyAcc.std...Z"
    "fBodyAcc.meanFreq...X"
    "fBodyAcc.meanFreq...Y"
    "fBodyAcc.meanFreq...Z"
    "fBodyAccJerk.mean...X"
    "fBodyAccJerk.mean...Y"
    "fBodyAccJerk.mean...Z"
    "fBodyAccJerk.std...X"
    "fBodyAccJerk.std...Y"
    "fBodyAccJerk.std...Z"
    "fBodyAccJerk.meanFreq...X"
    "fBodyAccJerk.meanFreq...Y"
    "fBodyAccJerk.meanFreq...Z"
    "fBodyGyro.mean...X"
    "fBodyGyro.mean...Y"
    "fBodyGyro.mean...Z"
    "fBodyGyro.std...X"
    "fBodyGyro.std...Y"
    "fBodyGyro.std...Z"
    "fBodyGyro.meanFreq...X"
    "fBodyGyro.meanFreq...Y"
    "fBodyGyro.meanFreq...Z"
    "fBodyAccMag.mean.."
    "fBodyAccMag.std.."
    "fBodyAccMag.meanFreq.."
    "fBodyBodyAccJerkMag.mean.."
    "fBodyBodyAccJerkMag.std.."
    "fBodyBodyAccJerkMag.meanFreq.."
    "fBodyBodyGyroMag.mean.."
    "fBodyBodyGyroMag.std.."
    "fBodyBodyGyroMag.meanFreq.."
    "fBodyBodyGyroJerkMag.mean.."
    "fBodyBodyGyroJerkMag.std.."
    "fBodyBodyGyroJerkMag.meanFreq.."
  
  
  
  
  
  

  
  
  
  
    
