# Getting and Cleaning Data Course Project
# Part 1: Getting the UCI HAR Dataset
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

### Loading the required packages -- tidyverse and data.table
if (!"tidyverse" %in% installed.packages()) {
    install.packages("tidyverse")
}
if (!"data.table" %in% installed.packages()) {
    install.packages("data.table")
}

library(data.table)
library(tidyverse)


### Reading the training and testing datasets
y_train <-
    fread(input = "~/github/human-activity/data/train/y_train.txt", col.names = "activity")
x_train <-
    fread(input = "~/github/human-activity/data/train/x_train.txt")
subject_train <-
    fread(input = "~/github/human-activity/data/train/subject_train.txt", col.names = "subject")
train <-
    cbind.data.frame(subject_train, y_train, x_train) %>% tbl_df

y_test <-
    fread(input = "~/github/human-activity/data/test/y_test.txt", col.names = "activity")
x_test <-
    fread(input = "~/github/human-activity/data/test/X_test.txt")
subject_test <-
    fread(input = "~/github/human-activity/data/test/subject_test.txt", col.names = "subject")
test <- cbind.data.frame(subject_test, y_test, x_test) %>% tbl_df

rm(y_train, x_train, subject_train, y_test, x_test, subject_test)
