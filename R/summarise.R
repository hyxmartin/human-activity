# Getting and Cleaning Data Course Project
# Part 3: Summarizing and describing the tidy data
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

## loading the tidy data
library(data.table)
tidy_data <- fread("~/github/human-activity/data/tidy/tidy_data.csv")

## From the data set in the previous step/script, create a second, independent tidy data set with the average of each variable for each activity and each subject.
by_activity <- tidy_data %>%
    group_by(activity, acceleration, domain) %>%
    filter(parameter == "mean", axis == "") %>%
    summarise(average = mean(value, na.rm = TRUE))

by_subject <- tidy_data %>%
    group_by(subject, acceleration, domain) %>%
    filter(parameter == "mean", axis == "") %>%
    summarise(average = mean(value, na.rm = TRUE))

### Exporting to csv
write_csv(x = by_activity,
          path = "~/github/human-activity/data/tidy/by_activity.csv",
          col_names = TRUE)

write_csv(x = by_subject,
          path = "~/github/human-activity/data/tidy/by_subject.csv",
          col_names = TRUE)
