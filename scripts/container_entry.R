args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 2L) {
  stop("Usage: Rscript container_entry.R <input_name> <output_name>")
}

source("/app/imputeColumns.R")

result <- imputeColumns(
  input_file = file.path("/data", args[[1]]),
  output_file = file.path("/data", args[[2]])
)

cat(sprintf(
  "Original missing-value percentage: %.2f%%\n",
  result$missing_percentage
))
