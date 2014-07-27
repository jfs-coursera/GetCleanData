CodeBook
========
(This part is extracted from the project page of the course)
One of the most exciting areas in all of data science right now is wearable
computing - see for example this article . Companies like Fitbit, Nike, and
Jawbone Up are racing to develop the most advanced algorithms to attract new
users. The data linked to from the course website represent data collected from
the accelerometers from the Samsung Galaxy S smartphone. A full description is
available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip>


Tidy Data Sets
--------------

There are two tidy data sets:

1. **data**: means and standard deviations, subject, activity and activity label
2. **data2**: means of means and standard deviations (from data), subject, activity and
          activity label

All the data except activity labels come from the following files:

* train/X_train.txt
* train/y_train.txt
* test/X_test.txt
* test/y_test.txt

The activity labels comes from the file named activity_labels.txt


## Data set: **data** ##
Contains means (-means() and -meanFreq()) and standard deviations (-std()) of
measurements, for each subject and the activities performed by said subject.

1. tBodyAcc-mean()-X
1. tBodyAcc-mean()-Y
1. tBodyAcc-mean()-Z
1. tGravityAcc-mean()-X
1. tGravityAcc-mean()-Y
1. tGravityAcc-mean()-Z
1. tBodyAccJerk-mean()-X
1. tBodyAccJerk-mean()-Y
1. tBodyAccJerk-mean()-Z
1. tBodyGyro-mean()-X
1. tBodyGyro-mean()-Y
1. tBodyGyro-mean()-Z
1. tBodyGyroJerk-mean()-X
1. tBodyGyroJerk-mean()-Y
1. tBodyGyroJerk-mean()-Z
1. tBodyAccMag-mean()
1. tGravityAccMag-mean()
1. tBodyAccJerkMag-mean()
1. tBodyGyroMag-mean()
1. tBodyGyroJerkMag-mean()
1. fBodyAcc-mean()-X
1. fBodyAcc-mean()-Y
1. fBodyAcc-mean()-Z
1. fBodyAcc-meanFreq()-X
1. fBodyAcc-meanFreq()-Y
1. fBodyAcc-meanFreq()-Z
1. fBodyAccJerk-mean()-X
1. fBodyAccJerk-mean()-Y
1. fBodyAccJerk-mean()-Z
1. fBodyAccJerk-meanFreq()-X
1. fBodyAccJerk-meanFreq()-Y
1. fBodyAccJerk-meanFreq()-Z
1. fBodyGyro-mean()-X
1. fBodyGyro-mean()-Y
1. fBodyGyro-mean()-Z
1. fBodyGyro-meanFreq()-X
1. fBodyGyro-meanFreq()-Y
1. fBodyGyro-meanFreq()-Z
1. fBodyAccMag-mean()
1. fBodyAccMag-meanFreq()
1. fBodyBodyAccJerkMag-mean()
1. fBodyBodyAccJerkMag-meanFreq()
1. fBodyBodyGyroMag-mean()
1. fBodyBodyGyroMag-meanFreq()
1. fBodyBodyGyroJerkMag-mean()
1. fBodyBodyGyroJerkMag-meanFreq()
1. tBodyAcc-std()-X
1. tBodyAcc-std()-Y
1. tBodyAcc-std()-Z
1. tGravityAcc-std()-X
1. tGravityAcc-std()-Y
1. tGravityAcc-std()-Z
1. tBodyAccJerk-std()-X
1. tBodyAccJerk-std()-Y
1. tBodyAccJerk-std()-Z
1. tBodyGyro-std()-X
1. tBodyGyro-std()-Y
1. tBodyGyro-std()-Z
1. tBodyGyroJerk-std()-X
1. tBodyGyroJerk-std()-Y
1. tBodyGyroJerk-std()-Z
1. tBodyAccMag-std()
1. tGravityAccMag-std()
1. tBodyAccJerkMag-std()
1. tBodyGyroMag-std()
1. tBodyGyroJerkMag-std()
1. fBodyAcc-std()-X
1. fBodyAcc-std()-Y
1. fBodyAcc-std()-Z
1. fBodyAccJerk-std()-X
1. fBodyAccJerk-std()-Y
1. fBodyAccJerk-std()-Z
1. fBodyGyro-std()-X
1. fBodyGyro-std()-Y
1. fBodyGyro-std()-Z
1. fBodyAccMag-std()
1. fBodyBodyAccJerkMag-std()
1. fBodyBodyGyroMag-std()
1. fBodyBodyGyroJerkMag-std()
1. Subject

    There are 30 subjects, numbered from 1 to 30.

