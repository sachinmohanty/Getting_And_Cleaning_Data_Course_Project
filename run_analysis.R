
## STEP-1: Merging Train & Test data sets to create one data set.
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# New Data Set created for X, Y and Subject by merging the corressponding Train & Test datasets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)


## STEP-2: Extract Measurement on the Mean and Standard Deviation for each measurement
features <- read.table("features.txt")

# Getting Columns with Mean() & Std()
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]


## STEP3: Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

# updating correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"


## STEP-4: Appropriately label datasets with descriptive variable names
names(subject_data) <- "subject"
all_data <- cbind(x_data, y_data, subject_data)


## Step-5: Create TIDY data set by taking average of each variable of an activity
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

#Creating "averages_data.txt" file
write.table(averages_data, "averages_data.txt", row.name=FALSE)
