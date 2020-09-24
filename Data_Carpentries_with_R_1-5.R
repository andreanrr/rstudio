
#Chapters 1-5 were done by Andrea N. Rivera Rosario


######################### CHAPTER 1 #####################################

##Set working directory (adjust to user)
setwd('C:/Users/andre/Desktop/rstudio')

##Import data into RStudio

##Remember to set header = FALSE or the console will use our values as headers. 
##The default is TRUE.
read.csv(file = 'data/inflammation-01.csv', header = FALSE)

##Assigning variables
weight_kg <- 55

#Print variable
weight_kg

#Convert weight to pounds
2.2 * weight_kg

#Change weight_kg value
weight_kg <- 57.5

#Create new variable weight_lb from weight_kg
weight_lb <- 2.2 * weight_kg

#Weight in kg...
weight_kg

#Weight in lb...
weight_lb

#Change weight_kg variable
weight_kg <- 100.0

#Weight in kg now...
weight_kg

#Weight in lb now...
weight_lb

#Variable can also be printed using parentheses
(total_weight <- weight_kg*2.2 + weight_lb)

##Assign data to variable 
dat <- read.csv(file = "data/inflammation-01.csv", header = FALSE)

##Display first few rows of data
head(dat)

##Show type of data structure stored in variable
class(dat)

##Show dimensions of data frame
dim(dat)

##Indexing data frame
#First value in first row
dat[1,1]

#Middle value
dat[30,20]

#Subsetting data frame
dat[c(1, 3, 5), c(10, 20)]

#Colon (:) can be used the same as the c()
1:5
3:12

#Selecting certain columns and rows using (:)
dat[1:4, 1:10]
dat[5:10, 1:10]

#Selecting all colums and some rows
dat[5, ]

#Selecting all rows and some columns
dat[, 16:18]

#Selecting entire dataframe
dat[,]

#Columns can also be addressed by name
dat$V16
dat[,'V16']

##Performing operations on inflammation data
#Assign variable to subset of dat
patient_1 <- dat[1,]

#Max inflammation for patient 2
max(dat[2,1])

#Minimum inflammation on day 7
min(dat[,7])

#Mean inflammation on day 7
mean(dat[,7])

#Median inflammation on day 7
median(dat[,7])

#Standard deviation of inflammation on day 7
sd(dat[,7])

#Summarize function includes min, mean, max, median, and quartiles
summary(dat[,1:4])

#Apply function repeats operation on all rows or columns of dataframe
avg_patient_inflammation <- apply(dat,1,mean)
avg_day_inflammation <- apply(dat,2,mean)

#Calculate column and row means
colMeans(dat)
rowMeans(dat)

##Subsetting exercises
animal <- c("m", "o", "n", "k", "e", "y")

# Subset first three characters
animal[1:3]

#Subset last three characters
animal[4:6]

#Subset data for patient 5 for days 3 to 7
max(dat[5, 3:7])

#Subsetting and reassignment
whichPatients <- seq(2, 60, 2) 
whichDays <- seq(1, 5)   

#Create variable to correct data
dat2 <- dat

# Check dimensions of subset
dim(dat2[whichPatients, whichDays])

#Correct data for subset
dat2[whichPatients, whichDays] <- dat2[whichPatients, whichDays] / 2
dat2

#Calculate mean inflammation for patients 1 to 5
apply(dat[1:5, ], 1, mean)

#Calculate mean inflammation for days 1 to 10 
apply(dat[, 1:10], 2, mean)

#Calculate mean inflammation for every second day
apply(dat[, seq(1, 40, by = 2)], 2, mean)

##Plotting data
plot(avg_day_inflammation)

#Maximum inflammation
max_day_inflammation <- apply(dat, 2, max)
plot(max_day_inflammation)

#Minimum inflammation
min_day_inflammation <- apply(dat, 2, min)
plot(min_day_inflammation)

#Standard deviation of inflammation data 
sd_day_inflammation <- apply(dat, 2, sd)
plot(sd_day_inflammation)

######################### CHAPTER 2 #####################################


##Defining a function
#Convert Fahrenheit to Celsius
fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}

