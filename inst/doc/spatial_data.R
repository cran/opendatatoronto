## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE
)

## ----setup---------------------------------------------------------------
library(opendatatoronto)
library(dplyr)

bike_parking_racks <- search_packages("Bicycle Parking Racks") %>%
  list_package_resources() %>%
  filter(name == "Bicycle Parking Racks Data") %>%
  get_resource()

bike_parking_racks

## ------------------------------------------------------------------------
neighbourhoods <- list_package_resources("https://open.toronto.ca/dataset/neighbourhoods/") %>%
  get_resource()

neighbourhoods[c("AREA_NAME", "geometry")]

## ----fig.width = 7-------------------------------------------------------
library(ggplot2)

ggplot() +
  geom_sf(data = neighbourhoods[["geometry"]]) +
  geom_sf(data = bike_parking_racks) +
  theme_minimal()

