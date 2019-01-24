library(dplyr)
library(plyr)


###### 0a. Download Data and Unzip File ######

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
  download.file(url, "./coursera_data.zip")
  unzip("coursera_data.zip")
  file.remove("./coursera_data.zip")
}


###### 0b. Read Data ######

train <- read.table("UCI HAR Dataset\\train\\X_train.txt",sep="")
test <- read.table("UCI HAR Dataset\\test\\X_test.txt",sep="")
train_activity <- read.table("UCI HAR Dataset\\train\\y_train.txt",sep="")
test_activity <- read.table("UCI HAR Dataset\\test\\y_test.txt",sep="")
train_subject <- read.table("UCI HAR Dataset\\train\\subject_train.txt",sep="")
test_subject <- read.table("UCI HAR Dataset\\test\\subject_test.txt",sep="")
activity <- read.table("UCI HAR Dataset\\activity_labels.txt",sep="")
features <- read.table("UCI HAR Dataset\\features.txt",sep="")


###### 1. Add Feature, Activity, Subject and Merge  ######

colnames(train) <- features$V2
colnames(test) <- features$V2
train$V1 <- train_activity$V1
test$V1 <- test_activity$V1
train$Subject <- train_subject$V1
test$Subject <- test_subject$V1
merged_data <- rbind(train, test)


###### 2. Extract Mean & STD ######
# identified only measures containing "Mean()"

index <- grep("subject|v1|mean\\(|std", tolower(colnames(merged_data)))
data <- merged_data[,index]


###### 3. Add Activity Label ######

data <- join(data, activity, by="V1", type = "left")
data$V1 <- NULL
data <- data[,c(67:68, 1:66)]
colnames(data)[2] <- "Activity"


###### 4. Create New Tidy Dataset ######
#  Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject.

new_data <- data %>%
  group_by(Subject, Activity) %>% 
  summarise_all(funs(mean))

write.table(new_data,"tidydata.txt",sep="",row.names=FALSE)
