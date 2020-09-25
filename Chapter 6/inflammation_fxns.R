##This script contains the functions made for chapter 6
##these functions plot the average, min, and max inflammation over time.
 

## Set working directory
setwd("~/r-novice-inflammation/data")

##Create "results" folder within this directory so pdf files will show there and keep organized

##load the necessary libraries// remember to install them beforehand
library(ggplot2)
library(reshape)
library(vegan)


## Define function
# Plots the average, min, and max inflammation over time.
# Input is character string of a csv file.
analyze <- function(filename, output = NULL) {
  #    output: character string of pdf file for saving
  if (!is.null(output)) {
    pdf(output)
  }
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
  if (!is.null(output)) {
    dev.off()
  }
}
##to automate the processing of each data file
analyze_all <- function(pattern) {
  # Directory name containing the data
  data_dir <- file.path("~", "r-novice-inflammation", "data")
  
  
  # Directory name for results
  results_dir <- file.path("~", "r-novice-inflammation", "data", "results")
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames <- list.files(path = data_dir, pattern = "inflammation-")
  for (f in filenames) {
    pdf_name <- file.path(results_dir, sub("csv", "pdf", f))
    analyze(file.path(data_dir, f), output = pdf_name)
  }
}