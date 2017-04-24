The script run_analysis.R performs the 5 steps described in the course project's 

Step-1: All the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Step-2: Only those columns with the mean and standard deviation measures are taken from the whole data sets. 
        After extracting these columns, they are given the correct names, taken from features.txt.
STEP-3: Activity data is addressed with values 1:6, all the activity names and IDs from activity_labels.txt and they are substituted in the data sets.
STEP-4: Column names are corrected on the whole data set
STEP-5: A new data sets is generated with all the average measures for each subject and activity type.
        The output file is called averages_data.txt, and uploaded to this repository.


# Variables
* Data from Downloaded files are stored in below variables
  x_train, y_train, x_test, y_test, subject_train and subject_test

* Below Variables are the merged data sets of the above variables
x_data, y_data and subject_data merge the previous dat asets to further analysis.

* Features contains the correct names for the x_data data set, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

* Same approach is taken with activity names through the activities variable.

* averages_data contains the relevant averages which will be later stored in a .txt file.