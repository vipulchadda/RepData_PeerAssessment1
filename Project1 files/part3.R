#Creating a copy of the Activity dataframe
updatedData <- data.frame(activityData)

#Getting the missing data to match from the average steps data frame
missingRows <- is.na(updatedData$steps)
missingData <- updatedData[missingRows,]
matchData <- match(missingData$interval, aveStepsInterval$interval)

updatedData[missingRows,"steps"] <- aveStepsInterval$steps[matchData]

#Total number of steps per day after including average steps for missing data
updatedStepsPerDay <- aggregate(updatedData["steps"], 
                                by = list(date = updatedData$date), 
                                FUN = sum, na.rm = TRUE)
hist(updatedStepsPerDay$steps,
     breaks = 10,
     main = "Histogram of Total number of steps per day",
     xlab = "Total Number of step per day")

df2 <- data.frame(Mean = mean(updatedStepsPerDay$steps), Median = median(updatedStepsPerDay$steps))
df2

compareData <- rbind(df1, df2)
compareData <- cbind(Type = c("Skipping NA", "Imputing NA"), compareData)
compareData