library(tidyverse)
library(janitor)
install.packages(c("vroom", "readr"), dependencies = TRUE)

#first, lets import our csv of psychology workforce
pyschology_workforce_data <- read.csv("Race_Ethnicity_Table.csv", header = TRUE)

#next, let's clean up our column names
pyschology_workforce_data_clean_names <- clean_names(pyschology_workforce_data)

#let's do some light analysis on this data

#select
pyschology_workforce_selected <- select(pyschology_workforce_data_clean_names, Race/Ethnicity, x2016, x2017, x2018, x2019, x2020)

#filter
pyschology_workforce_filtered <- filter(pyschology_workforce_selected, x2016 > 0, x2020 > 0)

#mutate
pyschology_workforce_mutate <- mutate(pyschology_workforce_filtered, pct_change = (x2020-x2016)/x2016)

#arrange
pyschology_workforce_arrange <- arrange(pyschology_workforce_mutate, pct_change)

#export
write_csv(pyschology_workforce_2016_2020, ‘AAPI Psychology Workforce.csv’)
