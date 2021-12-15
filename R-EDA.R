#########################################
# 15th Dec, 2021 - esrb data / iris
# Load data
#########################################

# method 1 
library(datasets)  #load built-in datasets
data(iris)


# method 2 - use URL to read in data
# install package RCurl
# install.packages("RCurl") if the package haven't been installed
library(RCurl)
urlfile <- "https://raw.githubusercontent.com/dataprofessor/data/master/iris.csv"
iris2 <- read.csv(urlfile)

# in programming generally \ single backslash is an escape character
# such as \n means new line
# hence need to have double backslash \\ in the directory path
# in order for R to read in as what we expect it to
# however, only single forwardslash / is needed as / is not an escape character
datapath <- "C:\\Users\\siewm\\OneDrive\\Desktop\\DNN practice\\data\\Video_games_esrb_rating.csv"
esrb <- read.csv(datapath)

# in this exercise, will use esrb data (inline with previous python code for the same data)

#########################################
# descriptive statistics
#########################################

# head() / tail()
# show the first/last 5 rows
head(esrb, 5)
tail(esrb, 5)

# summary()
summary(esrb)

# summary() for specific variable
summary(esrb$alcohol_reference)

# check if the data has any missing values
sum(is.na(esrb))

# to get more details on the data summary use skimr()
# additional info such as
# no. of rows & columns
# column type frequency
# missing value if there is
# histogram, std dev for every numeric columns

# install skimr() if machine don't have it yet
# install.packages("skimr")
library(skimr)

skim(esrb)

# group by certain variable says console
esrb %>%
  dplyr::group_by(console) %>%
  skim()



###########################
# simple plot
###########################

library(ggplot2)

# basic bar chart
# + sign means want R to keep reading the code
# use geom_bar() for geometric object
ggplot(esrb, aes(x = esrb_rating)) + geom_bar()




