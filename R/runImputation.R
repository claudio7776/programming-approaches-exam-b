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
