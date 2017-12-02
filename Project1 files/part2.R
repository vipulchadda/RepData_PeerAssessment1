#Averaging the data by interval
aveStepsInterval <- aggregate(activityData["steps"], 
                              by = list(interval = activityData$interval), 
                              FUN = mean, na.rm = TRUE)

plot(x = aveStepsInterval$interval,
     y = aveStepsInterval$steps,
     type = "l",
     xlab = "Interval",
     ylab = "Average Steps",
     main= "Time series plot of 5-minute intervals and average steps")

maxInterval <- aveStepsInterval[which.max(aveStepsInterval$steps),]$interval
maxValue <- aveStepsInterval[which.max(aveStepsInterval$steps),]$steps