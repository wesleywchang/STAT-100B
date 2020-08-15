## Lab 3 R code

# set working directory
setwd("/Users/wes_chang/Library/Mobile Documents/com~apple~CloudDocs/Summer 2020/STAT 100B (Session B)/Labs/Lab 3")


download.file("http://www.openintro.org/stat/data/ames.RData", destfile = "ames.RData")
load("ames.RData")

population <- ames$Gr.Liv.Area
samp <- sample(population, 60)


# Confidence intervals
sample_mean <- mean(samp)


# we can calculate a 95% CI by adding and subtracting the cv times the se to the point estimate
# qnorm to find the lower tail percentile from the standard normal dist

se <- sd(samp)/sqrt(60)
cv <- -qnorm(0.05/2)
lower <- sample_mean - cv*se
upper <- sample_mean + cv*se
c(lower,upper)


# what does 95% confidence mean?
# find true population mean given population data
pop_mean <- mean(population)
print(pop_mean)


## create many samples to learn how sample means and CIs vary from one sample to another, using loops
# outline:
#   obtain random sample
#   calculate and store the sample's mean and std dev
#   repeat steps 1 and 2 50 times
#   use stored statistics to calculate many confidence intervals


# first, create empty vectors where we can save the means and standard deviations
# that will be calculated from each sample
# also, store desired sample size as n

samp_mean <- rep(NA, 50)
samp_sd <- rep(NA, 50)
n <- 60

# for loop to calculate means and std dev of 50 random samples
num_ci <- 50
for(i in 1:num_ci){
  samp <- sample(population, n) # obtain sample of size n = 60 from population
  samp_mean[i] <- mean(samp)    # save sample mean in ith element of sample_mean
  samp_sd[i] <- sd(samp)     # save sample sd in ith element of samp_sd
}

# lastly, construct confidence intervals
cv <- -qnorm(0.05/2)
lower_vector <- samp_mean - cv*samp_sd/sqrt(n)
upper_vector <- samp_mean + cv*samp_sd/sqrt(n)

# view first interval
c(lower_vector[1], upper_vector[1])


## using the following function, plot all intervals
plot_ci(lower_vector,upper_vector,mean(population))

# use following code to check what proportion of the CIs capture the true mean
sum((lower_vector <= pop_mean) & (upper_vector >= pop_mean)) / num_ci
