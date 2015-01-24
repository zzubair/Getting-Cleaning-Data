# CodeBook
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Data Source
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Files from data source
'README.txt'
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.

## Description of data in files.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Variables used in run_analysis.R and their description
features        : Stores data from features.txt
activity_labels : Stores data from activity_labels.txt
y_test          : Stores data from y_test.txt   
X_test          : Stores data from X_test.txt 
subject_test    : Stores data from subject_test.txt 
subject_train   : Stores data from subject_train.txt
X_train         : Stores data from X_train.txt
y_train         : Stores data from y_train.txt
