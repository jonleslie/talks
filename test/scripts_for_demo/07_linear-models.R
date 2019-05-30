library(tidyverse)

mpg

g1 <- ggplot(mpg, aes(displ, hwy)) +
  geom_point()

fit01 <- lm(hwy ~ displ, data = mpg)
fit01

g1 +
  geom_smooth(method = "lm")
g2 <- ggplot(mpg, aes(displ, hwy, colour = as.factor(cyl))) +
  geom_point()
g2 + geom_abline(intercept = fit01$coefficients[1],
                 slope = fit01$coefficients[2])

summary(fit01)

fit02 <- lm(hwy ~ displ + as.factor(cyl),
            data = mpg)
summary(fit02)

fit03 <- lm(hwy ~ displ + cyl,
            data = mpg)
summary(fit03)

fit04 <- loess(hwy ~ displ + cyl,
               data = mpg)

summary(fit04)
# Modelr ------------------------------------------------------------------

library(tidyverse)

library(modelr)

sim1
ggplot(sim1, aes(x = x, y = y)) +
  geom_point()
