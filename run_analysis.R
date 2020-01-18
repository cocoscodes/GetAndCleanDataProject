# Getting and cleaning data project ----
getwd()
setwd("./UCI HAR Dataset")

# 1.- reading all relevant txt files
activity_labels <- read.table("activity_labels.txt") # to label y values
features <- read.table("features.txt") # column headers
subject_test <- read.table("test/subject_test.txt") 
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# 2.- biding and creating the first data set
x <- rbind(x_train, x_test)
colnames(x) <- features[,2]
y <- rbind(y_train, y_test)
colnames(y) <- "activity"
subjects <- rbind(subject_train, subject_test)
colnames(subjects) <- "subject"
xys_data <- cbind(subjects, y, x)
xys_data$activity <- factor(xys_data$activity,
                            labels = activity_labels$V2,
                            levels = activity_labels$V1) # replacing the id for the label

names(xys_data) # review headers to better adjust names

# 3.- create the mean and SD dataset
indexCols<- grep("([Mm]ean|[Ss]td)",names(xys_data)) # index to extract columns
meanStd_data <- xys_data[,indexCols]
extractData <- cbind(xys_data[,1:2],meanStd_data)

# 4.- improving headers readability
names(extractData) <- gsub("^t","Time",names(extractData))
names(extractData) <- gsub("^f","Frequency",names(extractData))
names(extractData) <- gsub("BodyBody","Body",names(extractData))
names(extractData) <- gsub("Acc","Accelerometer",names(extractData))
names(extractData) <- gsub("Gyro","Gyroscope",names(extractData))
names(extractData) <- gsub("Mag","Magnitude",names(extractData))
names(extractData) <- gsub("-mean\\()","Mean",names(extractData))
names(extractData) <- gsub("-std\\()","STD",names(extractData))
names(extractData) <- gsub("-meanFreq\\()","MeanFrequency",names(extractData))
names(extractData) <- gsub("\\(t","(Time",names(extractData))
duplicated(names(extractData)) # verify that no variable is a duplicate

# 5.- creating tidy dataset with averages per group and activity
library(dplyr)
tidyData <- extractData %>% 
  group_by(subject,activity) %>%
  summarise_all(funs(mean))

# 5.- transform the dataset into a txt file
write.table(tidyData,file = "./tidyData.txt",row.names = FALSE)
           