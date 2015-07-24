################################################################################
## This file contains a R script to process the Human Activity Recognition using 
## Smartphones Dataset v1.0.
## 
## It can be executed as long as the above dataset is in the working directory.
## i.e. The working directory is 'UCI_HAR_Dataset'.
##
## The script generates a tidy dataset and stores it in a text file analysis.txt
## which can be used for later analysis.
## 
## It does the following things:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean & standard deviation for each
##    measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.
##    The tidy data set is created as a text file using the write.table() with
##    argument row.name=FALSE and is called 'analysis.txt'.
################################################################################

## Load Required Packages
library(plyr)
library(dplyr)

################################################################################
## STEP 1:
## Merge the Training and Test Datasets
################################################################################

## Read Training Observations Data
df.X.train <- read.table("train/X_train.txt", nrows = 5)
classes <- lapply(df.X.train, class)
df.X.train <- read.table("train/X_train.txt", colClasses = classes)
df.X.train <- tbl_df(df.X.train)

## Read Training Activity Data
df.y.train <- read.table("train/y_train.txt", nrows = 5)
classes <- lapply(df.y.train, class)
df.y.train <- read.table("train/y_train.txt", colClasses = classes)
df.y.train <- tbl_df(df.y.train)
names(df.y.train) <- c("ACTIVITY.ID")

## Column Bind Training Activity Data to Training Observation Data
df.X.train <- bind_cols(df.y.train, df.X.train)
rm(df.y.train)

## Read Training Subject Data
df.subject.train <- read.table("train/subject_train.txt", nrows = 5)
classes <- lapply(df.subject.train, class)
df.subject.train <- read.table("train/subject_train.txt", colClasses = classes)
df.subject.train <- tbl_df(df.subject.train)
names(df.subject.train) <- c("SUBJECT.ID")

## Column Bind Training Subject Data to Training Observation Data
df.X.train <- bind_cols(df.subject.train, df.X.train)
rm(df.subject.train)

## Read Test Observations Data
df.X.test <- read.table("test/X_test.txt", nrows = 5)
classes <- lapply(df.X.test, class)
df.X.test <- read.table("test/X_test.txt", colClasses = classes)
df.X.test <- tbl_df(df.X.test)

## Read Test Activity Data
df.y.test <- read.table("test/y_test.txt", nrows = 5)
classes <- lapply(df.y.test, class)
df.y.test <- read.table("test/y_test.txt", colClasses = classes)
df.y.test <- tbl_df(df.y.test)
names(df.y.test) <- c("ACTIVITY.ID")

## Column Bind Test Activity Data to Test Observation Data
df.X.test <- bind_cols(df.y.test, df.X.test)
rm(df.y.test)

## Read Test Subject Data
df.subject.test <- read.table("test/subject_test.txt", nrows = 5)
classes <- lapply(df.subject.test, class)
df.subject.test <- read.table("test/subject_test.txt", colClasses = classes)
df.subject.test <- tbl_df(df.subject.test)
names(df.subject.test) <- c("SUBJECT.ID")

## Column Bind Test Subject Data to Test Observation Data
df.X.test <- bind_cols(df.subject.test, df.X.test)
rm(df.subject.test)

## Row Bind Training and Test Datasets
df.X <- bind_rows(df.X.train, df.X.test)
rm(df.X.train, df.X.test)

################################################################################
## Step 2:
## Extract only the measurements on the Mean & S.D. for each measurement
################################################################################

## Read Feature Names (Variables)
df.feature.names <- read.table("features.txt", stringsAsFactors = FALSE)
feature.names <- tbl_df(df.feature.names) %>%
    mutate(unique.name = paste(V1, V2, sep='_')) %>%
    select(unique.name) %>%
    sapply(as.character) %>%
    as.vector
rm(df.feature.names)

## Assign Variable Names and Select only Required Variables
names(df.X) <- c("SUBJECT.ID", "ACTIVITY.ID", feature.names)
df.X <- select(df.X, SUBJECT.ID, ACTIVITY.ID, matches("-mean|-std"))
rm(feature.names)

################################################################################
## Step 3:
## Add descriptive Activity Names to the activities in the Merged Dataset
################################################################################

## Read Activity Labels
df.activity.labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
df.activity.labels <- tbl_df(df.activity.labels)
names(df.activity.labels) <- c("ACTIVITY.ID", "ACTIVITY.NAME")

## Join Activity Labels and Observations Datasets
df.X <- left_join(df.X, df.activity.labels, by = "ACTIVITY.ID") %>%
            select(SUBJECT.ID, ACTIVITY.NAME, 3:length(df.X))
rm(df.activity.labels)

################################################################################
## Step 4:
## Appropriately label the data set with descriptive variable names
################################################################################

names(df.X) <- gsub("^[0-9]{1,3}_", "", names(df.X))

################################################################################
## Step 5:
## Create an independent tidy data set with the average of each variable for each
## activity and each subject.
################################################################################

## Arrange, Group and Compute Average
df.X <- df.X %>%
        arrange(SUBJECT.ID, ACTIVITY.NAME) %>%
        group_by(SUBJECT.ID, ACTIVITY.NAME) %>%
        ddply(.(SUBJECT.ID, ACTIVITY.NAME), numcolwise(mean, na.rm = TRUE))
df.X <- tbl_df(df.X)

## Write Result Dataset as a txt file with write.table() using row.names=FALSE
write.table(df.X, "./analysis.txt", row.names = FALSE)
rm(classes, df.X)