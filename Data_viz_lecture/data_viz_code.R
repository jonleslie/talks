#' ---
#' title: "An introduction to data visualisation"
#' author: 'Dr. Jonathan Leslie <br> Head of Data Science at <a href="https://www.pivigo.com/">Pivigo</a> <br><br> <a href="https://github.com/jonleslie"><i class="fa fa-github fa-fw"></i>&nbsp; jonleslie</a><br> <a href="https://twitter.com/jlesliedata"> <i class="fa fa-twitter fa-fw"></i>&nbsp; @jlesliedata</a><br> <a href="mailto:jonathan.leslie@pivigo.com"><i class="fa fa-paper-plane fa-fw"></i>&nbsp; jonathan.leslie@pivigo.com</a><br>'
#' date:  <br><br><br>
#' output: 
#'   xaringan::moon_reader:
#'     chakra: remark-latest.min.js
#'     lib_dir: libs
#'     nature:
#'       highlightStyle: tomorrow-night-bright
#'       highlightLines: true
#'       highlightLanguage: r
#'       slideNumberFormat: "%current%/%total%"
#'     includes:
#'       in_header: header.html      
#'     countIncrementalSlides: false
#'     css: example.css
#' ---
#' 
#' class: inverse
#' name: toc
#' 
#' 
## ----include=FALSE, purl=TRUE--------------------------------------------
#specify the packages of interest
pkgs <- c("tidyverse", "moderndive", "gapminder",
          "nycflights13", "fivethirtyeight", "janitor",
          "ggplot2movies", "remotes")

# use this function to check if each package is on the local machine
# if a package is installed, it will be loaded
# if any are not, the missing package(s) will be installed and loaded
pkg.check <- function(x) {
    if (!require(x, character.only = TRUE)) {
        install.packages(x, dependencies = TRUE, repos = "https://cran.rstudio.com")
        library(x, character.only = TRUE)
    }
}
lapply(pkgs, pkg.check)

if(!require("infer"))
  remotes::install_github("andrewpbray/infer")

#' 

#' 
#' # Table of Contents
#' 
#' Part 1
#'   - [Principles of data visualisation](#viz_principles)
#'   - [Building a graphic](#building_a_graphic)
#'   - [(Some) Types of plots](#plot_types)
#' 
#' Part 2
#'   - [Data visualisation in R](#viz)
#'   - [Other resources](#resources)
#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' ---
#' 
#' # Acknowledgements
#' 
#' Dr. Chester Ismay <br><br><br> <a href="http://github.com/ismayc"><i class="fa fa-github fa-fw"></i>&nbsp; ismayc</a><br> <a href="http://twitter.com/old_man_chester"> <i class="fa fa-twitter fa-fw"></i>&nbsp; @old_man_chester</a><br><br>
#'   
#' .footer[Slides available at http://bit.ly/ness-infer &emsp; &emsp; &emsp; ]
#' 
#' ---
#' 
#' # Acknowledgements
#' 
#' .pull-left[Claus O. Wilke <br><br><br> <a href="https://github.com/clauswilke"><i class="fa fa-github fa-fw"></i>&nbsp; clauswilke</a><br> <a href="https://twitter.com/ClausWilke"> <i class="fa fa-twitter fa-fw"></i>&nbsp; @ClausWilke</a><br><br>]
#' .pull-right[<img src="img/Fund_of_Data_Vis-cover.png" /><br><br><br>]
#' 
#' .footer[https://serialmentor.com/dataviz/index.html &emsp; &emsp; &emsp; ]
#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---
#' 
#' name: viz_principles
#' 
#' # Principles of Visualisation
#' - Why do we use visualisations
#' - Some best practices
#' 
#' ---
#' 
#' # Why do we use visualisations?
#' 
#' ---
#' 
#' ## To show a finding
#' 