#Call the function
fahrenheit_to_celsius(32)
fahrenheit_to_celsius(212)

#Converting Celsius to Kelvin
celsius_to_kelvin <- function(temp_C) {
  temp_K <- temp_C + 273.15
  return(temp_K)
}

#Call the function
celsius_to_kelvin(0)

#Converting Fahrenheit to Kelvin
fahrenheit_to_kelvin <- function(temp_F) {
  temp_C <- fahrenheit_to_celsius(temp_F)
  temp_K <- celsius_to_kelvin(temp_C)
  return(temp_K)
}

#Call the function
fahrenheit_to_kelvin(32.0)

#Nesting functions
celsius_to_kelvin(fahrenheit_to_celsius(32.0))

##Write a function that adds a wrapper at the beginning and end of a vector
#Define function
highlight <- function(content, wrapper) {
  answer <- c(wrapper, content, wrapper)
  return(answer)
}

#Define objects of function
best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"  

#Call function
highlight(best_practice, asterisk)

##Write a function that returns first and last elements of a vector
#Define function
edges <- function(v) {
  first <- v[1]
  last <- v[length(v)]
  answer <- c(first, last)
  return(answer)
}

#Define objects of function
dry_principle <- c("Don't", "repeat", "yourself", "or", "others")

#Call function
edges(dry_principle)

#It's possible to set a default value for a function
input_1 <- 20
mySum <- function(input_1, input_2 = 10) {
  output <- input_1 + input_2
  return(output)
}

#You can change the default value 
mySum(input_1 = 1, 3)

##Testing, error handling, and documenting
#Function to center data around midpoint
center <- function(data, midpoint) {
  new_data <- (data - mean(data)) + midpoint
  return(new_data)
}

#Test on empty vector
z <- c(0, 0, 0, 0)
center(z, 3)

#Test on real data
dat <- read.csv(file = "data/inflammation-01.csv", header = FALSE)
centered <- center(dat[, 4], 0)
head(centered)

#Use other testing methods to confirm

min(dat[, 4]) #original minimum
mean(dat[, 4]) #original mean
max(dat[, 4]) #original maximum

min(centered) #centered minimum
mean(centered) #centered mean
max(centered) #centered maximum

sd(dat[,4]) #original standard deviation

sd(centered) #centered standard deviation

sd(dat[,4]) - sd(centered) #difference between standard deviations should be 0

all.equal(sd(dat[, 4]), sd(centered)) #to confirm sd difference was not rounded

##Error handling
#These arguments will return NA when only 1 value in the dataframe is blank

datNA <- dat
datNA[10,4] <- NA

center(datNA[,4], 0)

#We can change the center function to exclude NA values
center <- function(data, midpoint) {
  new_data <- (data - mean(data, na.rm=TRUE)) + midpoint
  return(new_data)
}

#Call the function
center(datNA[,4], 0)

#The goal of a good script is for it to produce informative errors
##Examples of errors

#Adding factors and characters to dataframe
datNA[,1] <- as.factor(datNA[,1])
datNA[,2] <- as.character(datNA[,2])

center(datNA[,1], 0)
center(datNA[,2], 0)

##Documentation
#Comments enclosed in "#" are added to document code
center <- function(data, midpoint) {
  # return a new vector containing the original data centered around the
  # midpoint.
  # Example: center(c(1, 2, 3), 0) => c(-1, 0, 1)
  new_data <- (data - mean(data)) + midpoint
  return(new_data)
}

#Official documentation (the kind that appears in the "help" pane) is
# written in .Rd format using a text editor

#Writing a well-documented function

#Example 1
analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

#Example 2
rescale <- function(v) {
  # Rescales a vector, v, to lie in the range 0 to 1.
  L <- min(v)
  H <- max(v)
  result <- (v - L) / (H - L)
  return(result)
}

##Defining defaults
#When passing arguments to a function, they must be ordered correctly

#Correct
dat <- read.csv("data/inflammation-01.csv", FALSE)

#Incorrect order (produces error)
dat <- read.csv(header = FALSE, file = "data/inflammation-01.csv")
dat <- read.csv(FALSE, "data/inflammation-01.csv")

