## 11 ##

# First, set your working directory (see episode 'Analyzing Patient Data' for more
# info)
setwd("~/Desktop/r-novice-inflammation/")

# Import the data and look at the first six rows
carSpeeds <- read.csv(file = 'data/car-speeds.csv')
head(carSpeeds)

# The first row of the data without setting the header argument:
carSpeeds[1, ]

# The first row of the data if the header argument is set to FALSE:
carSpeeds <- read.csv(file = 'data/car-speeds.csv', header = FALSE)

carSpeeds[1, ]

# Here we will use R's `ifelse` function, in which we provide the test phrase,
# the outcome if the result of the test is 'TRUE', and the outcome if the
# result is 'FALSE'. We will also assign the results to the Color column,
# using '<-'

# First - reload the data with a header
carSpeeds <- read.csv(file = 'data/car-speeds.csv')

carSpeeds$Color <- ifelse(carSpeeds$Color == 'Blue', 'Green', carSpeeds$Color)
carSpeeds$Color

# DIsplay the internal structure of the data frame "carSpeeds"
str(carSpeeds)

# let’s load the dataset using stringsAsFactors=FALSE, 
# and see what happens when we try to replace ‘Blue’ with ‘Green’ in the $Color column
carSpeeds <- read.csv(file = 'data/car-speeds.csv', stringsAsFactors = FALSE)
str(carSpeeds)

carSpeeds$Color <- ifelse(carSpeeds$Color == 'Blue', 'Green', carSpeeds$Color)
carSpeeds$Color

# If we want the colors of cars imported as strings, 
# but we want the names of the states imported as factors, we would load the data set as:
carSpeeds <- read.csv(file = 'data/car-speeds.csv', as.is = 1)
# Note, the 1 applies as.is to the first column only

str(carSpeeds)

carSpeeds$Color <- ifelse(carSpeeds$Color == 'Blue', 'Green', carSpeeds$Color)
carSpeeds$Color

carSpeeds$State <- ifelse(carSpeeds$State == 'Arizona', 'Ohio', carSpeeds$State)
carSpeeds$State

# Updating Values in a Factor

carSpeeds <- read.csv(file = 'data/car-speeds.csv')
# Replace 'Blue' with 'Green' in cars$Color without using the stringsAsFactors
# or as.is arguments
carSpeeds$Color <- ifelse(as.character(carSpeeds$Color) == 'Blue',
                          'Green',
                          as.character(carSpeeds$Color))
# Convert colors back to factors
carSpeeds$Color <- as.factor(carSpeeds$Color)

# We use the built-in unique() function to extract the unique colors in our dataset
unique(carSpeeds$Color)

carSpeeds <- read.csv(
  file = 'data/car-speeds.csv',
  stringsAsFactors = FALSE, 
  strip.white = TRUE,
  sep = ','
)
unique(carSpeeds$Color)

# Export the data. The write.csv() function requires a minimum of two
# arguments, the data to be saved and the name of the output file.

write.csv(carSpeeds, file = 'data/car-speeds-cleaned.csv')
write.csv(carSpeeds, file = 'data/car-speeds-cleaned.csv', row.names = FALSE)

# First, replace the speed in the 3rd row with NA, by using an index (square
# brackets to indicate the position of the value we want to replace)
carSpeeds$Speed[3] <- NA
head(carSpeeds)

write.csv(carSpeeds, file = 'data/car-speeds-cleaned.csv', row.names = FALSE)

# Note - the na argument requires a string input
write.csv(carSpeeds,
          file = 'data/car-speeds-cleaned.csv',
          row.names = FALSE,
          na = '-9999')

## 12 ##

# The factor() command is used to create and modify factors in R
sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)

# Sometimes, the order of the factors does not matter, 
# other times you might want to specify the order because it is meaningful.
# Specifying the order of the levels allows us to compare levels
food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
levels(food)

food <- factor(food, levels = c("low", "medium", "high"))
levels(food)

min(food) # doesn't work

food <- factor(food, levels = c("low", "medium", "high"), ordered = TRUE)
levels(food)

min(food) # works!

