##Getting And Cleaning Data Course Project
New insights are being derived from massive amounts of data collected related to human activity and behavior using gadgets that consumers are either using or wearing like smartphones, smart watches, credit cards, sensors and GPS devices.
###GOAL
This project works with raw data collected using smartphones worn by a group of people while performing certain activities.

The purpose of this project is to demonstrate the ability to collect, work with, clean a raw data set and to come up with a tidy data set that can be used for later analysis.
###RAW DATA
The 'Human Activity Recognition Using Smartphones Dataset' version 1.0 is used as the input data for the project.

The data in this dataset was collected from experiments carried out with a group of 30 volunteers (subjects) within the age bracket of 19-48 years. Each person performed 6 types of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The phones were used to capture 3-axial linear acceleration and 3-axial angular velocity values with embedded an accelerometer and gyroscope.

The dataset was obtained at the following link:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A description about the 'Human Activity Recognition Using Smartphones' project is available at the following link:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Information about the dataset like the different components, features captured and pre-processing performed on the captured signals can be obtained from the **'README.txt'** file provided as a part of the dataset.

The captured data is randomly partitioned into two sets, where 70% of the volunteers (subjects) were selected for generating the training data and 30% for the test data.

###REQUIREMENTS
To  create one R script called **run_analysis.R** that does the following things:

1. Merges the training and the test data sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###PROCESSING
The raw data is processed using the R script **'run_analysis.R'** which is present in the main directory of this repository.

The directory in which the input data resides **(i.e. UCI_HAR_Dataset)** is the **working directory** for the R script.

The **run_analysis.R** script works with the following text data files in the dataset:

* UCI_HAR_Dataset (Working Directory):
	+ /UCI_HAR_Dataset/activity_labels.txt
	+ /UCI_HAR_Dataset/features.txt

* UCI_HAR_Dataset/train :
	+ /UCI_HAR_Dataset/train/X_train.txt
	+ /UCI_HAR_Dataset/train/y_train.txt
	+ /UCI_HAR_Dataset/train/subject_train.txt

* UCI_HAR_Dataset/test :
	+ /UCI_HAR_Dataset/test/X_test.txt
	+ /UCI_HAR_Dataset/test/y_test.txt
	+ /UCI_HAR_Dataset/test/subject_test.txt

The instructions for executing the R script are given in the **Instruction List** given below.

###INSTRUCTION LIST
* **Step 1:** Download the Raw Data used for processing from the following link:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* **Step 2:** Unzip the dataset file downloaded into an appropriate directory. A directory named **'UCI_HAR_Dataset'** will be created having some text data files along with the **'train'** and **'test'** sub-directories with the training and test data files respectively.

* **Step 3:** Start the R Command Line or RStudio program. Set the **'UCI_HAR_Dataset'** directory generated in above step as the working directory.
 
* **Step 4:** Execute the script **'runAnalysis.R'**. The script will process the text data files from the above raw dataset and generate a tidy data set in the output text file named as **'analysis.txt'.**

###R Script WORKING
1. The script loads the **'plyr'** and **'dplyr'** R Packages packages in the respective order.

2. Reads the Training Observations data from the **'train/X_train.txt'** file and creates a dplyr table data frame object **'df.X.train'**.

3. Reads the Training Activity data from **'train/y_train.txt'** file and creates a dplyr table data frame object **'df.y.train'**.

4. Names the single variable in **'df.y.train'** table data frame object as **'ACTIVITY.ID'**.

5. Column binds the **'df.y.train'** and **'df.X.train'** data frames and stores result in **'df.X.train'** object.

6. Reads the Training Subject data from **'train/subject_train.txt'** file and creates a dplyr table data frame object **'df.subject.train'**.

7. Names the single variable in **'df.subject.train'** table data frame object as **'SUBJECT.ID'**.

8. Column binds the **'df.subject.train'** and **'df.X.train'** data frames and stores result in **'df.X.train'** object.

9. Reads the Test Observations data from the **'test/X_test.txt'** file and creates a dplyr table data frame object **'df.X.test'**.

10. Reads the Test Activity data from **'test/y_test.txt'** file and creates a dplyr table data frame object **'df.y.test'**.

11. Names the single variable in **'df.y.test'** table data frame object as **'ACTIVITY.ID'**.

12. Column binds the **'df.y.test'** and **'df.X.test'** data frames and stores result in **'df.X.test'** object.

13. Reads the Test Subject data from **'test/subject_test.txt'** file and creates a dplyr table data frame object **'df.subject.test'**.

14. Names the single variable in **'df.subject.test'** table data frame object as **'SUBJECT.ID'**.

15. Column binds the **'df.subject.test'** and **'df.X.test'** data frames and stores result in **'df.X.test'** object.

16. Merges the **'df.X.train'** and **'df.X.test'** data frames using the row binding operation and stores the merged data set in **'df.X'** object.

17. Reads the Feature Names (Variables) data from **'features.txt'** file and stores the result in data frame object **'df.feature.names'**.

18. Using dplyr chaining and other operators creates a character vector **'feature.names'** with the list of unique variable (feature) names. This is done by concatenating the **feature number** and **feature name** variables in **'df.feature.names'** data frame above with **'_'** as the separator. *This is done to avoid problems faced while working on data frames due to duplicate column/variable names in the original raw dataset*.

19. Assigns appropriate variable names to all the numeric variables in the merged dataset **'df.X'** using the character vector **'feature.names'** generated above.

20. Extract only the measurements (variables) on the **Mean & Standard Deviation** for each measurement using the dply 'select' function specifying column names **SUBJECT.ID**, **ACTIVITY.ID** and the **matches** argument with the regular expression **"-mean|-std"**.

21. Reads the Activity Labels data from **'activity_labels.txt'** file and stores the result in dplyr table data frame object **'df.activity.labels'**.

22. Names the 2 variables in **'df.activity.labels'** as **"ACTIVITY.ID"** and **"ACTIVITY.NAME"** respectively.

23. Performs the **Left Join operation** between the **'df.X'** merged data frame and **'df.activity.labels'** data frame by common variable **'ACTIVITY.ID'** to get the Activity Labels of each observation in the merged data set. Also using the chaining operator, select  appropriate columns from the resulting joined data set.

24. Appropriately labels the feature variables by removing the initial **column number** and **“_”** separator characters using the **gsub()** function and the regular expression **"^[0-9]{1,3}_"**  which were prefixed earlier to avoid processing problems because of duplicate feature names in the raw dataset.

25. Creates and independent tidy data set with the average of each variable for each activity and each subject chaining the following operations:
	* sorting the data set set using **arrange(SUBJECT.ID, ACTIVITY.NAME)**
	* grouping the data set using **group_by(SUBJECT.ID, ACTIVITY.NAME)**
	* using the ddply() to compute the mean of all numerical columns in the data set by each group of **SUBJECT.ID** and **ACTIVITY.NAME**.

26. Writes the resulting tidy dataset into a text file **'analysis.txt'** using **write.table()** function with argument **row.names=FALSE**.

###OUTPUT
1. An independent tidy data set in the text file named **analysis.txt** in the working directory which contains the average of each variable for each activity and each subject.
