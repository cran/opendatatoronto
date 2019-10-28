## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE
)

## ----list-packages-example-----------------------------------------------
library(opendatatoronto)

packages <- list_packages(limit = 10)

packages

## ------------------------------------------------------------------------
apartment_packages <- search_packages("Apartment")

apartment_packages

## ------------------------------------------------------------------------
show_package("996cfe8d-fb35-40ce-b569-698d51fc683b")

## ----list-apartment-building-registration-resources----------------------
apartment_building_registration_package <- search_packages("Apartment Building Registration")

apartment_building_registration_resources <- apartment_building_registration_package %>%
  list_package_resources()

apartment_building_registration_resources

## ----list-resources-from-portal------------------------------------------
list_package_resources("https://open.toronto.ca/dataset/apartment-building-registration/")

## ----get-apartment-building-registration---------------------------------
apartment_building_registration_data <- apartment_building_registration_resources %>%
  get_resource()

apartment_building_registration_data

