#CODE BOOK FOR: Summarized Human Activity Recognition Using Smartphones Data Set

This data book describes the variables and data in the *summarizedDS.txt* data set and transformations and work applied to the *Input Data* [The Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) to produce the summarized version *summarizedDS.txt*

##Summary of Transformations and Work 
1. Clean the environment.
2. Generate a directory for raw data (in this example the raw data directory is the same working directory so the *Input Data* dataset zip file can be expanded inside the working directory).
3. Save the *Input Data* dataset zip file url to a variable.
4. Download the *Input Data* dataset zip file.
5. Extract *Input Data* dataset zip file to a directory name stored in the variable "sourceDir".
6. Read the *features.txt* file, pull the column with the *Input Data* dataset column labels and save it to "features".
7. Modify the column labels in the "features" by removing brackets, hyphens, commas, converting to lower case, and finally, replacing acronyms with more descriptive names as per tidy data principles.
8. Make unique column labels as there are repeated column labes in *features.txt*.
9. Create an activity codes tibble using the activity codes in *activity_labels.txt* from the *Input Data* dataset.
###Read the test data from *X_test.txt* from the *Input Data* dataset using "features" as the vector of column names.
###Using dplyr select the mean and standard deviation variables.
###Using dplyr add the subject column as a factor column from *subject_test.txt* from the *Input Data* dataset.
###Using dplyr add the activity column as a numeric column from *y_test.txt* from the *Input Data* datase (to be changed to factors later).
###Using dplyr replace the activity column values with character activity labels from the activity codes tibble generated above modifying it to factor column making sure all the possible factors 1###are considered.
###Read the test data from *X_train.txt* from the *Input Data* dataset using "features" as the vector of column names.
###Using dplyr select the mean and standard deviation variables.
###Using dplyr add the subject column as a factor column from *subject_train.txt* from the *Input Data* dataset.
###Using dplyr add the activity column as a numeric column from *y_train.txt* from the *Input Data* datase (to be changed to factors later).
###Using dplyr replace the activity column values with character activity labels from the activity codes tibble generated above modifying it to factor column making sure all the possible factors 1###are considered.
###Join the test and train data sets into "fullDS" taking advantage the fact that the column names are exactly the same.
###Group fullDS by "activitylabel" and "subject" and summarize all variables using mean and save it to "summarizedDS"
###Write summarizedDS into a txt file

##Variable Codes
###activitylabel
This is the manually recorded activity from video recording the subject while the meassurement are being taken.  This is a factor variable that can take only the following values: ALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
###subject
This is the person identification number stored as a factor variable taking integer values from 1 to 30.
###timebodyaccelerationmeanx_average
This is the mean of the time body acceleration signal in X-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationmeany_average
This is the mean of the time body acceleration signal in y-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationmeanz_average
This is the mean of the time body acceleration signal in z-axial direction.  The data is normalized and averaged by subject and activity label.
###timegravityaccelerationmeanx_average
This is the mean of the time gravity acceleration signal in X-axial direction.  The data is normalized and averaged by subject and activity label.
###timegravityaccelerationmeany_average
This is the mean of the time gravity acceleration signal in y-axial direction.  The data is normalized and averaged by subject and activity label.
###timegravityaccelerationmeanz_average
This is the mean of the time gravity acceleration signal in z-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationjerkmeanx_average
This is the mean of the time body acceleration jerk signal in X-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationjerkmeany_average
This is the mean of the time body acceleration jerk signal in y-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationjerkmeanz_average
This is the mean of the time body acceleration jerk signal in z-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodygyromeanx_average
This is the mean of the time body gyro signal in X-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodygyromeany_average
This is the mean of the time body gyro signal in y-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodygyromeanz_average
This is the mean of the time body gyro signal in z-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodygyrojerkmeanx_average
This is the mean of the time body gyro jerk signal in X-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodygyrojerkmeany_average
This is the mean of the time body gyro jerk signal in y-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodygyrojerkmeanz_average
This is the mean of the time body gyro jerk signal in z-axial direction.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationmagstandarddeviation_average
This is the standard deviation of the time body acceleration magnitude.  The data is normalized and averaged by subject and activity label.
###timegravityaccelerationmagstandarddeviation_average
This is the standard deviation of the time gravity acceleration magnitude.  The data is normalized and averaged by subject and activity label.
###timebodyaccelerationjerkmagstandarddeviation_average
This is the standard deviation of the time body acceleration jerk magnitude.  The data is normalized and averaged by subject and activity label.
###timebodygyromagstandarddeviation_average
This is the standard deviation of the time body gyro magnitude.  The data is normalized and averaged by subject and activity label.
###timebodygyrojerkmagstandarddeviation_average
This is the standard deviation of the time body gyro jerk magnitude.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationmeanx_average
This is the mean of the body acceleration signal's fast Fourier transform in X-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationmeany_average
This is the mean of the body acceleration signal's fast Fourier transform in y-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationmeanz_average
This is the mean of the body acceleration signal's fast Fourier transform in z-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationjerkmeanx_average
This is the mean of the body acceleration jerk signal's fast Fourier transform in X-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationjerkmeany_average
This is the mean of the body acceleration jerk signal's fast Fourier transform in y-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationjerkmeanz_average
This is the mean of the body acceleration jerk signal's fast Fourier transform in z-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodygyromeanx_average
This is the mean of the body gyro signal's fast Fourier transform in X-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodygyromeany_average
This is the mean of the body gyro signal's fast Fourier transform in y-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodygyromeanz_average
This is the mean of the body gyro signal's fast Fourier transform in z-axial direction.  The data is normalized and averaged by subject and activity label.
###fastfourierbodyaccelerationmagstandarddeviation_average
This is the mean of the body acceleration magnitude's fast Fourier transform.  The data is normalized and averaged by subject and activity label.
###fastfourierbodybodyaccelerationjerkmagstandarddeviation_average
This is the mean of the body acceleration jerk magnitude's fast Fourier transform.  The data is normalized and averaged by subject and activity label.
###fastfourierbodybodygyromagstandarddeviation_average
This is the mean of the body gyro magnitude's fast Fourier transform.  The data is normalized and averaged by subject and activity label.
###fastfourierbodybodygyrojerkmagstandarddeviation_average
This is the mean of the body gyro jerk magnitude's fast Fourier transform.  The data is normalized and averaged by subject and activity label.

###NOTE: For full details on the *Input Data* variables please refer to the links provided in the *README.md* file.