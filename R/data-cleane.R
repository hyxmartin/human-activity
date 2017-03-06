# Getting and Cleaning Data Course Project
# Part 2: Getting the UCI HAR Dataset
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

### Sourcing the Part 1
source('~/github/human-activity/R/data-gette.R')

## Merge the training and the test sets to create one data set.
raw_data <- bind_rows(train, test)

rm(test, train) # tidy environment

## Extract only the measurements on the mean and standard deviation for each measurement

### separate tidy variables (sub_act) and raw features for selection and tidying
sub_act <- raw_data %>%
    select(subject, activity)
features <- raw_data %>%
    select(-subject, -activity)

### getting the feature names provided with the data set
feature.names <-
    fread(input = "~/github/human-activity/data/features.txt",
          sep = "auto",
          col.names = c("id", "feature"))

### logical vector for subsetting variables that contain either "mean" or "std"
sub <- grepl(pattern = "(mean|std)", x = feature.names$feature)

features <-
    features[, sub] # subsetting "mean" and "std" from features
feature.names <- feature.names[sub] # same for varaible names

names(features) <- feature.names$feature # assigning variable names

raw_data <-
    bind_cols(sub_act, features) # merging label and features datasets

rm(sub_act, features, sub, feature.names) # tidy environment

## Appropriately label the data set with descriptive variable names
raw_data <- raw_data %>%
    gather(data = ., variable, value, -subject, -activity) %>%
    separate(variable, c("signal", "parameter", "axis"))

raw_data <- raw_data %>%
    extract(
        col = signal,
        into = "domain",
        regex = "^(t|f)",
        remove = FALSE
    ) %>%
    extract(
        col = signal,
        into = "instrument",
        regex = ("(Acc|Gyro)"),
        remove = FALSE
    ) %>%
    extract(
        col = signal,
        into = "acceleration",
        regex = ("(Body|Gravity)"),
        remove = FALSE
    ) %>%
    extract(col = signal, into = "signal", regex = "(JerkMag|Jerk|Mag)")

raw_data$domain <-
    gsub(pattern = "t",
         replacement = "time",
         x = raw_data$domain)

raw_data$domain <-
    gsub(pattern = "f",
         replacement = "frequency",
         x = raw_data$domain)

raw_data$instrument <-
    gsub(pattern = "Acc",
         replacement = "accelerometer",
         x = raw_data$instrument)

raw_data$instrument <-
    gsub(pattern = "Gyro",
         replacement = "gyroscope",
         x = raw_data$instrument)

## Using descriptive activity names to name the activities in the data set
activity_labels <-
    read_table("~/github/human-activity/data/activity_labels.txt",
               col_names = c("id", "label"))

tidy_data <- raw_data %>%
    mutate(activity = factor(activity, labels = activity_labels$label))

rm(activity_labels, raw_data) # tidy environment

## Export the tidy data-set
write_csv(x = tidy_data, path = "~/github/human-activity/data/tidy/tidy_data.csv")
