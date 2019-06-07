# What is the maximum arrival delay for each carrier departing JFK?

library(tidyverse)
library(nycflights13)

nycflights13::flights

flights %>% 
  select(arr_delay) %>% 
  summary()

unique(flights$carrier)
length(unique(flights$carrier))

flights %>% 
  filter(origin == "JFK") %>% 
  group_by(carrier) %>% 
  summarise(max_arr_delay = max(arr_delay, na.rm = TRUE))

flights %>% 
  group_by(carrier) %>% 
  filter(origin == "JFK") %>% 
  summarise(max_delay = max(arr_delay, na.rm = TRUE))



# Which carrier has the worst delays (mean arrival delay)?
flights %>% 
  group_by(carrier) %>% 
  summarise(av_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(desc(av_arr_delay))

flights %>% 
  group_by(carrier) %>% 
  summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(desc(mean_arr_delay))


# What airline corresponds to the "F9" carrier code?
airlines

airlines %>% 
  filter(carrier == "F9") %>% 
  select(name)


# challenge
flights %>% 
  select(year:day, ends_with("delay")) %>% 
  group_by(year, month, day) %>%
  filter(rank(desc(arr_delay)) < 10) 

