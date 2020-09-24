main <- function() {
	args <- commandArgs(trailingOnly = TRUE)
	num1 <- as.numeric(args[1])
	operation <- args[2]
	num2 <- as.numeric(args[3])
	if (operation == '+') {
		answer <- num1 + num2
		cat(answer)
	} else if (operation == '-') {
		answer <- num1 - num2
		cat(answer)
	} else {
	stop("Invalid input. Use + for addition or - for subtraction.")
	}
}

main()
