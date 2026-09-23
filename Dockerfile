FROM rocker/r-ver:4.4.2

WORKDIR /app

RUN R -e "install.packages('ggplot2', repos='https://cloud.r-project.org')"

COPY R/imputeColumns.R /app/imputeColumns.R
COPY scripts/container_entry.R /app/container_entry.R

ENTRYPOINT ["Rscript", "/app/container_entry.R"]
