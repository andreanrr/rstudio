main <- function() {
  args <- commandArgs(trailingOnly = TRUE)
  first_file <- read.csv(args[1], header = FALSE)
  first_dim <- dim(first_file)
 
  for (filename in args[-1]) {
    new_file <- read.csv(filename, header = FALSE)
    new_dim <- dim(new_file)
    if (new_dim[1] != first_dim[1] | new_dim[2] != first_dim[2]) {
      cat("Not all the data files have the same dimensions.")
    }
  }
}

main()

