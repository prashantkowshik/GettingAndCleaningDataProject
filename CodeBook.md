### INPUT DATA:
The 'Human Activity Recognition Using Smartphones Dataset' version 1.0 is used as the input data.

The dataset was obtained at the following link:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Information about the dataset like the different components, features captured and pre-processing performed on the captured signals can be obtained from the **'README.txt'** file provided as a part of the dataset.

The R script **'run_analysis.R'** works with the following text data files in the dataset:  
* **UCI_HAR_Dataset** (Working Directory)
	+ **/UCI_HAR_Dataset/activity_labels.txt** - Links the activity labels with their activity name.
	+ **/UCI_HAR_Dataset/features.txt** - Links the feature labels with their feature name.
* UCI_HAR_Dataset/train (Training Data Directory)
	+ **/UCI_HAR_Dataset/train/X_train.txt** - Training dataset with 561 columns
	+ **/UCI_HAR_Dataset/train/y_train.txt** - Each row identifies the activity label of the activity performed by the subject for each window sample.
	+ **/UCI_HAR_Dataset/train/subject_train.txt** - Each row identifies the subject who performed the activity for each window sample.
* **UCI_HAR_Dataset/test** (Test Data Directory)
	+ **/UCI_HAR_Dataset/test/X_test.txt** - Test dataset with 561 columns
	+ **/UCI_HAR_Dataset/test/y_test.txt** - Each row identifies the activity label of the activity performed by the subject for each window sample.
	+ **/UCI_HAR_Dataset/test/subject_test.txt** - Each row identifies the subject who performed the activity for each window sample.

**Note:**  
All features are normalized and bounded within [-1,1].  

### OUTPUT DATA:
* The output file **'analysis.txt'** generated by the script  is a text file containing a tidy dataset of 181 rows by 81 columns.
* The columns are separated by space character and text values are quoted.
* The first row in the file is a Header row with the variable names.
* The value in the 'SUBJECT.ID' variable for each observation is an identifier of the Subject/Volunteer on whom the experiment was carried out. The experiments have been carried out with a group of 30 volunteers. Its range is from 1 to 30.
* The value 'ACTIVITY.NAME' variable  for each observation is the label of the activity performed by the subject. It will have one of the following six values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
* The values in columns 3 to 81 contain the the average of each variable (*named in Header row*) for each activity and each subject of that observation.
* Only the variables on the mean and standard deviation for each measurement have been considered for calculating the average out of the given feature set of 561  variables.

The variables are listed below by their position in the file:  