#' 
#' 
#' ---
#' 
#' ## To tell a story
#' 
#' <img src="img/Minard's_Map_(vectorized).png" syle="width:300px; center" />
#' 
#' .small.right[Charles Joseph Minard (1869)]
#' 
#' 
#' ---
#' 
#' ## To make something beautiful
#' 
#' .center[<img src="img/Switzerland.png" style="height:490px" />]
#' 
#' ---
#' 
#' # Why do we use visualisations?
#' 
#' .center.large[<br><br><span style="color:#FF0000">TO ACCURATELY EXCHANGE INFORMATION</span>]
#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' ---
#' 
#' # "The good, the bad and the ugly"
#' 
#' .center[<img src="img/ugly-bad-wrong-examples-1.png" width="80%"/><br>]
#' 
#' .small.right[(https://serialmentor.com/dataviz/)]
#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---
#' 
#' # Another example
#' 
#' .center[<img src="img/bad_fig.png_large" />]
#' 
#' ---
#' 
#' # Some best practices
#' - Accuracy
#' - Reproducibility
#' - Autogeneration
#'   - Manual editing --> irreproducibility
#'   - Easy to make changes
#'   - Future you may not know what present you did
#' - Avoid interactive plot programmes (Excel counts)
#' 
#' ---
#' 
#' # Consider your audience
#' - Publication
#' - Conference talk
#' - Exploratory data analysis
#' - Progress report to your boss
#' 
#' ---
#' 
#' name: building_a_graphic
#' 
#' # Building a graphic
#' 
#' - <span style="color:#FF0000">__aes__</span>thetic mapping
#' - <span style="color:#FF0000">__geom__</span>etric objects
#' 
#' [//]: # "https://stackoverflow.com/questions/29067541/how-to-change-the-font-color"
#' 
#' ---
#' 
#' # Aesthetic mapping
#' - Mapping of data values to quantifiable features on the graphic
#' - Can include:
#'   - position
#'   - colour
#'   - shape
#'   - size
#'   
#' ---
#' 

#' 

#' 
#' ---
#' 
#' # Geometric objects (geoms)
#' - The visual representation of the data
#' - For example:
#'   - point
#'   - line
#'   - bar
#'   - boxplot
#' 
#' ---
#' 

#' 
#' 

#' 
#' ---
#' 
#' # What plot should I use?
#' 
#' --
#' 
#' What data type are you working with:
#' - Numerical
#' - Categorical
#' - Other
#'   - Dates/time
#'   - Text
#' 
#' ---
#' 
#' ## Numerical data (quantitative)
#' - Continuous:
#'   - Arbitrary numerical values
#'   - 1.3, 42.0, 8675309
#' - Discrete:
#'   - Numbers in discrete units
#'   - 1, 2, 3, 4
#'   
#' ---
#' 
#' ## Categorical data (qualitative)
#' - Variables are called factors
#' - Categories are called levels
#' - Can be ordinal:
#'   - bad, fair, good, excellent
#' - or nominal:
#'   - red, blue, green
#' 
#' ---
#' 
#' ## Some questions to help you:
#' .right.small[(Adopted from ASSOCIATIONS AND CORRELATIONS by Lee Baker)]<br>
#' 
#' --
#' 
#' - Is the variable measured (with an implement) or observed
#' 
#' --
#' 
#' - Are the data ordered?
#'   - Can they be ordered meaningfully with progress detected between adjacent data points?
#' 
#' --
#' 
#' - Are the data points equidistant?
#'   - Is the distance between adjacent data points or categories consistent?
#' 
#' ---
#' 
#' layout: false
#' class: remark-code-line-highlighted
#' 
#' # Summary of data types
#' 
#' <br><br>
#' 

#' 
#' ---
#' Your turn:
#' 

#' --
#' <br>

#' 
#' ---
#' Flight data:
#' 

#' 
#' <br>

#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---
#' 
#' name: plot_types
#' 
#' # What plot should I use?
#' 
#' ---
#' 
#' # What plot should I use?
#' To show amounts
#' - Bars<br><br>
#' 
#' .left-column[

#' ]
#' 
#' .right-column[

#' ]
#' 
#' ---
#' 
#' # What plot should I use?
#' To show distributions
#' - Histograms, density plots, boxplots, others<br><br>
#' 
#' .left-column[

#' ]
#' 
#' .right-column[

#' ]
#' 
#' ---
#' 
#' ## The mighty boxplot
#' 

#' 
#' ---
#' 
#' # What plot should I use?
#' To show _x-y_ relationships
#' - Scatter plot, line graphs<br><br>
#' 
#' .left-column[

#' 
#' ]
#' 
#' .right-column[

#' 
#' ]
#' 
#' ---
#' 
#' # Other uses:
#' - Proportions
#' - Geospatial data
#' - Uncertainty (error bars, etc)
#' - Empirical cumulative distribution functions
#' - Quantile-quantile plots
#' 
#' 
#' ---
#' 
#' layout: false
#' class: center, middle
#' name: viz
#' 
#' # Data Visualization
#' 
#' `r gif_link("https://ggplot2.tidyverse.org", "img/ggplot2_hex.png", 400)`
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---

