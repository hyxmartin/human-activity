# Getting and Cleaning Data Course Project
# Part 3: Summarizing and describing the tidy data
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

source('~/github/human-activity/R/data-cleane.R')

## Independent tidy data set with the average of each variable for each activity and each subject.

by_activity <- tidy_data %>% melt(id.vars = c("subject", "activity")) %>% group_by(activity) %>% summarise(average = mean(value))
by_subject <- tidy_data %>% melt(id.vars = c("subject", "activity")) %>% group_by(subject) %>% summarise(average = mean(value))

### Exporting to csv
write_csv(x = by_activity, path = "~/github/human-activity/data/tidy/by_activity.csv", col_names = TRUE)
write_csv(x = by_subject, path = "~/github/human-activity/data/tidy/by_subject.csv", col_names = TRUE)



