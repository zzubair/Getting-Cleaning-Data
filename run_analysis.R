# For the Getting & Cleaning course project, create an R script called run_analysis.R that does the following: 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


require("data.table")
require("reshape2")

# Load label files
features         <- read.table("./UCI HAR Dataset/features.txt")[,2]
activity_labels  <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load test files
y_test           <- read.table("./UCI HAR Dataset/test/y_test.txt")
X_test           <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test     <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Load train files
subject_train    <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train          <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train          <- read.table("./UCI HAR Dataset/train/y_train.txt")

extract_features <- grepl("mean|std", features)

# Set feature names in X_test & extract only meansurments on mean and standard
names(X_test) = features
X_test = X_test[,extract_features]

# set activity names in y_test
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data into test_data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Extract mean and standard measurements
names(X_train) = features
X_train = X_train[,extract_features]

# Load and process activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data into train_data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
merged_data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./UCI HAR Dataset/tidy_data.txt")



