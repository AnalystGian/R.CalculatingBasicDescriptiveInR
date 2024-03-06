
###########################################################
###########################################################

## Calculating Basic Descriptive Statistics in R

###########################################################
###########################################################

# To accurately grasp statistics from a more holistic point of view,
# every statistics student should be aware of the various fields of
# statistics. Sometimes the type of work one does obscures the other
# side of statistics, but to truly understand the significance and
# elegance of statistical analysis, one must be aware of and possess
# a general understanding of it. Indeed, statistics is a beautiful
# thing. Descriptive statistics and inferential statistics are the
# two primary sub fields of statistics. For statistics students, both
# of these are equally significant and are used in scientific data
# analysis.

# Descriptive statistics: what are they? The presentation and gathering
# of data are the subjects of descriptive statistics. Typically, a
# statistical analysis begins with this. Usually, it's not as easy as
# it seems. Furthermore, the statistician must understand how to design
# experiments, select the best focus groups, and steer clear of biases
# that are so simple to introduce into experiments. Descriptive
# statistics, then, deal with the description, display, and gathering
# of data.

# Inferential statistics: what about them? As the name implies, inferential
# statistics is the process of making appropriate inferences from
# statistical analysis carried out with descriptive statistics. Ultimately,
# investigations are significant because of the conclusions drawn from them,
# and inferential statistics addresses this topic.


###########################################################
## Task One: Getting Started
## In this task, you will learn set and check your current
## working directory
###########################################################

## Set and get the working directory

setwd(dir = "C:\Users\gianc\OneDrive\Desktop\DATA ANALYSIS\PROJECTS\R\CALCULATING BASIC DESCRIPTIVE STATISTICS IN R")

## Get the working directory
getwd()


###########################################################
## Task Two: Import data set and explore
## In this task, we will import two data sets and explore them
###########################################################

## 2.1: Import the msleep.csv and mpg.csv data sets
df <- read.csv(file = "msleep.csv")
df1 <- read.csv(file = "mpg.csv")

## 2.2: View and check the dimension of the data sets
View(df)
dim(df)
View(df1)
dim(df1)

## 2.3: Take a peek at df using the head and tail functions
head(df)
tail(df)

## 2.4: Check the internal structure of the data frame
str(df)


## 2.5: Count missing values in the variables
sum(is.na(df))

# To check the missing value per column:
sapply(df, function(x) sum(is.na(x)))

## 2.6: Check the column names for the df data frame
names(df)
colnames(df)

###########################################################
## Task Three: Frequency of categorical variables
## In this task, we will learn how to count the frequency 
## and percentage of a categorical variable
###########################################################

## Let us view the df data frame

View(df)

dim(df)

## 3.1: Drop the first two columns of df
df <- df[, -c(1,2)]

dim(df)

# 3.2: Get the frequency of a categorical variable

str(df)

## Get the frequency of the feature "order"
table(df$order)

## 3.3: Calculate the percentage from the frequency
total <- length(df$order)

percent <- (table(df$order)/total) * 100
percent
## Round to 2 decimal places
percent_r <- round(percent, 2)
percent_r


###########################################################
## Task Four: Univariate statistics for univariate variables - Part I
## In this task, we will perform different descriptive statistics
## for a quantitative variable
###########################################################

### Univariate statistics for univariate variables

## 4.1: Calculate the mean of total sleep time variable
mean(df$Total.Sleep.Time)

## 4.2: Calculate the median of total sleep time variable
median(df$Total.Sleep.Time)

## 4.3: Assign a single variable to a new variable
sleeptime <- df$Total.Sleep.Time

## 4.4: Calculate the mode of total sleep time
which.max(sleeptime)

table(sleeptime)

which.max(table(sleeptime))
#### The spread of a quantitative variable

## 4.5: Get the minimum value for total sleep time
min(sleeptime)

## 4.6: Get the maximum value for total sleep time
max(sleeptime)

## 4.7: Get the range for total sleep time
range(sleeptime)

## 4.8: Get the range difference for total sleep time
diff(range(sleeptime))

## 4.9: Sort the total sleep time variable
sort(sleeptime)

## In descending order
sort(sleeptime, decreasing = TRUE)

###########################################################
## Task Five: Univariate statistics for univariate variables - Part II
## In this task, we will continue to perform different 
## descriptive statistics for a quantitative variable
###########################################################