| Position | Variable | Data Type | Size | Remark |
|:--------:|---------------------------------|:---------:|-----:|:------:|
| 1 | SUBJECT.ID | integer | 1 |  |
| 2 | ACTIVITY.NAME | character | 18 | * |
| 3 | tBodyAcc-mean()-X | numeric | 19 | ** |
| 4 | tBodyAcc-mean()-Y | numeric | 19 |  |
| 5 | tBodyAcc-mean()-Z | numeric | 19 |  |
| 6 | tBodyAcc-std()-X | numeric | 19 |  |
| 7 | tBodyAcc-std()-Y | numeric | 19 |  |
| 8 | tBodyAcc-std()-Z | numeric | 19 |  |
| 9 | tGravityAcc-mean()-X | numeric | 19 |  |
| 10 | tGravityAcc-mean()-Y | numeric | 19 |  |
| 11 | tGravityAcc-mean()-Z | numeric | 19 |  |
| 12 | tGravityAcc-std()-X | numeric | 19 |  |
| 13 | tGravityAcc-std()-Y | numeric | 19 |  |
| 14 | tGravityAcc-std()-Z | numeric | 19 |  |
| 15 | tBodyAccJerk-mean()-X | numeric | 19 |  |
| 16 | tBodyAccJerk-mean()-Y | numeric | 19 |  |
| 17 | tBodyAccJerk-mean()-Z | numeric | 19 |  |
| 18 | tBodyAccJerk-std()-X | numeric | 19 |  |
| 19 | tBodyAccJerk-std()-Y | numeric | 19 |  |
| 20 | tBodyAccJerk-std()-Z | numeric | 19 |  |
| 21 | tBodyGyro-mean()-X | numeric | 19 |  |
| 22 | tBodyGyro-mean()-Y | numeric | 19 |  |
| 23 | tBodyGyro-mean()-Z | numeric | 19 |  |
| 24 | tBodyGyro-std()-X | numeric | 19 |  |
| 25 | tBodyGyro-std()-Y | numeric | 19 |  |
| 26 | tBodyGyro-std()-Z | numeric | 19 |  |
| 27 | tBodyGyroJerk-mean()-X | numeric | 19 |  |
| 28 | tBodyGyroJerk-mean()-Y | numeric | 19 |  |
| 29 | tBodyGyroJerk-mean()-Z | numeric | 19 |  |
| 30 | tBodyGyroJerk-std()-X | numeric | 19 |  |
| 31 | tBodyGyroJerk-std()-Y | numeric | 19 |  |
| 32 | tBodyGyroJerk-std()-Z | numeric | 19 |  |
| 33 | tBodyAccMag-mean() | numeric | 19 |  |
| 34 | tBodyAccMag-std() | numeric | 19 |  |
| 35 | tGravityAccMag-mean() | numeric | 19 |  |
| 36 | tGravityAccMag-std() | numeric | 19 |  |
| 37 | tBodyAccJerkMag-mean() | numeric | 19 |  |
| 38 | tBodyAccJerkMag-std() | numeric | 19 |  |
| 39 | tBodyGyroMag-mean() | numeric | 19 |  |
| 40 | tBodyGyroMag-std() | numeric | 19 |  |
| 41 | tBodyGyroJerkMag-mean() | numeric | 19 |  |
| 42 | tBodyGyroJerkMag-std() | numeric | 19 |  |
| 43 | fBodyAcc-mean()-X | numeric | 19 |  |
| 44 | fBodyAcc-mean()-Y | numeric | 19 |  |
| 45 | fBodyAcc-mean()-Z | numeric | 19 |  |
| 46 | fBodyAcc-std()-X | numeric | 19 |  |
| 47 | fBodyAcc-std()-Y | numeric | 19 |  |
| 48 | fBodyAcc-std()-Z | numeric | 19 |  |
| 49 | fBodyAcc-meanFreq()-X | numeric | 19 |  |
| 50 | fBodyAcc-meanFreq()-Y | numeric | 19 |  |
| 51 | fBodyAcc-meanFreq()-Z | numeric | 19 |  |
| 52 | fBodyAccJerk-mean()-X | numeric | 19 |  |
| 53 | fBodyAccJerk-mean()-Y | numeric | 19 |  |
| 54 | fBodyAccJerk-mean()-Z | numeric | 19 |  |
| 55 | fBodyAccJerk-std()-X | numeric | 19 |  |
| 56 | fBodyAccJerk-std()-Y | numeric | 19 |  |
| 57 | fBodyAccJerk-std()-Z | numeric | 19 |  |
| 58 | fBodyAccJerk-meanFreq()-X | numeric | 19 |  |
| 59 | fBodyAccJerk-meanFreq()-Y | numeric | 19 |  |
| 60 | fBodyAccJerk-meanFreq()-Z | numeric | 19 |  |
| 61 | fBodyGyro-mean()-X | numeric | 19 |  |
| 62 | fBodyGyro-mean()-Y | numeric | 19 |  |
| 63 | fBodyGyro-mean()-Z | numeric | 19 |  |
| 64 | fBodyGyro-std()-X | numeric | 19 |  |
| 65 | fBodyGyro-std()-Y | numeric | 19 |  |
| 66 | fBodyGyro-std()-Z | numeric | 19 |  |
| 67 | fBodyGyro-meanFreq()-X | numeric | 19 |  |
| 68 | fBodyGyro-meanFreq()-Y | numeric | 19 |  |
| 69 | fBodyGyro-meanFreq()-Z | numeric | 19 |  |
| 70 | fBodyAccMag-mean() | numeric | 19 |  |
| 71 | fBodyAccMag-std() | numeric | 19 |  |
| 72 | fBodyAccMag-meanFreq() | numeric | 19 |  |
| 73 | fBodyBodyAccJerkMag-mean() | numeric | 19 |  |
| 74 | fBodyBodyAccJerkMag-std() | numeric | 19 |  |
| 75 | fBodyBodyAccJerkMag-meanFreq() | numeric | 19 |  |
| 76 | fBodyBodyGyroMag-mean() | numeric | 19 |  |
| 77 | fBodyBodyGyroMag-std() | numeric | 19 |  |
| 78 | fBodyBodyGyroMag-meanFreq() | numeric | 19 |  |
| 79 | fBodyBodyGyroJerkMag-mean() | numeric | 19 |  |
| 80 | fBodyBodyGyroJerkMag-std() | numeric | 19 |  |
| 81 | fBodyBodyGyroJerkMag-meanFreq() | numeric | 19 |  |

**Note**:  
\* The size of the 'ACTIVITY.NAME' is a maximum of 18 characters.  
\** The size of all the numeric fields (i.e Columns 3 to 81) is the maximum total field size including the sign, decimal point and a maximum of 16 digits after decimal point.