library(tidyverse)
library(lubridate)


ex1 <- data_frame(
  vec1 = c(1980, 1990, 2000, 2010),
  vec2 = c(1L, 2L, 3L, 4L),
  vec3 = c("low", "low", "high", "high"),
  vec4 = c(TRUE, FALSE, FALSE, FALSE),
  vec5 = ymd(c("2017-05-23", "1776/07/04", 
               "1983-05/31", "1908/04-01"))
)

ex1

View(ex1)
names(ex1)
summary(ex1)
# skimr::skim(ex1)
glimpse(ex1)
table(ex1$vec4)

str(ex1)

help(summary)
?summary
example(summary)

# Subsetting and viewing --------------------------------------------------

ex1$vec1
typeof(ex1$vec1)
ex1[1,]
ex1[1:2,]
ex1[,3]

ex1[ex1$vec4,]
ex1[ex1$vec3 == "high", ]

# gapminder ---------------------------------------------------------------

library(gapminder)
gapminder

gapminder %>% 
  filter(continent == "Asia") %>% 
  summarise(test = mean(lifeExp))


range(gapminder$year)
table(gapminder$year)

gapminder %>%
  filter(year > 2000) %>%
  arrange(desc(lifeExp)) %>%
  select(year, lifeExp)

# practice for dplyr -----------------------------------------------------

# q1 What is the maximum arrival delay for each carrier departing JFK?
library(nycflights13)
flights

flights %>% 
  group_by(carrier) %>% 
  filter(origin == "JFK") %>% 
  summarise(max_delay = max(arr_delay, na.rm = TRUE))


# Which carrier has the worst delays (mean arrival delay)?
flights %>% 
  group_by(carrier) %>% 
  summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(desc(mean_arr_delay))

# What airline corresponds to the "F9" carrier code?

airlines %>% 
  filter(carrier == "F9")

flights %>% 
  select(year:day, ends_with("delay")) %>% 
  group_by(year, month, day) %>%
  filter(rank(desc(arr_delay)) < 10) 
