imputeColumns <- function(input_file, output_file) {
  df <- utils::read.csv(
    input_file,
    header = TRUE,
    na.strings = "NA",
    check.names = FALSE
  )

  mat <- as.matrix(df)
  storage.mode(mat) <- "numeric"

  n_missing <- sum(is.na(mat))
  missing_percentage <- 100 * n_missing / length(mat)

  completed <- mat
  for (j in seq_len(ncol(completed))) {
    missing_idx <- is.na(completed[, j])
    if (any(missing_idx)) {
      column_median <- stats::median(completed[, j], na.rm = TRUE)
      completed[missing_idx, j] <- column_median
    }
  }

  completed_df <- as.data.frame(completed, check.names = FALSE)
  names(completed_df) <- names(df)

  utils::write.csv(
    completed_df,
    file = output_file,
    row.names = FALSE,
    quote = FALSE,
    na = "NA"
  )

  list(
    n_missing = n_missing,
    missing_percentage = missing_percentage
  )
}
