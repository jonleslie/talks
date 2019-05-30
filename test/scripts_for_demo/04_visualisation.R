library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))


# Exercises ---------------------------------------------------------------

# 1
ggplot(data = mpg)

# 2
nrow(mpg)
dim(mpg)

# 3
?mpg
mpg
# 4

g1 <- ggplot(data = mpg)
g1+
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg, aes(x = cyl, y = hwy)) +
  geom_point()

# 5
ggplot(mpg, aes(drv, class)) +
  geom_point()

# Aesthetics --------------------------------------------------------------

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

# Geometric mapping -------------------------------------------------------

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(mpg) +
  geom_smooth(method = "lm", aes(displ, hwy))


weather

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(data = filter(mpg, class == "2seater"), colour = "red") 

# Practice ----------------------------------------------------------------

df <- fivethirtyeight::flying
glimpse(df)
str(df)
?fivethirtyeight::flying

ggplot(df) +
  geom_bar(position = "fill", mapping = aes(x = age, fill = recline_rude))

ggplot(fivethirtyeight::bechdel) +
  geom_histogram(mapping = aes(x =log10(budget_2013)))

glimpse(movies)
movies %>% 
  ggplot() +
  geom_point(mapping = aes(x = budget, y = rating))

