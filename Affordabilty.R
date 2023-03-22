library(tidyverse)
library(dbplyr)
library(janitor)
library(ggplot2)

FIXHAI <- read.csv(file = 'FIXHAI.csv')
FIXHAI |>
  mutate(DATE = as.Date(DATE))

plot <- FIXHAI |>
  ggplot(aes(x = DATE, y = FIXHAI, group = 1))+
  geom_line(color = "blue")+
  labs(title = "Housing Affordability Index",
       subtitle = "The Affordabilty of Housing has decreased over the year",
       x = "Date",
       y = "Index",
       caption = "fred.stlouisfed.org")+
  theme_classic()

write_rds(plot, "House_affordability.rds")
