# STAT 100B Summer 2020
# Lab #1
# Wesley Chang


# access data set arbuthnot.R from the openintro website
# data has 82 observations on 3 variables
# baptism records of children born in London for every year from 1629 to 1710
source("http://www.openintro.org/stat/data/arbuthnot.R")

# view data
arbuthnot

# see dimensions of the data frame
# output: [1] 82 3, indicating there are 82 rows and 3 columns
dim(arbuthnot)

# get names for each column
# output: "year" "boys" "girls"
names(arbuthnot)

# access a single column of a data frame using a command like this:
arbuthnot$boys

## Exercise 1:
# what command would you use to extract just the counts of girls baptized?
arbuthnot$girls


# Notice that the way R has printed these data is different. 
# When we looked at the complete data frame, we saw 82 rows, one on each line of the display.
# These data are no longer structured in a table with other variables, so they are displayed 
# one right after another. Objects that print out in this way are called vectors;
# they represent a set of numbers. R has added numbers in [brackets] along the left side
# of the printout to indicate locations within the vector. For example, 5218 follows [1],
# indicating that 5218 is the first entry in the vector. And if [43] starts a line, then 
# that would mean the first number on that line would represent the 43rd entry in the vector.


## functions for making graphical plots
# plot of the number of girls baptized per year
plot(x = arbuthnot$year, y = arbuthnot$girls)

# same plot as above but connected with lines
plot(x= arbuthnot$year, y = arbuthnot$girls, type = "l")

# access documentation for "plot"
?plot


## arithmetic operations

# two integerts
5218 + 4683

# two columns
arbuthnot$boys + arbuthnot$girls

# store the sum of the two columns into another column in the original dataset
arbuthnot$total <- arbuthnot$boys + arbuthnot$girls
names(arbuthnot)
arbuthnot

# finiding the maximum and minimum total count
max(arbuthnot$total)
min(arbuthnot$total)

# plot of total number of baptisms per year
plot(arbuthnot$year, arbuthnot$total, type = "l")

# ratio
5218 / 4683

# ratio of complete vectors
arbuthnot$boys / arbuthnot$girls

# proportion of newborns that are boys
5218 / (5218+4683)

# compute for all year simultaneously
arbuthnot$boys / (arbuthnot$boys + arbuthnot$girls)


## Exercise 3
# make a plot of the proportion of boys over time
arbuthnot$proportionboys <- arbuthnot$boys / (arbuthnot$boys + arbuthnot$girls)

plot(x = arbuthnot$year, y = arbuthnot$boys, type = "l")


# comparison operators
arbuthnot$boys > arbuthnot$girls

# filtering data to see results from only specific years
# add column that holds the ratio of boys to girls for each year
arbuthnot$ratio <- arbuthnot$boys / arbuthnot$girls
# prepare the TRUE/FALSE filter for a ratio greater than 1.15
filter <- arbuthnot$ratio > 1.15
# apply filter to find the years with ratios greater than 1.15
arbuthnot$year[filter] # use [] here instead of ()
# we used [] brackets because we are treating the year column as a vector and
# retreivving some data from it

# another example
# getting the count of boys for the year 1664
arbuthnot$boys[arbuthnot$year == 1664]




#### ON YOUR OWN

# read from online source
source("http://www.openintro.org/stat/data/present.R")
# open data to explore
present

## Question 1
# What are the dimensions of the data frame?
dim(present)

# Answer
#  [1] 63 3
# There are 63 rows and 3 columns, starting with the first entry


## Question 2
# What are the variables or column names?
names(present)

# Answer
# "year" "boys" "girls"


## Question 3
# What years are included in the data set?
attach(present)
year
range(year)

# Answer
# the data set includes all years from 1940 to 2002, for a total of 63 years


## Question 4
# How do these counts compare to Arbuthnot's? Are they on a similar scale?


## Question 5
# Make a plot that displays the boy-to-girl ratio for every year in the data set.
# What do you see? Does Arbuthnot's observation about boys being born in greater 
# proportion than girls hold up in the US?


## Question 6
# In what year did we see the most total number of births in the US?
