#' Run Matrix Imputation in Docker
#'
#' Launches the `matrix-impute` Docker image and mounts a local data directory
#' at `/data` inside the container.
#'
#' @param data_dir Local directory containing the input file and receiving the
#'   output file.
#' @param input_name Input CSV filename relative to `data_dir`.
#' @param output_name Output CSV filename relative to `data_dir`.
#'
#' @return Invisibly returns the Docker process exit status.
#' @export
#'
#' @examples
#' \dontrun{
#' runImputation("data", "matrix_missing.csv", "matrix_completed.csv")
#' }
runImputation <- function(data_dir, input_name, output_name) {
  data_dir <- normalizePath(data_dir, winslash = "/", mustWork = TRUE)
  volume_spec <- paste0(data_dir, ":/data")

  docker_args <- c(
    "run",
    "--rm",
    "-v", shQuote(volume_spec),
    "matrix-impute",
    shQuote(input_name),
    shQuote(output_name)
  )

  status <- system2("docker", args = docker_args)

  if (!identical(status, 0L)) {
    stop("Docker container execution failed with status ", status)
  }

  invisible(status)
}