# Representing Data in R
# Correct solution is d)
exercise <- factor(c("l", "n", "n", "i", "l"), levels = c("n", "l", "i"), ordered = TRUE)

f <- factor(c(3.4, 1.2, 5))
as.numeric(f)

# The recommended way is to use the integer vector to index the factor levels:
levels(f)[f]
f <- levels(f)[f]
f <- as.numeric(f)

# Lets load our example data to see the use of factors:
dat <- read.csv(file = 'data/sample.csv', stringsAsFactors = TRUE)

str(dat)
summary(dat)

# The function table() tabulates observations and can be used to create bar plots quickly
table(dat$Group)

barplot(table(dat$Group))

dat$Group <- factor(dat$Group, levels = c("Treatment1", "Treatment2", "Control"))
barplot(table(dat$Group))

# Some of the Gender values in our dataset have been coded incorrectly. Let’s remove levels from this factor.
barplot(table(dat$Gender))

# Values should have been recorded as lowercase ‘m’ and ‘f’. We should correct this.
dat$Gender[dat$Gender == 'M'] <- 'm'

plot(x = dat$Gender, y = dat$BloodPressure)

# We need to tell R that “M” is no longer a valid value for this column. 
# We use the droplevels() function to remove extra levels.
dat$Gender <- droplevels(dat$Gender)
plot(x = dat$Gender, y = dat$BloodPressure)

# Adjusting the levels() of a factor provides a useful shortcut for reassigning values in this case
levels(dat$Gender)[2] <- 'f'
plot(x = dat$Gender, y = dat$BloodPressure)

## 13 ##

# Example
x <- "dataset"
typeof(x)
attributes(x)

y <- 1:10
y
typeof(y)
length(y)

z <- as.numeric(y)
z
typeof(z)

vector() # an empty 'logical' (the default) vector

# You can create an empty vector with vector(). By default the mode is logical
vector() # an empty 'logical' (the default) vector

vector("character", length = 5) # a vector of mode 'character' with 5 elements

character(5) # the same thing, but using the constructor directly

numeric(5)   # a numeric vector with 5 elements

logical(5)   # a logical vector with 5 elements

# You can also create vectors by directly specifying their content
x <- c(1, 2, 3)

# If you wanted to explicitly create integers, you need to add an L to each element
x1 <- c(1L, 2L, 3L)

y <- c(TRUE, TRUE, FALSE, FALSE)

z <- c("Sarah", "Tracy", "Jon")

# You can create vectors as a sequence of numbers.
series <- 1:10
seq(10)

seq(from = 1, to = 10, by = 0.1)

# R supports missing data in vectors. They are represented as NA
x <- c(0.5, NA, 0.7)
x <- c(TRUE, FALSE, NA)
x <- c("a", NA, "c", "d", "e")
x <- c(1+5i, 2-3i, NA)

# The function is.na() indicates the elements of the vectors that represent missing data, 
# and the function anyNA() returns TRUE if the vector contains any missing values
x <- c("a", NA, "c", "d", NA)
y <- c("a", "b", "c", "d", "e")
is.na(x)

is.na(y)

anyNA(x)

anyNA(y)

# What Happens When You Mix Types Inside a Vector?
# R will create a resulting vector with a mode that can most easily accommodate all the elements it contains. 
# This conversion between modes of storage is called “coercion”
xx <- c(1.7, "a")
xx <- c(TRUE, 2)
xx <- c("a", TRUE)

as.numeric("1")

as.character(1:2)

# You can also glean other attribute-like information such as length or number of characters
length(1:10)

nchar("Software Carpentry")

# In R matrices are an extension of the numeric or character vectors
m <- matrix(nrow = 2, ncol = 2)
m

dim(m)

# You can check that matrices are vectors with a class attribute of matrix by using class() and typeof().
m <- matrix(c(1:3))
class(m)

typeof(m)

# Matrices in R are filled column-wise
m <- matrix(1:6, nrow = 2, ncol = 3)

# Other ways to construct a matrix
m <- 1:10
dim(m) <- c(2, 5)

# Another way is to bind columns or rows using rbind() and cbind()
x <- 1:3
y <- 10:12
cbind(x, y)

