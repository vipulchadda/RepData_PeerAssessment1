#Total number of steps per day
stepsPerDay <- aggregate(activityData["steps"], 
                         by = list(date = activityData$date), 
                         FUN = sum, na.rm = TRUE)

hist(stepsPerDay$steps,
     breaks = 10,
     main = "Histogram of Total number of steps per day",
     xlab = "Total Number of step per day")

df1 <- data.frame(Mean = mean(stepsPerDay$steps), Median = median(stepsPerDay$steps))
df1