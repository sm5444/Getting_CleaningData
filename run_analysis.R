#Reading Data into R:
training_dataset = read.table("X_train.txt")
training_dataset[,562] = read.table("y_train.txt")
training_dataset[,563] = read.table("subject_train.txt")

test_dataset = read.table("X_test.txt")
test_dataset[,562] = read.table("y_test.txt")
test_dataset[,563] = read.table("subject_test.txt")

activityLabels = read.table("activity_labels.txt")

# Read features and make the feature names better suited for R with some substitutions
features = read.table("features.txt")
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# Merging training and test sets together
allData = rbind(training_dataset, test_dataset)

# Get only the data that is on mean and std. dev.
colsReq <- grep(".*Mean.*|.*Std.*", features[,2])
# First reduce the features table to what is required
features <- features[colsReq,]
# Now add the last two columns (subject and activity)
colsReq <- c(colsReq, 562, 563)
# And remove the unwanted columns from allData
allData <- allData[,colsReq]
# Add the column names (features) to allData
colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))

ActivityCounter = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(ActivityCounter, currentActivityLabel, allData$activity)
  ActivityCounter <- ActivityCounter + 1
}

allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)

# Remove the subject and activity column, since a mean of those has no use
tidy[,90] = NULL
tidy[,89] = NULL

#Output the result into a tab delimited text file
write.table(tidy, "tidy.txt", sep="\t", row.name=FALSE)