#' 
#' - What are the variables here?
#' - What is the observational unit?
#' - How are the variables mapped to aesthetics?
#' 
#' ---
#' 
#' class: center, middle
#' 
#' ## Grammar of Graphics
#' 
#' Wilkinson (2005) laid out the proposed <br> "Grammar of Graphics"
#' 
#' <br>
#' 
#' <a href="http://www.powells.com/book/the-grammar-of-graphics-9780387245447"><img src="figure/graphics.jpg" style="width: 200px;"></a>
#' 
#' ---
#' 
#' class: center, middle
#' 
#' ## Grammar of Graphics in R
#' 
#' Wickham implemented the grammar in R <br> in the `ggplot2` package
#' 
#' <br>
#' 
#' <a href="http://www.powells.com/book/ggplot2-elegant-graphics-for-data-analysis-9783319242750/68-428"><img src="figure/ggplot2.jpg" style="width: 200px;"></a>
#' 
#' ---
#' 
#' class: center, middle
#' 
#' ## What is a statistical graphic?
#' 
#' --
#' 
#' ## A `mapping` of <br> `data` variables
#' 
#' --
#' 
#' ## to <br> `aes()`thetic attributes
#' 
#' --
#' 
#' ## of <br> `geom_`etric objects.
#' 
#' ---
#' 
#' class: inverse, center, middle
#' 
#' # Back to Basics
#' 
#' ---
#' 
#' ## Old school
#' 
#' - Sketch the graphics below on paper, where the `x`-axis is variable `A` and the `y`-axis is variable `B`
#' 
## ----echo=FALSE, purl=TRUE-----------------------------------------------
simple_ex <-
  data_frame(
    A = c(1980, 1990, 2000, 2010),
    B = c(1, 2, 3, 4),
    C = c(3, 2, 1, 2),
    D = c("cold", "cold", "hot", "hot")
  )
simple_ex

#' 
#' <!-- Copy to chalkboard/whiteboard -->
#' 
#' 1. <small>A scatter plot</small>
#' 1. <small>A scatter plot where the `color` of the points corresponds to `D`</small>
#' 1. <small>A scatter plot where the `size` of the points corresponds to `C`</small>
#' 
#' ---
#' 
#' layout: true
#' class: inverse
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---
#' 
#' ## Reproducing the plots in `ggplot2`
#' 
#' ### 1. A scatterplot
#' 

#' --
#' 
## ---- echo=FALSE, fig.height=4.4, purl=TRUE------------------------------
ggplot(data = simple_ex, aes(x = A, y = B)) + 
  geom_point()

#' 
#' 
#' ---
#' 
#' 
#' ## Reproducing the plots in `ggplot2`
#' 
#' ### 2. A scatter plot where the `color` of the points corresponds to `D`
#' 

#' --
#' 
## ---- echo=FALSE, fig.height=4.4, purl=TRUE------------------------------
ggplot(data = simple_ex, mapping = aes(x = A, y = B)) + 
  geom_point(mapping = aes(color = D))

#' 
#' 
#' ---
#' 
#' ## Reproducing the plots in `ggplot2`
#' 
#' ### 3. A scatter plot where the `size` of the points corresponds to `C`
#' 

#' --
#' 
## ---- echo=FALSE, fig.height=4.4, purl=TRUE------------------------------
ggplot(data = simple_ex, mapping = aes(x = A, y = B, size = C)) + 
  geom_point()

#' 
#' ---
#' 
#' # Another example
#' 
#' Do cars with bigger engines have lower fuel efficiency?
#' 
## ------------------------------------------------------------------------
mpg

#' 
#' ---
#' 
## ---- fig.height=6.4, purl=TRUE------------------------------------------
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

#' 
#' ---
#' 

#' 
#' ```
#' ggplot(data = <DATA>) + 
#'   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
#' ```
#' 
#' ---
#' 
#' ## Exercises
#' 1. Run `ggplot(data = mpg)`. What do you see?
#' 
#' 2. How many rows are in mpg? How many columns?
#' 
#' 3. What does the `drv` variable describe? Read the help for `?mpg` to find out.
#' 
#' 4. Make a scatterplot of hwy vs cyl.
#' 
#' 1. What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
#' 
#' ---
#' 
#' # Aesthetic mapping
#' 
#' - An aesthetic is a visual property of the objects in your plot.
#' 
#' - Aesthetics include things like the size, the shape, or the color of your points.
#' 
#' ---
#' 
#' ## Mapping to colour
#' 
## ---- fig.height=5.5, purl=TRUE------------------------------------------
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