## 5.1: Calculate the quartile of the total sleep time variable

## Returns all the quartiles
quantile(sleeptime)

## Return the 1st, 2nd and 3rd quartiles
quantile(sleeptime, c(0.25, 0.5, 0.75))

## Return the 90th percentile
quantile(sleeptime, 0.9)

## 5.2: Calculate the inter-quartile range 
IQR(sleeptime)

## 5.3: Calculate the variance
var(sleeptime)

# How far a set of numbers deviates from the mean or average value
# is measured by the variance. Due to its ability to quantify
# variation from a single central tendency, such as the mean, the
# variance is possibly the most widely used measure of dispersion
# or spread. Thus, for example, the variance of each number from
# the average.

## 5.4: Calculate the standard deviation
sqrt(var(sleeptime))
sd(sleeptime)

# The variance's square root is the standard deviation. The standard
# deviation is mostly used in statistics to quantify how much a set
# of values varies or is dispersed. Therefore, a low standard deviation
# suggests that the values are dispersed throughout a larger range,
# whereas a high standard deviation suggests that the values tend to be
# near the set mean.

## 5.5: Get the five number summary 
fivenum(sleeptime)

#A collection of descriptive statistics that offers details about a
# dataset is called the "five number summary." In the summary, there are
# five values. The minimum and maximum values are the most extreme values.
# Next come the median, followed by the upper and lower quartiles.
# John W. Tukey introduced this five-number summary circa 1970.

## 5.6: Summarize the total sleep time variable
summary(sleeptime)

###########################################################
## Task Six: Distribution of Quantitative variable
## In this task, we will learn how to check the distribution
## of a quantitative variable
###########################################################

### Analyze the spread of the quantitative variable

## 6.1: Install the e1071 package
install.packages("e1071")

## 6.2: Importing a library
library(e1071)

## 6.3: Calculate the skewness of the total sleep time variable
skewness(sleeptime)

# The skewness is 0.05. That looks to be close to the normal distribution.

# Skewness is simply a measure of symmetry. How symmetric the particular
# numeric variable is. More precisely, we look at the data set if it is
# symmetric. Skewness for a normal distribution, which is desired is zero.
# So, if we check the skewness of this particular sleep time, and it gives
# us zero. Then, we can say that it is symmetric or it is normally distributed.
# However, a negative value for skewness indicates that the data is skewed to
# the left. And positive value indicates that the data is skewed to the right.
# Skewed to the left means that the left tail is long relative to the right
# tail. And similarly skewed right means that the right tail is long relative
# to the left tail. If data is multi-modal, that is it has two most reocurring
# value, then this may affect the sign of the skewness.

## 6.4: Calculate the kurtosis of the total sleep time variable
kurtosis(sleeptime)

# Now, the kurtosis is negative. That means that there are no much outliers.
# It makes sense again that there are no much outliers. Another way we can do
# this, is to plot a density plot to see how the distribution is spread out.

# Kurtosis is a measure of whether data are highly or heavily tailed, or light
# tailed relative to the normal distribution. This is to check the spread. How
# distributed– is it normally distributed. How heavy are the tails? Is it skewed?
# That is datasets with high kurtosis, tends to have heavy tails, that is outliers.
# Then data with low kurtosis tend to have light tails and lack of outliers. One
# particular graphical method we can use is histogram. The histogram is an effective
# graphical technique for showing both the skewness and kurtosis of a data set. We
# will consider using histogram in this particular task.

## 6.5: Plot the density of the total sleep time variable
plot(density(sleeptime))

# It seems to be normally distributed and the tails are light. No wonder that the
# kurtosis gave us a negative value. Next is, we want to plot an histogram, and
# let us see how it looks.

## 6.6: Plot an histogram of the total sleep time variable
hist(sleeptime)

# A histogram is simply a graphical display of data using bins of different height.
# In a histogram, each bar groups numbers into ranges. So, a histogram displays the
# shape and the spread of continuous sample data. It was first introduced by Karl
# Pearson, who was an English mathematician and Biostatistician. He has been credited
# with establishing the discipline of mathematical statistics.

## 6.7: Plot the histogram using proportions or probabilities
hist(sleeptime, probability = TRUE)

