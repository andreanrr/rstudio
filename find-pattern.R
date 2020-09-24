main <- function() {
	args <- commandArgs(trailingOnly = TRUE)
	pattern <- args[1]
	files <- list.files(pattern = pattern)
	cat(files, sep = "\n")
}
main()
