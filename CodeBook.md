Title: Codebook for “Getting and cleaning data” course project

Author: Ka Yi HUI

Date:22 April, 2015 

## Introduction
The purpose of this project is using the skills taught in the course (collect, work with, and clean a data set) to prepare tidy 
data that can be used for later analysis. “Human activity recognition using smartphone dataset” from Smartlab - Non Linear 
Complex Systems Laboratory DITEN - Universit‡ degli Studi di Genova.is used in this project.

The main tasks of this project is to creates an independent tidy dataset with the average of each variable for each activity and 
each subject.

##Study design and data processing
Provided by the “README.txt” of the downloaded dataset
“The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the 
data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational 
force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each 
window, a vector of features was obtained by calculating variables from the time and frequency domain.” 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

###Collection of the raw data
The data is obtained from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 
##Creating the tidy data file 
###Guide to create the tidy data file
1. Read the files from the local directory into R
2. Modify the names from “features.txt”, as it is to be used as the variable names
3. Merge the files with subject ID, activities labels 
4. Assign names of measurements of each groups together, subset the measurements with mean and the standard deviation data and 
then join with the subject and activities 
5. Create dataset with the average of each variable for each activity and each subject
 
###Cleaning of the data
1. dplyr package is called

2. The file is unzipped with Mac OS X built-in software.
There are 6 items in the “UCI HAR Dataset” file, including 1) activity_labels.txt, 2) features_info.txt, 3) features.txt, 
4) README.txt and 5-6) the two folders “test” and “train” which contains the datasets 

A folder called “assignment” is created in the local desktop for the convenience of reading the files into R. The following 
files were copy and pasted to the “assignment” folder from the downloaded dataset. “activity_labels.txt”,“features.txt”,  
from “test” folder, “subject_test.txt”, “X_test.txt”,  “y-test.txt”, and from “train” folder, “subject_train.txt”, “X_train.txt”,
“y_train”. 
 
“subject_test.txt” contains the subject ID of the test group; “y_test.txt” contains the activities recorded; “X_test” contains
the measurement data
“subject_train.txt” contains the subject ID of the train group; “y_train.txt” contains the activities recorded; “X_train” contains 
the measurement data
All these files are read into R and assigned with variable names(for simplicity, they are the same as the file names)
  
3. Modification of the names from “features.txt”:
   removed “()”, “-”, “,” from the names of each measurement; and then change to all   lowercase; replace “t” with “time” and 
   “f” with “freq” for easier reading

4. For ‘test’ data: 
Subject and activities data were merged by joining the column (cbind) and then given the column name, “subject” and “activities”.
Repeat the same for the ‘train’ data

 5. The measurements were given names, then subset the measurements columns with mean and standard deviation with text matching (grep)
Since there are too many variables (~561 variables), so the mean and SD are subsetted, and then join with subject and activities 
label together by the row(rbind)

6. The activities represented by numbers were given names (provided in “activities_label.txt”
1 walking
2 walking__upstairs
3 walking_downstairs
4 sitting
5 standing
6 laying

7. The mean of each measurements of each subjects and each activities are calculated with ‘aggregate’ and assigned to a 
R object ‘Final’(data frame)

8. The results were arranged with the subject (ascending order) and the activities names (alphabetical order)

9. The result is saved in a txt file with name, ‘tidy_data.txt’

##Description of the variables in the tidy_data.txt file

Dimensions of the dataset: 180 observations of 88 variables

Variables present in the dataset(int~ integer, chr~ Character) 
 
1	subject	[int] value:	1 to 30

2	activities	[chr]	laying, standing, sitting, walking, walking_upstairs, walking_downstairs

From column 3 to 88, are numeric

3	timebodyaccmeanx

4	timebodyaccmeany

5	timebodyaccmeanz

6	timebodyaccstdx

7	timebodyaccstdy

8	timebodyaccstdz

9	timegravityaccmeanx

10	timegravityaccmeany

11	timegravityaccmeanz

12	timegravityaccstdx

13	timegravityaccstdy

14	timegravityaccstdz

15	timebodyaccjerkmeanx

16	timebodyaccjerkmeany

17	timebodyaccjerkmeanz

18	timebodyaccjerkstdx

19	timebodyaccjerkstdy

20	timebodyaccjerkstdz

21	timebodygyromeanx

22	timebodygyromeany

23	timebodygyromeanz

24	timebodygyrostdx

25	timebodygyrostdy

26	timebodygyrostdz

27	timebodygyrojerkmeanx

28	timebodygyrojerkmeany

29	timebodygyrojerkmeanz

30	timebodygyrojerkstdx

31	timebodygyrojerkstdy

32	timebodygyrojerkstdz

33	timebodyaccmagmean

34	timebodyaccmagstd

35	timegravityaccmagmean

36	timegravityaccmagstd

37	timebodyaccjerkmagmean

38	timebodyaccjerkmagstd

39	timebodygyromagmean

40	timebodygyromagstd

41	timebodygyrojerkmagmean

42	timebodygyrojerkmagstd

43	freqbodyaccmeanx

44	freqbodyaccmeany

45	freqbodyaccmeanz

46	freqbodyaccstdx

47	freqbodyaccstdy

48	freqbodyaccstdz

49	freqbodyaccmeanfreqx

50	freqbodyaccmeanfreqy

51	freqbodyaccmeanfreqz

52	freqbodyaccjerkmeanx

53	freqbodyaccjerkmeany

54	freqbodyaccjerkmeanz

55	freqbodyaccjerkstdx

56	freqbodyaccjerkstdy

57	freqbodyaccjerkstdz

58	freqbodyaccjerkmeanfreqx

59	freqbodyaccjerkmeanfreqy

60	freqbodyaccjerkmeanfreqz

61	freqbodygyromeanx

62	freqbodygyromeany

63	freqbodygyromeanz

64	freqbodygyrostdx

65	freqbodygyrostdy

66	freqbodygyrostdz

67	freqbodygyromeanfreqx

68	freqbodygyromeanfreqy

69	freqbodygyromeanfreqz

70	freqbodyaccmagmean

71	freqbodyaccmagstd

72	freqbodyaccmagmeanfreq

73	freqbodybodyaccjerkmagmean

74	freqbodybodyaccjerkmagstd

75	freqbodybodyaccjerkmagmeanfreq

76	freqbodybodygyromagmean

77	freqbodybodygyromagstd

78	freqbodybodygyromagmeanfreq

79	freqbodybodygyrojerkmagmean

80	freqbodybodygyrojerkmagstd

81	freqbodybodygyrojerkmagmeanfreq

82	angletbodyaccmeangravity

83	angletbodyaccjerkmeangravitymean

84	angletbodygyromeangravitymean

85	angletbodygyrojerkmeangravitymean

86	anglexgravitymean

87	angleygravitymean

88	anglezgravitymean

For more details information about the measurements, please refer to the ‘README.txt’ and ‘feature_info.txt’ provided in the 
original zip file.