rbind(x, y)

# You can also use the byrow argument to specify how the matrix is filled
mdat <- matrix(c(1, 2, 3, 11, 12, 13),
               nrow = 2,
               ncol = 3,
               byrow = TRUE)
mdat

# Elements of a matrix can be referenced by specifying the 
# index along each dimension in single square brackets
mdat[2, 3]

# Create lists using list() or coerce other objects using as.list()
x <- list(1, "a", TRUE, 1+4i)
x

x <- vector("list", length = 5) # empty list
length(x)

# The content of elements of a list can be retrieved by using double square brackets
x[[1]]

# Vectors can be coerced to lists as follows
x <- 1:10
x <- as.list(x)
length(x)

# Examining Lists
class(x[1])
class(x[[1]])

# Elements of a list can be named 
xlist <- list(a = "Karthik Ram", b = 1:10, data = head(iris))
xlist

names(xlist)

# Examining Named Lists
length(xlist)

str(xlist)

# To create data frames by hand
dat <- data.frame(id = letters[1:10], x = 1:10, y = 11:20)
dat

is.list(dat)
class(dat)

# Because data frames are rectangular, elements of data frame can be referenced 
# by specifying the row and the column index in single square brackets
dat[1, 3]

# As data frames are also lists, it is possible 
# to refer to columns using the list notation
dat[["y"]]
dat$y

# Column Types in Data Frames
str(iris)

## 14 ##

# The Call Stack
original <- 32
final <- fahrenheit_to_kelvin(original)

temp_F

# Here’s a function called span that calculates the difference 
# between the minimum and maximum values in an array
span <- function(a) {
  diff <- max(a) - min(a)
  return(diff)
}

dat <- read.csv(file = "data/inflammation-01.csv", header = FALSE)
# span of inflammation data
span(dat)

# We might very well use a variable with the same name (diff) to hold the inflammation data
diff <- read.csv(file = "data/inflammation-01.csv", header = FALSE)
# span of inflammation data
span(diff)

## 15 ##

# This lesson is an extension of Analyzing Multiple Data Sets. 
# In that lesson, we introduced how to run a custom 
# function, analyze, over multiple data files:
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
filenames <- list.files(path = "data", pattern = "inflammation-[0-9]{2}.csv", full.names = TRUE)

# To add pairs of numbers contained in two vectors
a <- 1:10
b <- 1:10

# Instead of using i in a to make our loop variable, 
# we use the function seq_along to generate indices for each element a contains.
res <- numeric(length = length(a))
for (i in seq_along(a)) {
  res[i] <- a[i] + b[i]
}
res

# Instead, "+" is a vectorized function which can operate on entire vectors at once
res2 <- a + b
all.equal(res, res2)

# If you perform an operation on two or more vectors of unequal length, 
# R will recycle elements of the shorter vector(s) to match the longest vector
a <- 1:10
b <- 1:5
a + b

a <- 1:10
b <- 5
a * b

# When the longer object length is not a multiple 
# of the shorter object length, a warning is given:
a <- 1:10
b <- 1:7
a + b

# Instead of looping over filenames and calling analyze, 
# as you did earlier, you could sapply over filenames with FUN = analyze:
sapply(filenames, FUN = analyze)

# We’ll create a new version of analyze that will 
# return the mean inflammation per day (column) of each file.
analyze2 <- function(filenames) {
  for (f in seq_along(filenames)) {
    fdata <- read.csv(filenames[f], header = FALSE)
    res <- apply(fdata, 2, mean)
    if (f == 1) {
      out <- res
    } else {
      # The loop is slowed by this call to cbind that grows the object
      out <- cbind(out, res)
    }
  }
  return(out)
}

system.time(avg2 <- analyze2(filenames))

# This time there is no copying/growing for R to deal with
analyze3 <- function(filenames) {
  out <- matrix(ncol = length(filenames), nrow = 40) # assuming 40 here from files
  for (f in seq_along(filenames)) {
    fdata <- read.csv(filenames[f], header = FALSE)
    out[, f] <- apply(fdata, 2, mean)
  }
  return(out)
}

system.time(avg3 <- analyze3(filenames))