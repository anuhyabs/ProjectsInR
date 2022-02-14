dat <- read.csv(file = "data/inflammation-01.csv",header = FALSE)
#read.csv(file = "data/commadec.txt", header = TRUE, sep = ";",dec = ",")
#read.csv2(file = "data/commadec.txt")
head(dat) # prints the columns names along with the first five items in each column
class(dat) # prints data type of variable
dim(dat) # prints the size of the variable
dat[1,1] # prints a specific value present on the 1st row of the 1st column
dat[30,20]
dat[c(1,3,5),c(10,20)]# prints 1st, 3rd and 5th row of 10th and 20th columns
dat[1:4,1:10]
dat[5:10,1]
dat[5:10,1:10]
dat[5,] # prints row 5
dat[,16:18] # prints columns 16-18
dat[,] #prints the entire data frame
dat$V16 # prints column V16
dat[,"V16"] # prints coulumn V16
patient_1 <- dat[1,]
max(patient_1) # prints max inflammation for patient 1
max(dat[2,]) # prints max infalmmation for patient 2
min(dat[,7]) # prints min inflammation on day 7
mean(dat[,7]) # prints mean inflammation on day 7
median(dat[,7]) # prints median inflammation on day 7
sd(dat[,7]) # prints standard deviation of inflammation on day 7

# Note that R may return an error when you attempt to perform similar
# calculations on subsetted rows of data frames. This is because some 
# functions in R automatically convert the object type to a numeric
# vector, while others do not (e.g. max(dat[1, ]) works as expected, 
# while mean(dat[1, ]) returns NA and a warning). You get the expected
# output by including an explicit call to as.numeric(), 
# e.g. mean(as.numeric(dat[1, ])). By contrast, calculations on 
# subsetted columns always work as expected, since columns of 
# data frames are already defined as vectors.

#shortcut for commenting lines: Ctrl+shift+c

summary(dat[,1:4]) #summarize function

#apply allows us to repeat a function on all of the rows (MARGIN = 1) or columns (MARGIN = 2) of a data frame.
avg_patient_inflammation <- apply(dat,1,mean)
avg_day_inflammation <- apply(dat,2,mean)

#another alternative to get mean of rows and cols in rowMeans func and colMeans func

max(dat[5,3:7]) #  determine the maximum inflammation for patient 5 across days three to seven

# Using the inflammation data frame dat from above: Let’s pretend there was something wrong with 
# the instrument on the first five days for every second patient 
# (#2, 4, 6, etc.), which resulted in the measurements being twice 
# as large as they should be.
#   
#  1. Write a vector containing each affected patient (hint: ?seq)
#  2. Create a new data frame in which you halve the first five days’ values in only those patients
#  3. Print out the corrected data frame to check that your code has fixed the problem
affected_patient <- seq(2,60,2)
new_dat <- dat[affected_patient,1:5]
new_dat <- new_dat / 2
new_dat
dim(new_dat)

# Challenge: the apply function can be used to summarize datasets and subsets
# of data across rows and columns using the MARGIN argument. Suppose you want 
# to calculate the mean inflammation for specific days and patients in the 
# patient dataset (i.e. 60 patients across 40 days).
# 
# Please use a combination of the apply function and indexing to:
#   
# 1. calculate the mean inflammation for patients 1 to 5 over the whole 40 days
# 2. calculate the mean inflammation for days 1 to 10 (across all patients).
# 3. calculate the mean inflammation for every second day (across all patients).
ans1 <- apply(dat[1:5,],1,mean)
ans2 <- apply(dat[,1:10],2,mean)
ans3 <- apply(dat[,seq(2,40,2)],2,mean)
ans3

plot(avg_day_inflammation)
max_day_inflammation <- apply(dat,2, max)
plot(max_day_inflammation)
min_day_inflammation <- apply(dat,2,min)
plot(min_day_inflammation)

#Create a plot showing the standard deviation of the inflammation data for each
#day across all patients.
std_day_inflammation <- apply(dat,2,sd)
plot(std_day_inflammation)
