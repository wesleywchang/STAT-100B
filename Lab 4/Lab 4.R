# STAT 100B Lab 4
# ANOVA

# InsectSprays data in R gives the counts of insects in agricultural 
# experimental units treated with six different insecticides
# we can use this data to examine the relative effectiveness of the different insecticides
# if the insecticide is effective, we would expect to see relatively few insects on the
# corresponding experimental unit

# load data
data(InsectSprays)
?InsectSprays

# consider summaries of the data
summary(InsectSprays)
dim(InsectSprays)
hist(InsectSprays$count)

# generate side-by-side boxplots of the data
# allows us to visualize the interaction between variables
boxplot(InsectSprays$count ~ InsectSprays$spray)

# examine whether the conditions of ANOVA are satisfied
hist(InsectSprays$count[InsectSprays$spray == "A"], breaks=6,
     main = "Histogram of Count for Spray A", xlab="count")

# check for normality using shapiro-wilk test
shapiro.test(InsectSprays$count[InsectSprays$spray == "F"])
