## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)

## ----setup---------------------------------------------------------------
library(opendatatoronto)

summary_diseases <- search_packages("Annual Summary of Reportable Communicable Diseases") %>%
  list_package_resources() %>%
  get_resource()

str(summary_diseases, max.level = 1)

## ------------------------------------------------------------------------
summary_diseases[["RatesbyDisease2007_2017.csv"]]

