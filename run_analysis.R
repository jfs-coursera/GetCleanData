## Some constants
DATADIR  <- "./UCI HAR Dataset"  ## directory where data are unzipped
TRAINDIR <- paste(DATADIR, "train", sep = "/")
TESTDIR  <- paste(DATADIR, "test", sep = "/")
OUTPUTDIR <- "./datasets"


################################################################################
# 1. Merges the training and the test sets to create one data set.
################################################################################
## The structure seems to be important here. Based on a comment by David Hood
## in the course forum, I create the same structure indicated in the Readme.md
## (forum: https://class.coursera.org/getdata-005/forum/thread?thread_id=23)

## Variable names are in the file "features.txt"
## So we read them from the file, and only keep the 2nd column.
## Finally, we append "Subject" and "Activity" as the last column names.
features <- read.csv(paste(DATADIR, "features.txt", sep = "/"),
                     sep = " ", header = FALSE, stringsAsFactors = FALSE)
varNames <- features[, 2]
varNames <- c(varNames, "Subject", "Activity")


## Data:
## First, X_train
train <- read.table(paste(TRAINDIR, "X_train.txt", sep = "/"))
subjectT<- readLines(paste(TRAINDIR, "subject_train.txt", sep = "/"))
yT<- readLines(paste(TRAINDIR, "y_train.txt", sep = "/"))

## Append subjectTrain and yTrain as the last two columns
## /!\ Use the same variable names for train and test
## so merge() sees the same names in train and test data sets
train <- cbind(train, subjectT, yT)


## Second, X_test
test <- read.table(paste(TESTDIR, "X_test.txt", sep = "/"))
subjectT<- readLines(paste(TESTDIR, "subject_test.txt", sep = "/"))
yT<- readLines(paste(TESTDIR, "y_test.txt", sep = "/"))

## Append subjectTest and yTest as the last two columns
## /!\ Use the same variable names for train and test
## so merge() sees the same names in train and test data sets
test <- cbind(test, subjectT, yT)


## Merge all to get the whole data set
data <- merge(train, test, all = TRUE)
## Add the variable names as the column names
names(data) <- varNames


################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement. 
################################################################################
## Not sure about what it means.
## My interpretation: get columns of means and std, i.e. columns where the
## variable name contains mean() or std().
## Don't forget "Subject" and "Activity", the last two column names.
means <- grep("mean", varNames)  ## gets the indices of the columns
stds <- grep("std", varNames)
cols <- c(means, stds)
colNames <- c(varNames[cols], tail(varNames, n = 2))

## retrieve only those columns
data <- data[, colNames]


################################################################################
# 3. Uses descriptive activity names to name the activities in the data set
################################################################################
## Activity names are in the file "activity_labels.txt"
## So we read them from the file, and only keep the 2nd column.
actLabels <- read.csv(paste(DATADIR, "activity_labels.txt", sep = "/"),
                      sep = " ", header = FALSE, stringsAsFactors = FALSE)
## Let's give names to the variables for easier handling
names(actLabels) <- c("Activity", "ActivityLabel")

## Create a new column for activity labels
## (Yes, I know, I could do that using plyr::join())
ActivityLabel = c()
for (i in 1:nrow(data)) {
    actNum <- data[, "Activity"][i]  ## get the activity number
    actRow <- actLabels[actLabels$Activity == actNum, ]  ## retrieve whole row
    actLab <- actRow[, "ActivityLabel"]  ## get the activity label in the row
    ActivityLabel <- c(ActivityLabel, actLab)
}

## And add the column to data
data <- cbind(data, ActivityLabel)


################################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
################################################################################
## Already done. Well, as long as you admit that "tBodyAcc-mean()-X" and friends
## are descriptive...


################################################################################
# 5. Creates a second, independent tidy data set with the average of each
# variable for each activity and each subject. 
################################################################################
## My interpretation: for each subject-activity, compute the means of the
## means() and std() variables.

library(plyr)
# SPLIT-APPLY-COMBINE
## convert to numeric
data[, "Subject"] <- as.numeric(data[, "Subject"])
data[, "Activity"] <- as.numeric(data[, "Activity"])
## Avoid ActivityLabel, because it is not numeric
m <- ddply(data[, 1:ncol(data)-1], .(Subject, Activity), colMeans)

## Add the column with the ActivityLabel
data2 <- join(m, actLabels, type = "inner")


################################################################################
# Finally, write the data sets to files on disk
################################################################################
if (!exists(OUTPUTDIR)) {
    dir.create(OUTPUTDIR)
}
write.table(data, paste(OUTPUTDIR, "data1.txt", sep = "/"))
write.table(data2, paste(OUTPUTDIR, "data2.txt", sep = "/"))


################################################################################
# END OF SCRIPT
################################################################################
