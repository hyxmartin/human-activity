# Human Activity Recognition Using Smartphones: Getting and Cleaning Data Course Project

The main purpose of this project is to showcase the knowledge and skills acquired in the [Getting and Cleaning Data Course by Johns Hopkins University at Coursera](https://www.coursera.org/learn/data-cleaning
), as a part of the Data Science Specialization.

The first goal of this repository is to contain the raw data, the code to get and clean them, the tidy data, and the code book. I am focusing on making all self-contained, self-evident and reproducible.

The main contents of this repository, as required in the project instructions, are:

* The [tidy dataset](https://github.com/jclopeztavera/human-activity/blob/master/data/tidy/tidy_data.csv).
* The R script [`run_analysis.R`](https://github.com/jclopeztavera/human-activity/blob/master/R/run_analysis.R) for performing all the analyses. For more detail on each step taken:
    * The R script for getting the data: [`data-gette.R`](https://github.com/jclopeztavera/human-activity/blob/master/R/data-gette.R)
    * The R script for cleaning the data: [`data-cleane.R`](https://github.com/jclopeztavera/human-activity/blob/master/R/data-cleane.R)
    * The R script for summarising the data: [`summarise.R`](https://github.com/jclopeztavera/human-activity/blob/master/R/summarise.R)
* The [codebook](https://github.com/jclopeztavera/human-activity/blob/master/data/tidy/CodeBook.md) that describes the variables, the data, and the data transformations performed. For more detail on the making of the code book:
    * The Rmarkdown file for knitting the codebook: [`CodeBook.Rmd`](https://github.com/jclopeztavera/human-activity/blob/master/data/tidy/CodeBook.Rmd)


## Usage

1. Clone this repository `git clone https://github.com/jclopeztavera/human-activity.git`.
2. Open the [R-project file](https://github.com/jclopeztavera/human-activity/blob/master/human-activity.Rproj).
3. Source the [`run_analysis.R`](https://github.com/jclopeztavera/human-activity/blob/master/R/run_analysis.R) file .
4. Drop me a line if you find any areas for improvement.


## To do

- [x] Merge the training and the test sets to create one data set.
- [x] Extract only the measurements on the mean and standard deviation for each measurement.
- [x] Use descriptive activity names to name the activities in the data set
- [x] Appropriately label the data set with descriptive variable names.
- [x] From the data set in the previous step , create a second, independent tidy data set with the average of each variable for each activity and each subject.
- [ ] Make code book.
- [ ] Submit assignment.

### Review criteria

- [x] The submitted data set is tidy.
- [x] The Github repo contains the required scripts.
- [ ] GitHub contains a code book that modifies and updates the available code books with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
- [x] The README that explains the analysis files is clear and understandable.
- [ ] The work submitted for this project is the work of the student who submitted it.


### Next steps

- [ ] Read the [paper](http://arxiv.org/pdf/1401.8212.pdf) behind the data set.
- [ ] Properly explore the data set, look at all variables and understand them.
- [ ] Describe the data set in detail.
- [ ] Hands on ML: Train, test, and compare classification algorithms (besides the paper, you can read this [IPython Notebook](https://github.com/markdregan/K-Nearest-Neighbors-with-Dynamic-Time-Warping/blob/master/K_Nearest_Neighbor_Dynamic_Time_Warping.ipynb) by [Mark Regan](https://github.com/markdregan))

## Built With

* [R version 3.3.2](https://cran.r-project.org/src/base/R-3/) (2016-10-31) -- "Sincere Pumpkin Patch".
* Platform: x86_64-apple-darwin13.4.0 (64-bit).
* [RStudio Desktop 1.0.136](https://www.rstudio.com/products/rstudio/download/) - makes R easier to use.


## Acknowledgments

* Jeff Leek, Roger D. Peng, and Brian Caffo from the Bloomberg School of Public Health.
* R Core Team (2016). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. [URL](https://www.R-project.org/).
* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. [URL](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
