# Getting and Cleaning Data Course Project
# Part 4: Running all the analyses and knitting codebook
# This code is licensed under a MIT License Copyright (c) 2017 Juan C. López-Tavera

library(knitr)
## Get train and testing data
source('~/github/human-activity/R/data-gette.R')

## Perform all the data tidying process
source('~/github/human-activity/R/data-cleane.R')

## Summarise data by groups
source('~/github/human-activity/R/summarise.R')

## Get the codebook
knit(input = "~/github/human-activity/data/tidy/CodeBook.Rmd", output = "~/github/human-activity/CodeBook.md")