#Redefine default for center function
center <- function(data, midpoint = 0) {
   new_data <- (data - mean(data)) + midpoint
  return(new_data)
}

#Calling with 2 arguments works like before
test_data <- c(0, 0, 0, 0)
center(test_data, 3)

#Calling with one argument also works because the second argument has a default
more_data <- 5 + test_data
more_data
center(more_data)

#The function can be called with no arguments because defaults are set
display <- function(a = 1, b = 2, c = 3) {
  result <- c(a, b, c)
  names(result) <- c("a", "b", "c")  # This names each element of the vector
  return(result)
}

display()

#Call with one argument
display(55)

#Call with two arguments
display(55, 66)

#Call with three arguments
display(55, 66, 77)

#To set a specific value use "="
display(c = 77)

#Arguments are processed from left to right, as per function documentation
#For read.csv the following line of code shows correct order
?read.csv

##Exercise
#Rewriting the rescale function to a value between 0 and 1 by default
rescale <- function(v, lower = 0, upper = 1) {
  # Rescales a vector, v, to lie in the range lower to upper.
  L <- min(v)
  H <- max(v)
  result <- (v - L) / (H - L) * (upper - lower) + lower
  return(result)
}

######################### CHAPTER 3 #####################################


##We can use the analyze function we created to view different data sets
analyze("data/inflammation-02.csv")

##Loops can be used to apply analyze to more than one set with one command

##For Loops
#Printing each word in a sentence with a function

best_practice <- c("Let", "the", "computer", "do", "the", "work")
print_words <- function(sentence) {
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}

print_words(best_practice)

#This output is ok but it is very tedious to obtain
#Let's use indexing
best_practice[-6]
print_words(best_practice[-6])

#Let's use an improved function for print_words
print_words <- function(sentence) {
  for (word in sentence) {
    print(word)
  }
}

print_words(best_practice)

#Here is another for loop 
len <- 0
vowels <- c("a", "e", "i", "o", "u")
for (v in vowels) {
  len <- len + 1
}

#Print number of vowels using loop variable
len

#This loop prints a letter from the vector
letter <- "z"
for (letter in c("a", "b", "c")) {
  print(letter)
}

#We can reuse the loop variable
letter

#Instead of using a loop to find length, R has a function for it
length(vowels)

##Exercises
#The seq function creates a list of numbers
seq(3)

#The following function prints the first N numbers
print_N <- function(N) {
  nseq <- seq(N)
  for (num in nseq) {
    print(num)
  }
}

print_N(3)

#The following function calculates the sum of values without using sum()

total <- function(vec) {
  vec_sum <- 0
  for (num in vec) {
    vec_sum <- vec_sum + num
  }
  return(vec_sum)
}

ex_vec <- c(4, 8, 15, 16, 23, 42)
total(ex_vec)

#The following function mimics exponentiation
expo <- function(base, power) {
  result <- 1
  for (i in seq(power)) {
    result <- result * base
  }
  return(result)
}

expo(2,4)

##Processing multiple files
#R has a function to search files in a certain directory
list.files(path = "data", pattern = "csv")

#We can tailor it to our working directory
list.files(path = "data", pattern = "inflammation")

#We can show the full names of our files using "full.names = TRUE"
list.files(path = "data", pattern = "csv", full.names = TRUE)
list.files(path = "data", pattern = "inflammation", full.names = TRUE)

#Let's test out our analyze function
filenames <- list.files(path = "data",  
                       pattern = "inflammation-[0-9]{2}.csv",
                      full.names = TRUE)

filenames <- filenames[1:3]

for (f in filenames) {
  print(f)
  analyze(f)
}

##Exercises
#Write analyze all function that runs analyze for all files in a directory
analyze_all <- function(folder = "data", pattern) {
  filenames <- list.files(path = folder, pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze(f)
  }
}

######################### CHAPTER 4 #####################################


##Saving plots to a file
#The following arguments save our plots to a PDF

pdf("inflammation-01.pdf") #Naming file
analyze("data/inflammation-01.csv") #Producing plot
dev.off() #Stops R from redirecting plots

