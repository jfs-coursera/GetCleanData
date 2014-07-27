Getting and Cleaning Data -- Project
====================================
(First, a Copy-Paste from the project page)

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip>

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
   measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable
   for each activity and each subject.


R Script: run_analysis.R
------------------------
The script has 5 parts, as stated above.

The beginning contains a few constants for the directories where the data files
are to be found.

## 1. Merging the data sets ##
The strucure of the final data set is explained in the discussion forum of
the course here:

  <https://class.coursera.org/getdata-005/forum/thread?thread_id=23> (must be
logged in to Coursera and be taking the course to see it...)

The structure is the one indicated by David Hood in this picture:

![Data sets](./Slide2.png)

The script constructs the very same structure, bit by bit:

1. Get the variable names from the file *features.txt*, and add *Subject* and
   *Activity*
2. Get *X_train.txt* data and add two columns using data from
   *subject_train.txt* and *y_train.txt* (for *Subject* and *Activity*), giving
   data set named **train**
3. Do the same with *X_test.txt*, *subject_test.txt* and *y_test.txt*, giving
   data set named **test**
4. Finally, merge both data sets **train** and **test**, giving the final data set
   named **data**
5. For ease of use, the columns are renamed with the variable names from point 1
   above


## 2. Extract measurements on the mean and standard deviation ##
I am not very sure of what is asked here, and I had not time to search the
discussion forum on that one. Looking at the variable names, I see that some of
them have names like *something-mean()* and *somethingelse-std()*, and also
*whatever-meanFreq()*. So I just get the columns whose name contains *mean* and
*std*. I discard *angle(...Mean...)*.

With a pair of grep instructions, I retrieve the column numbers for the variable
names needed. Without forgetting the two last columns...

At that point, hopefully, we have the first tidy data set, named **data**.


## 3. Use descriptive activity names ##
The activity names are in the file named *activity_labels.txt*. It is just a
matter of making kind of a join between **data** and the data read from the
file. We can do that using the *join()* function from the *plyr* package. But
here, I decided to go the old way, with a loop on the *Activity* column, and
retrieving the label corresponding to the activity number. A vector is
constructed, and a *cbind()* appends the new column to the right of the
data.frame.

I don't know if the idea was to replace the activity number by the activity
label, so I decided to add a new column.


## 4. Appropriately label the data set ##
Actually, this has already been done. I just reuse the original variable names.
We just have a subset of the original data. So for this part of the project, the
script does nothing, because it has nothing to do.


## 5. Create a second tidy data set with averages for each activity-subject ##
This sounds like a split-apply-combine problem. Using *ddply()* from the *plyr*
package does the trick. But, the *colMeans()* function does not like non
-numeric values. So *ddply()* is used here on all columns but the last
(ActivityLabel). This last column is appended again at the end, using a *join()*
this time.

At that point, hopefully, we have the second tidy data set, named **data2**.


## Final note ##
I had to search the Web in order to complete the assignement, looking for
technical information, for technical ideas, etc. I am okay with that, I am used
to that... Strangely enough, you always end up finding a solution or part of it
on StackOverflow... :-)

Everything has been done using the [Vim editor](http://www.vim.org).


