##Set working directory (adjust to user)
setwd('C:/Users/andre/Desktop/r-novice-inflammation/')

##Import data into RStudio

##Remember to set header = FALSE or the console will use our values as headers. 
##The default is TRUE.
read.csv(file = 'data/inflammatio-01.csv', header = FALSE)

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
