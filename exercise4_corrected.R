library(ggplot2)

plotTemperature <- function(df, output_file) {
  p <- ggplot(df, aes(x = time_min, y = temperature_c)) +
    geom_line() +
    geom_point()

  ggsave(filename = output_file, plot = p)
  return(p)
}

df <- read.csv("data/temperature_readings.csv", header = TRUE)
plotTemperature(df, "temperature_plot.pdf")
