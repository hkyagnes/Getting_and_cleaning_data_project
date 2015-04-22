#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

setwd("~/Desktop/assignment")    ##set the directory where there are all the files needed

## Read all the data needed
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_test <- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
features <- read.table("features.txt")

#The following steps are modification of variable names, to be matched to the measurements
features[,2] <- gsub("[()]","", features[,2])            ## remove "()"
features[,2] <- gsub("[-]","", features[,2])             ## remove "-"
features[,2] <- tolower(features[,2])                    ## change the characters to lowercase
features[,2] <- gsub("^t", "time", features[,2])          ## replace "t" to "time
features[,2] <- gsub("^f", "freq", features[,2])          ## replace "f" to "freq"
features[,2] <- gsub("[,]","", features[,2])              ## remove the ","

#Merge datasets
test <- cbind(subject_test, y_test)                 ## Merge subjects with activities of the test group
names(test) <- c("subject", "activities")           ## assign the column names to the subject and activities

train <- cbind(subject_train, y_train)              ## Merge subjects with activities of the train group 
names(train) <- c("subject", "activities")          ## assign the column names to the subject and activities

names(X_test) <- features[,2]                       ## assign column names to the measurements of the test group
names(X_train) <- features[,2]                      ## assign column names to the measurements of the train group

Mean_std <- grepl("mean|std", features[,2])         ## logic vector for subsetting the mean and the standard deviation column from the measurements
test_meansd <- X_test[,Mean_std]                    ## subset only mean and SD column from test-measurement
train_meansd <- X_train[,Mean_std]                  ## subset only mean and SD column from train-measurement

test_combined <- cbind(test, test_meansd)                ## Merge the subject, activities and measurements of test group
train_combined <- cbind(train, train_meansd)             ## Merge the subject, activities and measurements of train group

test_train <- rbind(test_combined, train_combined)       ##Merge the test and train data together

## add the activity name
test_train[,2] <- gsub("1", "walking", test_train[,2])
test_train[,2] <- gsub("2", "walking_upstairs", test_train[,2])
test_train[,2] <- gsub("3", "walking_downstairs", test_train[,2])
test_train[,2] <- gsub("4", "sitting", test_train[,2])
test_train[,2] <- gsub("5", "standing", test_train[,2])
test_train[,2] <- gsub("6", "laying", test_train[,2])

Final <- aggregate(test_train[, 3:88], by= list(subject = test_train$subject, activities = test_train$activities), mean)
## calculate the mean of each measurement for each subject and activities
Final <- arrange (Final, subject, activities)  ##sort the final data frame with the subject and activities(alphabetical order)
write.file(Final, file ="tidy_data.txt", row.names = FALSE)