1. Activity

    There are 6 sorts of activities numbered from 1 to 6

1. ActivityLabel

    The label corresponding to the activity



## Data set: **data2** ##

Contains the means of means and standard deviations of measurements, for each
pair subject-activity.
The variable names are the same as for the data set named **data** (lack of time
and... laziness...).

1. tBodyAcc-mean()-X
1. tBodyAcc-mean()-Y
1. tBodyAcc-mean()-Z
1. tGravityAcc-mean()-X
1. tGravityAcc-mean()-Y
1. tGravityAcc-mean()-Z
1. tBodyAccJerk-mean()-X
1. tBodyAccJerk-mean()-Y
1. tBodyAccJerk-mean()-Z
1. tBodyGyro-mean()-X
1. tBodyGyro-mean()-Y
1. tBodyGyro-mean()-Z
1. tBodyGyroJerk-mean()-X
1. tBodyGyroJerk-mean()-Y
1. tBodyGyroJerk-mean()-Z
1. tBodyAccMag-mean()
1. tGravityAccMag-mean()
1. tBodyAccJerkMag-mean()
1. tBodyGyroMag-mean()
1. tBodyGyroJerkMag-mean()
1. fBodyAcc-mean()-X
1. fBodyAcc-mean()-Y
1. fBodyAcc-mean()-Z
1. fBodyAcc-meanFreq()-X
1. fBodyAcc-meanFreq()-Y
1. fBodyAcc-meanFreq()-Z
1. fBodyAccJerk-mean()-X
1. fBodyAccJerk-mean()-Y
1. fBodyAccJerk-mean()-Z
1. fBodyAccJerk-meanFreq()-X
1. fBodyAccJerk-meanFreq()-Y
1. fBodyAccJerk-meanFreq()-Z
1. fBodyGyro-mean()-X
1. fBodyGyro-mean()-Y
1. fBodyGyro-mean()-Z
1. fBodyGyro-meanFreq()-X
1. fBodyGyro-meanFreq()-Y
1. fBodyGyro-meanFreq()-Z
1. fBodyAccMag-mean()
1. fBodyAccMag-meanFreq()
1. fBodyBodyAccJerkMag-mean()
1. fBodyBodyAccJerkMag-meanFreq()
1. fBodyBodyGyroMag-mean()
1. fBodyBodyGyroMag-meanFreq()
1. fBodyBodyGyroJerkMag-mean()
1. fBodyBodyGyroJerkMag-meanFreq()
1. tBodyAcc-std()-X
1. tBodyAcc-std()-Y
1. tBodyAcc-std()-Z
1. tGravityAcc-std()-X
1. tGravityAcc-std()-Y
1. tGravityAcc-std()-Z
1. tBodyAccJerk-std()-X
1. tBodyAccJerk-std()-Y
1. tBodyAccJerk-std()-Z
1. tBodyGyro-std()-X
1. tBodyGyro-std()-Y
1. tBodyGyro-std()-Z
1. tBodyGyroJerk-std()-X
1. tBodyGyroJerk-std()-Y
1. tBodyGyroJerk-std()-Z
1. tBodyAccMag-std()
1. tGravityAccMag-std()
1. tBodyAccJerkMag-std()
1. tBodyGyroMag-std()
1. tBodyGyroJerkMag-std()
1. fBodyAcc-std()-X
1. fBodyAcc-std()-Y
1. fBodyAcc-std()-Z
1. fBodyAccJerk-std()-X
1. fBodyAccJerk-std()-Y
1. fBodyAccJerk-std()-Z
1. fBodyGyro-std()-X
1. fBodyGyro-std()-Y
1. fBodyGyro-std()-Z
1. fBodyAccMag-std()
1. fBodyBodyAccJerkMag-std()
1. fBodyBodyGyroMag-std()
1. fBodyBodyGyroJerkMag-std()
1. Subject

    There are 30 subjects, numbered from 1 to 30.

1. Activity

    There are 6 sorts of activities numbered from 1 to 6

1. ActivityLabel

    The label corresponding to the activity

