################################################################################
# Getting and cleaning data - Assignment - R script                            #
# Data collected from the accelerometers from the Samsung Galaxy S smartphone  #
################################################################################

# First need to load necessary package and set the working directory
library(reshape2)
setwd("C:/Users/CHGA/Desktop/COURSES/coursera/cleaning data")

# Import the "train data sets" and merge them in "data.train"
data1.train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, stringsAsFactors=FALSE)
data2.train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE, stringsAsFactors=FALSE)
data3.train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, stringsAsFactors=FALSE)
data.train <- cbind(data1.train, data2.train, data3.train)

# Import the "test data sets" and merge them in "data.test"
data1.test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, stringsAsFactors=FALSE)
data2.test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE, stringsAsFactors=FALSE)
data3.test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, stringsAsFactors=FALSE)
data.test <- cbind(data1.test, data2.test, data3.test)

# Answer the requests of the assignment:
# 1. Merge "data.train" and "data.test" to create one data set "data.final" 
data.combine <- rbind(data.train, data.test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement 
data.features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
mylist<-grep("mean\\(|std\\(", data.features[,2])
add2 <- function (x) { x+2}
mylist<-sapply(mylist,add2)
mylist<-c(1,2,mylist)
data2.combine <- subset(data.combine, select=mylist)

# 3.Uses descriptive activity names to name the activities in the data set 
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
addLabel <- function (x) { activity.labels[x,2]}
data2.combine[,1]<-sapply(data2.combine[,1],addLabel)

# 4.Appropriately labels the data set with descriptive variable names
mylist2<-grep("mean\\(|std\\(", data.features[,2], value=TRUE)
mylist2<-c("activity", "subject", mylist2)
colnames(data2.combine)<-mylist2

# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
keys <- setdiff(names(data2.combine), c("subject","activity"))
data2.combine2 <- melt(data2.combine, id= c("activity", "subject"), measure.vars = keys)
TidyDataSet <- dcast(data2.combine2, activity + subject ~ variable, mean)

# Save the file
write.table(TidyDataSet, file="./UCI HAR Dataset/TidyDataSet.txt",  row.names=FALSE, sep="\t", quote=FALSE) 
