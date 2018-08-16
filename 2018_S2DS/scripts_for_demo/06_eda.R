library(tidyverse)

diamonds
glimpse(diamonds)
?diamonds

smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)

smaller %>% 
  ggplot(aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(diamonds) +
  geom_histogram(aes(x = x))
ggplot(diamonds) +
  geom_histogram(aes(x = y))
ggplot(diamonds) +
  geom_histogram(aes(x = z))