#' 
#' ---
#' 
#' ## Mapping to shape
#' 
## ---- fig.height=5.5, purl=TRUE------------------------------------------
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#' 
#' ---
#' 
#' ## Mapping to size
#' 
## ---- fig.height=5.5, purl=TRUE------------------------------------------
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

#' 
#' ---
#' 
#' # Facets
#' 
## ---- fig.height=5, purl=TRUE--------------------------------------------
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

#' 
#' ---
#' 
#' # Geometric objects
#' 
#' A geom is the geometrical object that a plot uses to represent data. 
#' 
#' ---
#' 
#' ## Same data, different `geom`s
#' 
## ----echo=FALSE, purl=TRUE, fig.hold = "hold", fig.width=5---------------
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#' 
#' 
#' Exercise: try to create each of these plots
#' 
#' (hint: use `geom_smooth` for plot on the right)
#' 
#' ---
#' 
#' ## Can you create this one?
#' 
## ----echo=FALSE, purl=TRUE, fig.width = 5, fig.align='center'------------
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#' 
#' --
#' 
## ----eval=FALSE, purl=TRUE, fig.width = 5, fig.align='center'------------
## ggplot(data = mpg) +
##   geom_point(mapping = aes(x = displ, y = hwy)) +
##   geom_smooth(mapping = aes(x = displ, y = hwy))

#' 
#' ---
#' 
#' ## Introducing global mapping
#' 

#' 
#' --
#' 

#' 
#' --
#' 

#' 
#' ---
#' 
#' ## Local mappings overwrite global mappings for that _that layer only_
#' 
## ----purl=TRUE, fig.width=5, fig.align='center'--------------------------
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_point(data = filter(mpg, class == "2seater"), colour = "red") 

#' 
#' ---
#' 
#' # [The Five-Named Graphs](http://moderndive.com/3-viz.html#FiveNG)
#' 
#' ## The 5NG of data viz
#' 
#' - Scatterplot: `geom_point()`
#' - Line graph: `geom_line()`
#' - Histogram: `geom_histogram()`
#' - Boxplot: `geom_boxplot()`
#' - Bar graph: `geom_bar()`
#' 
#' 
#' ---
#' 
#' class: center, middle
#' 
#' ## More examples
#' 
#' ---
#' 
#' ## Histogram
#' 
## ----fig.height=5.5, purl=TRUE-------------------------------------------
library(nycflights13)
ggplot(data = weather, mapping = aes(x = humid)) +
  geom_histogram(bins = 20, color = "black", fill = "darkorange")

#' 
#' ---
#' 
#' ## Boxplot (broken)
#' 
## ----fig.height=5.5, purl=TRUE-------------------------------------------
library(nycflights13)
ggplot(data = weather, mapping = aes(x = month, y = humid)) +
  geom_boxplot()

#' 
#' ---
#' 
#' 
#' ## Boxplot (fixed)
#' 
## ----fig.height=5.5, purl=TRUE-------------------------------------------
library(nycflights13)
ggplot(data = weather, mapping = aes(x = factor(month), y = humid)) +
  geom_boxplot()

#' 
#' ---
#' 
#' ## Bar graph
#' 
## ----fig.height=5.5, purl=TRUE-------------------------------------------
library(fivethirtyeight)
ggplot(data = bechdel, mapping = aes(x = clean_test)) +
  geom_bar()

#' 
#' ---
#' 
#' ## How about over time?
#' 
#' - One more variable to create with `dplyr`
#' 
## ---- purl=TRUE----------------------------------------------------------
library(dplyr)
year_bins <- c("'70-'74", "'75-'79", "'80-'84", "'85-'89",
               "'90-'94", "'95-'99", "'00-'04", "'05-'09",
               "'10-'13")
bechdel <- bechdel %>%
  mutate(five_year = cut(year, 
                         breaks = seq(1969, 2014, 5), 
                         labels = year_bins))

