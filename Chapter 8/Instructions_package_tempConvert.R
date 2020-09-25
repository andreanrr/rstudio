install.packages(c("devtools", "roxygen2")) 
library("devtools")
library("roxygen2")

create_package("tempConvert")

##BEFORE THESE STEPS MAKE SURE TO HAVE MADE THE RSCRIPTS WITH THE DIFFERENT FUNCTIONS
##TRANSFER THE rSCRIPSTS WITH FUNCTIONS INTO ./TEMPCONVERT/R
setwd("./tempConvert")
document()

setwd("..")
install("tempConvert")
library("tempConvert")
?fahrenheit_to_kelvin
?