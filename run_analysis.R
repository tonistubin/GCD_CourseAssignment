run_analysis <- function() {
        
        library(plyr)
        
        # read in and combine both test and train data
        testData <- read.table("./test/X_test.txt")
        trainData <- read.table("./train/X_train.txt")
        completeData <- rbind(testData, trainData)
        
        # read in and combine both test and train subjects
        testSubject <- read.table("./test/subject_test.txt")
        trainSubject <- read.table("./train/subject_train.txt")
        completeSubject <- rbind(testSubject, trainSubject)
        
        # read in and combine both test and train activities
        testActivity <- read.table("./test/y_test.txt")
        trainActivity <- read.table("./train/y_train.txt")
        completeActivity <- rbind(testActivity, trainActivity)
        
        # change activity numbers into meaningful names
        completeActivity[completeActivity == 1] <- "Walking"
        completeActivity[completeActivity == 2] <- "Walking_upstairs"
        completeActivity[completeActivity == 3] <- "Walking_downstairs"
        completeActivity[completeActivity == 4] <- "Sitting"
        completeActivity[completeActivity == 5] <- "Standing"
        completeActivity[completeActivity == 6] <- "Laying"
        
        # get column names from file
        columnNames <- read.table("features.txt")
        
        # clean the column names from unwanted characters
        cleanNames <- gsub("([\\(\\)])", "", columnNames[, 2])
        names(completeData) <- cleanNames
        
        # select only columns with mean or std information
        selectedData <- subset(completeData, select = grepl("mean|std", 
                ignore.case = TRUE, names(completeData)))
        
        # combine all relevant data into a master data frame
        masterData <- cbind(Subject = completeSubject[, 1], Activity = completeActivity[, 1], selectedData)
        
        # calculate means by subject / activity
        cleanData <- ddply(masterData, .(Subject, Activity), numcolwise(mean))
        
        # write data to a file
        write.table(cleanData, file = "cleanData.txt", quote = FALSE, sep = "\t", row.names = FALSE)
}