#' 
#' ---
#' 
#' ## How about over time? (Stacked)
#' 
## ----fig.width=11, fig.height=4.8, purl=TRUE-----------------------------
library(fivethirtyeight)
library(ggplot2)
ggplot(data = bechdel,
       mapping = aes(x = five_year, fill = clean_test)) +
  geom_bar() +
  scale_fill_brewer(type = "qual") # set colors

#' 
#' ---
#' 
#' ## How about over time? (Side-by-side)
#' 
## ----fig.width=11, fig.height=4.8, purl=TRUE-----------------------------
library(fivethirtyeight)
library(ggplot2)
ggplot(data = bechdel,
       mapping = aes(x = five_year, fill = clean_test)) +
  geom_bar(position = "dodge") +
  scale_fill_brewer(type = "qual")

#' 
#' ---
#' 
#' ## How about over time? (Stacked proportional)
#' 
## ----fig.width=11, fig.height=4.7, purl=TRUE-----------------------------
library(fivethirtyeight)
library(ggplot2)
ggplot(data = bechdel,
       mapping = aes(x = five_year, fill = clean_test)) +
  geom_bar(position = "fill", color = "black") +
  scale_fill_brewer(type = "qual")

#' 
#' ---
#' 
#' ## Practice
#' 
#' Produce appropriate graph with R package & data set in [ ], e.g., [`nycflights13::weather`] 
#' 
#' <!--
#' Try to look through the help documentation/Google to improve your plots
#' -->
#' 
#' 1. How does `age` predict `recline_rude`? <br> [`fivethirtyeight::flying`]
#' 
#' 2. Distribution of log base 10 scale of `budget_2013` <br> [`fivethirtyeight::bechdel`]
#' 
#' 3. How does `budget` predict `rating`? <br> [`ggplot2movies::movies`]
#' 
#' ---
#' 
#' ### HINTS
#' 

#' 
#' ---
#' 
#' class: center, middle
#' name: resources
#' 
#' ### Determining the appropriate plot
#' 
#' <a href="https://coggle.it/diagram/V_G2gzukTDoQ-aZt"><img src="figure/viz_mindmap.png" style="width: 385px;"/></a>
#' 
#' ---
#' 
#' ## Some good resources for data visualisation
#' 
#' - [FUNDAMENTALS OF DATA VISUALISATION](https://serialmentor.com/dataviz/)
#' Claus O. Wilke
#'     + https://serialmentor.com/dataviz/
#' - [awesome-python](https://github.com/vinta/awesome-python#data-visualization)
#'     + https://github.com/vinta/awesome-python#data-visualization
#' - [Flowing data](http://flowingdata.com/)
#'     + http://flowingdata.com/
#' - [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday)
#'     + https://github.com/rfordatascience/tidytuesday
#'     
#' ---
#' 
#' class: center, middle
#' 
#' ## Edward Tufte's book on data visualisation
#' 
#' <img src="img/Tufte_cover.jpg" style="width: 300; center" />
#' 
#' ---
#' 
#' # Review
#' 
#' - Write the code to produce this plot for 2007 data
#' 
## ----echo=FALSE, fig.height=5.5, fig.width=10, purl=TRUE-----------------
library(gapminder)
library(tidyverse)
gapminder_2007 <- gapminder %>% filter(year == 2007)
ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp, 
                     size = pop, color = continent)) +
  geom_point()

#' 
#' ---
#' 
## ----fig.height=5.5, fig.width=10, purl=TRUE-----------------------------
library(gapminder)
library(tidyverse)
gapminder_2007 <- gapminder %>% filter(year == 2007)
ggplot(data = gapminder_2007, 
       mapping = aes(x = gdpPercap, y = lifeExp, 
                     size = pop, color = continent)) +
  geom_point()

#' 
#' ---
#' 
#' layout: true
#' class: inversekj
#' 
#' .footer[[Return to Table of Contents](#toc)]
#' 
#' ---
#' 
#' layout: false
#' class: inverse, middle
#' 
#' .center.large[Thanks for attending!]
#' <br>
#' Contact me: 
#' - jonathan.leslie@pivigo.com
#' - https://twitter.com/jlesliedata
#' <br><br>
#' 
#' Special thanks to Chester Ismay 
#' - https://twitter.com/old_man_chester
#' - Slides' source code at <https://github.com/ismayc/talks/>
#' <br><br>
#' 
#' Slides created via the R package [xaringan](https://github.com/yihui/xaringan) by Yihui Xie
#' 
