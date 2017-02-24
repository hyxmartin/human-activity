# Getting and Cleaning Data Course Project
# Part 2: Getting the UCI HAR Dataset
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

### Sourcing the Part 1
source('~/github/human-activity/R/data-gette.R')

## Merge the training and the test sets to create one data set.
raw_data <- bind_rows(train, test)


### renaming the column names using the feature list provided
features <-
    fread(input = "~/github/human-activity/data/features.txt",
          sep = "auto",
          col.names = c("id", "feature"))
col.name <-
    append(names(raw_data)[c(1, 2)], features$feature) %>% make.names # don't forget the first two variables: subject and label

names(raw_data) <- col.name


## Extract only the measurements on the mean and standard deviation for each measurement.
vars <-
    grepl(pattern = "subject|activity|mean|std",
          x = col.name,
          ignore.case = TRUE)

filtered_data <- raw_data[vars]

## Use descriptive activity names to name the activities in the data set
activity_labels <-
    read_table("~/github/human-activity/data/activity_labels.txt",
               col_names = c("id", "label"))

labeled_data <-
    filtered_data %>% mutate(activity = factor(activity, labels = activity_labels$label))



rm(train, test, features, activity_labels, col.name, vars)
