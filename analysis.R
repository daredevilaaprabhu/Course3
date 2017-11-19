print("Set the current working Directory")
setwd(location <- dirname(sys.frame(1)$ofile));

print("Check if the required packages exist")
if(!require("downloader",character.only = TRUE)) {
  print("Package does not exist, will be installed and loaded")
  install.packages("downloader", dependencies = TRUE)
  library("downloader", character.only = TRUE)
}


print("Download and unzip the files")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="evaluation.zip", mode="wb") 
unzip ("evaluation.zip", exdir = "./evaluationdata")

print("Read Train Data")
trainFeature <- read.table("./evaluationdata/UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("./evaluationdata/UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./evaluationdata/UCI HAR Dataset/train/subject_train.txt")
train <- data.frame(trainFeature, trainActivities, trainSubject)
print("Read Test Data")
testFeature <- read.table("./evaluationdata/UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("./evaluationdata/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./evaluationdata/UCI HAR Dataset/test/subject_test.txt")
test <- data.frame(testFeature, testActivities, testSubject)
print("Combine Two data set")
combinedData <- rbind(train, test);
print("Extract the labels")
featureLabel <- read.table("./evaluationdata/UCI HAR Dataset/features.txt")
featureLabel[,2] <- as.character(featureLabel[,2]);
headerVal <- c(featureLabel[,2],"Activity", "Subject")
print("Assign the header");
names(combinedData) <- headerVal
print("Subset mean and std only")
newData <- combinedData[,grep("mean[^a-zA-Z]|std[^a-zA-Z]|Activity|Subject", names(combinedData))]
print("Aggregate the data based on the SUbject and Activity")
finalData <- aggregate(.~Activity + Subject, data = newData, mean)