#The function dev.cur() shows whether your plots are still being redirected

##Conditionals
#We can write code that returns a decision from the computer

#Comparisons
num <- 37
num > 100
num < 100

#We can pair comparison operators with conditional statements

num <- 37
if (num > 100) {
  print("greater")
} else {
  print("not greater")
}
print("done")

#An else statement is not always necessary
num <- 53
if (num > 100) {
  print("num is greater than 100")
}

#Several statements can be connected with else if
sign <- function(num) {
  if (num > 0) {
    return(1)
  } else if (num == 0) {
    return(0)
  } else {
    return(-1)
  }
}

sign(-3)
sign(0)
sign(2/3)

# && means AND, || means OR
if (1 > 0 && -1 > 0) {
  print("both parts are true")
} else {
  print("at least one part is not true")
}

if (1 > 0 || -1 > 0) {
  print("at least one part is true")
} else {
  print("neither part is true")
}

##Exercises
#Write function that plots boxplot or stripchart depending on conditions
plot_dist <- function(x, threshold) {
  if (length(x) > threshold) {
    boxplot(x)
  } else {
    stripchart(x)
  }
}

#Call function
dat <- read.csv("data/inflammation-01.csv", header = FALSE)
plot_dist(dat[, 10], threshold = 10)

plot_dist(dat[1:5, 10], threshold = 10)  

#Write function that plots boxplot, histogram, or stripchart
plot_dist <- function(x, threshold, use_boxplot = TRUE) {
  if (length(x) > threshold && use_boxplot) {
    boxplot(x)
  } else if (length(x) > threshold && !use_boxplot) {
    hist(x)
  } else {
    stripchart(x)
  }
}

#Call function
dat <- read.csv("data/inflammation-01.csv", header = FALSE)
plot_dist(dat[, 10], threshold = 10, use_boxplot = TRUE)   

plot_dist(dat[, 10], threshold = 10, use_boxplot = FALSE) 

plot_dist(dat[1:5, 10], threshold = 10)  

#Find the file containing the patient with the highest avg inflammation
filenames <- list.files(path = "data", pattern = "inflammation-[0-9]{2}.csv", full.names = TRUE)
filename_max <- "" 
patient_max <- 0 
average_inf_max <- 0 

for (f in filenames) {
  dat <- read.csv(file = f, header = FALSE)
  dat.means <- apply(dat, 1, mean)
  
  for (patient_index in 1:length(dat.means)){
    patient_average_inf <- dat.means[patient_index]
  }
    if (patient_average_inf > average_inf_max) {
      average_inf_max <- patient_average_inf
      filename_max <- f
      patient_max <- patient_index
    }
}

#Call function
print(filename_max)
print(patient_max)
print(average_inf_max)

##Saving automatically generated figures
#Update analyze to include conditionals

analyze <- function(filename, output = NULL) {
  
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

#We can use analyze interactively
analyze("data/inflammation-01.csv")

#We can now also use it to save plots
analyze("data/inflammation-01.csv", output = "inflammation-01.pdf")

#Let's create a directory to save our results
dir.create("results")

#Run analyze
analyze("data/inflammation-01.csv", output = "results/inflammation-01.pdf")

#We now have to update analyze_all with this new info

analyze_all <- function(pattern) {
  data_dir <- "data"
  results_dir <- "results"
  filenames <- list.files(path = data_dir, pattern = pattern)
  for (f in filenames) {
    pdf_name <- file.path(results_dir, sub("csv", "pdf", f))
    analyze(file.path(data_dir, f), output = pdf_name)
  }
}

#Now all results can be saved in one line of code
analyze_all("inflammation.*csv")

##Exercises
#Update analyze to use lines instead of dots to plot

analyze <- function(filename, output = NULL) {
  
  if (!is.null(output)) {
    pdf(output)
  }
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation, type = "l")
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation, type = "l")
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation, type = "l")
  if (!is.null(output)) {
    dev.off()
  }
}

#Recreate figures with analyze_all
analyze_all("inflammation.*csv")


######################### CHAPTER 5 #####################################


#Bash commands will be stored in a nano file
