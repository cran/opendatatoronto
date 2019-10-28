## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE
)

## ----setup---------------------------------------------------------------
library(opendatatoronto)

list_package_resources("https://open.toronto.ca/dataset/ttc-ridership-analysis/") %>%
  get_resource()

## ------------------------------------------------------------------------
library(dplyr)

wellbeing_toronto_demographics <- list_package_resources("https://open.toronto.ca/dataset/wellbeing-toronto-demographics/") %>%
  filter(name == "wellbeing-toronto-demographics") %>%
  get_resource()

str(wellbeing_toronto_demographics, max.level = 1)

## ------------------------------------------------------------------------
wellbeing_toronto_demographics[["IndicatorMetaData"]]

## ------------------------------------------------------------------------
ttc_bus_delays_2019 <- search_packages("TTC Bus Delay Data") %>%
  list_package_resources() %>%
  filter(name == "ttc-bus-delay-data-2019") %>%
  get_resource()

## ------------------------------------------------------------------------
str(ttc_bus_delays_2019, max.level = 1)

## ------------------------------------------------------------------------
sapply(ttc_bus_delays_2019, colnames)

## ------------------------------------------------------------------------
ttc_bus_delays_2019[["Apr 2019"]] <- ttc_bus_delays_2019[["Apr 2019"]] %>%
  rename(`Min Gap` = Gap, `Min Delay` = Delay)

## ------------------------------------------------------------------------
ttc_bus_delays_2019_combined <- bind_rows(ttc_bus_delays_2019)

ttc_bus_delays_2019_combined

## ------------------------------------------------------------------------
ttc_bus_delays_2019_combined %>%
  filter(!is.na(`Incident ID`)) %>%
  distinct(`Incident ID`, Incident)

