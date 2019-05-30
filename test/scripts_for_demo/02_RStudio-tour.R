library(tidyverse)

ggplot(mtcars, aes(x = disp, y = mpg, colour = hp, shape = as.factor(cyl))) +
  geom_point(size = 3)

mtcars 
mtcars %>% as.tibble()
