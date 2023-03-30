library(tidyverse)
library(dbplyr)
library(janitor)
library(ggplot2)

FIXHAI <- read.csv(file = 'FIXHAI.csv')


plot <- FIXHAI |>
  mutate(DATE = ymd(DATE), label = TRUE) |>
  ggplot(aes(x = DATE, y = FIXHAI, group = 1))+
  geom_line(color = "blue")+
  labs(title = "Housing Affordability Index",
       subtitle = "The Affordabilty of Housing has decreased over the year",
       x = "Date",
       y = "Index",
       caption = "fred.stlouisfed.org")+
  theme_classic()

write_rds(plot, "Home_aff_index.rds")
