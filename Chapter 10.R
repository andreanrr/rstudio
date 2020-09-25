##sample some data
dat <- read.csv(file = 'data/sample.csv', header = TRUE, stringsAsFactors = FALSE)
#selecting values
dat[1, 1]
#selecting more values
dat[, 2]
#Subsetting with Sequences
dat[, 6:9]
#Subsetting Non-Sequential Data
dat[1:5, c(5, 2)]
#Using Logical Indexes

plot(dat[dat$Group != 'Control', ]$BloodPressure)
#Updating a Subset of Values UPPERCASE TO LOWERCASE
dat[dat$Gender == 'M', ]$Gender <- 'm'
dat[dat$Gender == 'F', ]$Gender <- 'f'