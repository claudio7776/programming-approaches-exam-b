# matrixImpute

R functions, a Docker command-line workflow, an R package, and debugging exercises for matrix imputation.

## Requirements

- R
- Docker
- ggplot2
- roxygen2

## Direct R use

```r
source("R/imputeColumns.R")

result <- imputeColumns(
  "data/matrix_missing.csv",
  "data/matrix_completed.csv"
)

print(result)
```

## Docker

Build the image from the repository root:

```bash
docker build -t matrix-impute .
```

Run the host-side command-line wrapper:

```bash
Rscript scripts/run_imputation_cli.R data matrix_missing.csv matrix_completed.csv
```

The local data directory is mounted at `/data` in the container. The completed CSV is written back to the local folder and the original missing-value percentage is printed to the terminal.

## R package

Generate documentation:

```bash
Rscript -e 'roxygen2::roxygenise("matrixImpute")'
```

Build and check the package:

```bash
R CMD build matrixImpute
R CMD check matrixImpute_1.0.0.tar.gz
```

Install the source package:

```bash
R CMD INSTALL matrixImpute_1.0.0.tar.gz
```

## Plotting task

```bash
Rscript exercise4_corrected.R
```

## Missing-value debugging task

```bash
Rscript exercise5_corrected.R
```
