activityData <- read.csv("activity.csv", colClasses = c("numeric","character", "numeric"))
activityData <- transform(activityData, date = as.Date(date))