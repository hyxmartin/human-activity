# Getting and Cleaning Data Course Project
# Part 2: Getting the UCI HAR Dataset
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

### Sourcing the Part 1
source('~/github/human-activity/R/data-gette.R')

## Merge the training and the test sets to create one data set.
raw_data <- bind_rows(train, test)

rm(test, train)

sub_act <- raw_data %>% select(subject, activity)
features <- raw_data %>% select(-subject, -activity)

### Extracts only the measurements on the mean and standard deviation for each measurement.
feature.names <-
    fread(input = "~/github/human-activity/data/features.txt",
          sep = "auto",
          col.names = c("id", "feature"))

sub <- grepl(pattern = "(mean|std)", x = feature.names$feature)

sum(sub)

features <- features[,sub]
feature.names <- feature.names[sub]

names(features) <- feature.names$feature

raw_data <- bind_cols(sub_act, features)

raw_data <- raw_data %>% gather(data = ., variable, value, -subject, -activity) %>% separate(variable, c("signal", "parameter", "axis"))

raw_data <- raw_data %>% extract(col = signal, into = "domain", regex = "^(t|f)", remove = FALSE) %>% extract(col = signal, into = "instrument", regex = ("(Acc|Gyro)"), remove = FALSE) %>% extract(col = signal, into = "acceleration", regex = ("(Body|Gravity)"), remove = FALSE) %>% extract(col = signal, into = "signal", regex = "(JerkMag|Jerk|Mag)")

raw_data$domain <- gsub(pattern = "t", replacement = "time", x = raw_data$domain)
raw_data$domain <- gsub(pattern = "f", replacement = "frequency", x = raw_data$domain)
raw_data$instrument <- gsub(pattern = "Acc", replacement = "accelerometer", x = raw_data$instrument)
raw_data$instrument <- gsub(pattern = "Gyro", replacement = "gyroscope", x = raw_data$instrument)



activity_labels <-
    read_table("~/github/human-activity/data/activity_labels.txt",
               col_names = c("id", "label"))

raw_data <- raw_data %>% mutate(activity = factor(activity, labels = activity_labels$label))

