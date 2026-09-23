args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 3L) {
  stop("Usage: Rscript scripts/run_imputation_cli.R <data_dir> <input_name> <output_name>")
}

source("R/runImputation.R")

runImputation(
  data_dir = args[[1]],
  input_name = args[[2]],
  output_name = args[[3]]
)
