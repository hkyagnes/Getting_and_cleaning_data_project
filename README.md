# Getting_and_cleaning_data_project
This is a repo for the “Getting and cleaning data” course project.
This repo contain a R script, run_analysis.R, a codebook and this readme file.

The raw data were downloaded from the following website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file is unzipped with Mac OS X built-in software.
There are 6 items in the “UCI HAR Dataset” file, including 1) activity_labels.txt, 2) features_info.txt, 3) features.txt, 4) README.txt and 5-6) the two folders “test” and “train” which contains the datasets 

A folder called “assignment” is created in the local desktop for the convenience of reading the files into R. The following files were copy and pasted to the “assignment” folder from the downloaded dataset. “activity_labels.txt”,“features.txt”,  from “test” folder, “subject_test.txt”, “X_test.txt”,  “y_test.txt”, and from “train” folder, “subject_train.txt”, “X_train.txt”, “y_train”. 

The code cook contains the variable names (column names, i.e. the normalized measurements from the smartphone) and the observations (each subject in both test and train group, for each activities). In addition, it also contains the details of what run_analysis.R does. 

##The R script, run_analysis.R, did the following steps to create a tidy dataset:
1. Read the files from the local directory into R
2. Modify the names from “features.txt”, as it is to be used as the variable names
3. Merge the files with subject ID, activities labels 
4. Assign names of measurements of each groups together, subset the measurements with mean and the standard deviation data and then join with the subject and activities 
5. Create dataset with the average of each variable for each activity and each subject

###Details explanation of the run_analysis.R
1. dplyr package is called

2. The file is unzipped with Mac OS X built-in software.
There are 6 items in the “UCI HAR Dataset” file, including 1) activity_labels.txt, 2) features_info.txt, 3) features.txt, 4) README.txt and 5-6) the two folders “test” and “train” which contains the datasets 

A folder called “assignment” is created in the local desktop for the convenience of reading the files into R. The following files were copy and pasted to the “assignment” folder from the downloaded dataset. “activity_labels.txt”,“features.txt”,  from “test” folder, “subject_test.txt”, “X_test.txt”,  “y-test.txt”, and from “train” folder, “subject_train.txt”, “X_train.txt”, “y_train”. 
 
“subject_test.txt” contains the subject ID of the test group; “y_test.txt” contains the activities recorded; “X_test” contains the measurement data
“subject_train.txt” contains the subject ID of the train group; “y_train.txt” contains the activities recorded; “X_train” contains the measurement data
All these files are read into R and assigned with variable names(for simplicity, they are the same as the file names)
  
3. Modification of the names from “features.txt”:
   removed “()”, “-”, “,” from the names of each measurement; and then change to all   lowercase; replace “t” with “time” and “f” with “freq” for easier reading

4. For ‘test’ data: 
Subject and activities data were merged by joining the column (cbind) and then given the column name, “subject” and “activities”.
Repeat the same for the ‘train’ data

 5. The measurements were given names, then subset the measurements columns with mean and standard deviation with text matching (grep)
Since there are too many variables (~561 variables), so the mean and SD are subsetted, and then join with subject and activities label together by the row(rbind)

6. The activities represented by numbers were given names (provided in “activities_label.txt”
1 walking
2 walking__upstairs
3 walking_downstairs
4 sitting
5 standing
6 laying


7. The mean of each measurements of each subjects and each activities are calculated with ‘aggregate’ and assigned to a R object ‘Final’(data frame)

8. The results were arranged with the subject (ascending order) and the activities names (alphabetical order)

9. The result is saved in a txt file with name, ‘tidy_data.txt’



