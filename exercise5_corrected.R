missingInfo <- function(mat) {
  total <- length(mat)
  n_missing <- sum(is.na(mat))
  missing_percentage <- 100 * n_missing / total

  return(list(
    n_missing = n_missing,
    missing_percentage = missing_percentage
  ))
}

runMissingInfo <- function(file) {
  data <- as.matrix(read.csv(file, header = TRUE, na.strings = "NA"))
  missingInfo(data)
}

print(runMissingInfo("data/matrix_missing.csv"))
