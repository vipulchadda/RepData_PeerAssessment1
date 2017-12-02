#Adding a column to represent whether it is a weekday or weekend
weekdaysList <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
weekdaysData <- ifelse(weekdays(updatedData$date) %in% weekdaysList,
                       "weekday","weekend")
updatedData <- transform(updatedData, weekday = weekdaysData)

#Averaging the data by interval and by weekday/weekend
weekdayAveSteps <- aggregate(updatedData["steps"], 
                             by = list(interval = updatedData$interval,
                                       weekday = updatedData$weekday),
                             FUN = mean, na.rm = TRUE)

library(ggplot2)
ggplot(data = weekdayAveSteps, 
       aes(x = weekdayAveSteps$interval, 
           y = weekdayAveSteps$steps)) + 
    geom_line() + 
    labs(x = "Interval", 
         y = "Average Steps", 
         title = "Time series plot of 5-minute intervals and average steps") +
    facet_wrap(~weekday, ncol = 1)
