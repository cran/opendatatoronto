## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(opendatatoronto)

ttc_subway_delays_resources <- list_package_resources("https://open.toronto.ca/dataset/ttc-subway-delay-data/")

ttc_subway_delays_resources

## ---- eval = FALSE-------------------------------------------------------
#  library(dplyr)
#  
#  delays_jan_2019 <- ttc_subway_delays_resources %>%
#    filter(name == "ttc-subway-delay-january-2019") %>%
#    get_resource()
#  
#  delays_feb_2019 <- ttc_subway_delays_resources %>%
#    filter(name == "ttc-subway-delay-february-2019") %>%
#    get_resource()

## ----include = FALSE-----------------------------------------------------
library(dplyr)

## ------------------------------------------------------------------------
library(purrr)

ttc_subway_delays_2019 <- ttc_subway_delays_resources %>%
  filter(grepl("2019", name)) %>%
  mutate(data = map(id, get_resource))

ttc_subway_delays_2019

## ------------------------------------------------------------------------
map(ttc_subway_delays_2019[["data"]], colnames)

## ------------------------------------------------------------------------
bind_rows(ttc_subway_delays_2019[["data"]])

