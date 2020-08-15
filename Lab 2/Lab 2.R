# STAT 100B Summer 2020
# Lab #2
# Wesley Chang
# All the notes for Lab #2, miuns the exercises and do it yourself


# In this lab, we investigate the ways in which the statistics
# from a random sample of data can serve as point estimates for
# population parameters. We're interested in formuating a sampling
# distribution of our estimate in order to learn about the properties of
# the estimate, such as its distribution

# Setting a seed: we will take some random samples and build sampling
# distributions in this lab, which means you should set a seed on top of your
# lab. If this concept is new to you, search it online or ask your TA
require(stats)
set.seed(60)

# we consider real estate data from the city of Ames, Iowa. The details of every
# real estate transaction in Ames is recorded by the City Assessor's office.
# This collection represents our population of interest. In this lab we would like 
# to learn about these home sales by taking smaller samples from the full population. 
# Let’s load the data.

load(url("https://stat.duke.edu/~mc301/data/ames.RData"))


# We see that there are quite a few variables in the data set, enough to do a 
# very in-depth analysis. For this lab, we’ll restrict our attention to just 
# two of the variables: the above ground living area of the house in 
# square feet (area) and the sale price (price).

# We can explore the distribution of areas of homes in the population of 
# home sales visually and with summary statistics. 
# Let’s first create a visualization, a histogram:

area <- ames$area
hist(area, breaks = 100)


# Let’s also obtain some summary statistics. Note that we can do this using the 
# summarise function. We can calculate as many statistics as we want using this 
# function, and just string along the results. Some of the functions below should 
# be self explanatory (like mean, median, sd, IQR, min, and max). 
# A new function here is the quantile function which we can use to calculate 
# values corresponding to specific percentile cutoffs in the distribution. 
# For example quantile(x, 0.25) will yield the cutoff value for 
# the 25th percentile (Q1) in the distribution of x. 
# Finding these values are useful for describing the distribution, 
# as we can use them for descriptions like “the middle 50% of the homes 
# have areas between such and such square feet”.

summary(area)


## The unknown sampling distribution
# In this lab we have access to the entire population, but this is rarely the case 
# in real life. Gathering information on an entire population is often extremely 
# costly or impossible. 
# Because of this, we often take a sample of the population and use that to 
# understand the properties of the population.

# If we were interested in estimating the mean living area in Ames based 
# on a sample, we can use the following command to survey the population.

samp1 <- sample(area, 50)
samp1


# Not surprisingly, every time we take another random sample, we get a different 
# sample mean. It’s useful to get a sense of just how much variability we 
# should expect when estimating the population mean this way. The distribution 
# of sample means, called the sampling distribution, can help us understand 
# this variability. In this lab, because we have access to the population, 
# we can build up the sampling distribution for the sample mean by repeating 
# the above steps many times. Here we will generate 2000 samples and compute 
# the sample mean of each. Note that we are sampling with replacement, 
# replace = TRUE since sampling distributions are constructed with sampling 
# with replacement.

# build an empty vector to hold sample means
num_samples <- 2000
sample_means50 <- rep(0, num_samples)

# generate 2000 samples of size 50
# calculate sample means and store them in vector sample_mean50
for (i in 1:num_samples){
  temp_samp <- sample(area, 50)
  sample_means50[i] <- mean(temp_samp)
}
# visualize the sampling distribution
hist(sample_means50, breaks = 20)


## Interlude: The for loop
sample_means50 <- rep(0, 2000)

# generate the first sample
temp_samp <- sample(area, 50)
sample_means50[1] <- mean(temp_samp)

# generate the second sample
temp_samp <- sample(area, 50)
sample_means50[2] <- mean(temp_samp)

# generate the third sample
temp_samp <- sample(area, 50)
sample_means50[3] <- mean(temp_samp)
###
#...
# until you generate 2000 samples

# With the for loop, these thousands of lines of code are compressed 
# into one short chunck:

sample_means50 <- rep(0, 2000)
for (i in 1:num_samples){
  temp_samp <- sample(area, 50)
  sample_means50[i] <- mean(temp_samp)
}