## Give the histogram a title
hist(sleeptime, probability = TRUE,
     col = grey(0.9),
     main = "Histogram of Total Sleep Time",
     xlab = "Total Sleep Time")

## Add a density line on the histogram
lines(density(sleeptime), col = "red", lw = 3)               # superimpose a normal curve


###########################################################
## Task Seven: Bivariate statistics for variables
## In this task, we will learn how to perform bivariate
## statistics for both qualitative and quantitative variables
###########################################################

# In statistics, bivariate data is data on each of two variables where each
# value of one of the variables is paired with the value of another variable.
# Typically, it would be of interest to investigate the possible relationship
# or association between these two variables.

## 7.1: Bivariate statistics for two qualitative variables

View(df1)    ## View the data set

table(df1$class,df1$drv)

# So, f here means forward, uh, front wheel, r here means rear wheel, and 4
# here means 4ward. So, you can see that for the 2 seater, they had five that
# were– that had rear wheels, alright? So, we can see how to compare two
# categorical variables to check their frequency.

### Bivariate statistics for two quantitative variables

# What if we have two quantitative variables? What do we use to get their
# descriptive statistics? We use two common statistics. And that is the
# covariance and the correlation. The covariance is simply a measure of the
# directional relationship between two variables. A positive covariance means
# that the variables move together in the same direction. A negative covariance
# means that they move inversely in in different directions. For correlation in
# statistics, this is usually used to check relationship or association whether
# it is causal or not, between two random variables. In simple terms, these two
# measures the relationship and dependency between two variables, but covariance
# only measures, or indicates the direction of the linear relationship. While
# the correlation handles both the strength and the direction of the linear
# relationship. And a correlation always spans from minus one to plus one.
# Basically, the correlation is a function of the covariance.

## 7.2: Calculate covariances
cov(df$Total.Sleep.Time, df$sleep_rem)

# This gives a positive covariance. So, this means that these two particular
# variables, move in the same direction. So, their measure goes in the same
# direction. Let us see two other quantitative variables or numerical variables.

cov(df$awake, df$brainwt)

# This gives also a positive covariance. So this makes complete sense.

## 7.3: Calculate correlation coefficients
cor(df$Total.Sleep.Time, df$sleep_rem)

# And now, this says 0.65. In this case, I can say, 65%. So this tells me that
# there is a relationship between the total sleep and this sleep rem and that
# it is kind of strong. It’s in a positive direction. Now, the 65% does not just
# tell me the direction with they move but the strength of this relationship.
# Positive relationship.

cor(df$awake, df$brainwt)

# This is 0.29. Although, there seems to be a positive correlation between awake
# and brainwt, however, the relationship is not so strong and this is 0.29 as
# compared to 0.65. I think this makes complete sense. So, covariance measures
# the direction of the relationship, correlation measures both direction and
# the strength of the relationship.

### Bivariate statistics for both a quantitative and qualitative variable

# Okay, lastly, we want to check how to check a bivariate statistics for both a
# quantitative and a qualitative variable. So, remember that the the sleeptime
# is quantitative, now we want tocheck that for the different orders. Remember,
# we looked at order earlier, in task two. We want to see the mean total sleep
# time for each of the different order of this mammal. We know a mammal has
# order, class and the rest of them. So, we want to see for the different
# orders– we want to see the mean sleep time.

## 7.4: Calculate the mean total sleep time for different orders
tapply(df$Total.Sleep.Time, df$order, mean)

# Now we see how we can check bivariate– bivariate means two variables between
# a qualitative and a quantitative variable.

# Okay, these names are so serious to pronounce. Say rodentia for example, the
# mean sleeptime is 12.46. So, what this does is, it goes through the data set
# and checks for each of the order, get their different sleep times, and
# calculates the mean. So for primates- 10.5, for carnivora 10.11, and the rest
# of it like that. So this really makes sense that we can check the relationship
# between not just two quantitative or two qualitative, but between a
# quantitative and a qualitative variable.

## 7.5: Calculate the summary of all variables in the df data frame
summary(df)

# Now, I can see that for order it counts since order is a categorical variable.
# For those that are numeric variables (sleep_rem), it tells you the min, the
# first quartile, the median, the mean, the third quartile, the maximum. You
# can see for the numeric variable, it returns like the five numsum– the five
# number summary that we looked at, including the mean and then for the other
# ones, it just gives a kind of frequency of what we have.
