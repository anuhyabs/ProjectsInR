#Creating functions

fahrenheit_to_celsius <- function(temp_F){
  temp_C <- (temp_F-32)*5/9
  return(temp_C)
}

#In R, it is not necessary to include the return statement. R automatically 
#returns whichever variable is on the last line of the body of the function.

fahrenheit_to_celsius(32)
fahrenheit_to_celsius(212) #boiling point of water

celsius_to_kelvin <- function(temp_C){
  temp_K <- temp_C + 273.15
  return(temp_K)
}

celsius_to_kelvin(0)

fahrenheit_to_kelvin <- function(temp_F){
  temp_C <- fahrenheit_to_celsius(temp_F)
  temp_K <- celsius_to_kelvin(temp_C)
  return(temp_K)
}

fahrenheit_to_kelvin(32.0)

celsius_to_kelvin(fahrenheit_to_celsius(32.0)) #nesting function call

# In the last lesson, we learned to combine elements into a vector using
# the c function, e.g. x <- c("A", "B", "C") creates a vector x with three 
# elements. Furthermore, we can extend that vector again using c,
# e.g. y <- c(x, "D") creates a vector y with four elements. Write a function
# called highlight that takes two vectors as arguments, called content and 
# wrapper, and returns a new vector that has the wrapper vector at the beginning
# and end of the content:
highlight <- function(content,wrapper){
  new_line <- c(wrapper,content,wrapper)
  return(new_line)
}

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***" 
highlight(best_practice, asterisk)

# If the variable v refers to a vector, then v[1] is the vector’s first element 
# and v[length(v)] is its last (the function length returns the number of elements
# in a vector). Write a function called edges that returns a vector made up of 
# just the first and last elements of its input:

edges <- function(v){
  new_v <- c(v[1],v[length(v)])
  return(new_v)
}

dry_principle <- c("Don't", "repeat", "yourself", "or", "others")
edges(dry_principle)

center <- function(data,midpoint){
  # return a new vector containing the original data centered around the
  # midpoint.
  # Example: center(c(1, 2, 3), 0) => c(-1, 0, 1)
  new_data <- (data - mean(data,na.rm = TRUE)) + midpoint
  return(new_data)
}

z<- c(0,0,0,0)
center(z,3)

dat<- read.csv("data/inflammation-01.csv", header = FALSE)
cenetered <- center(dat[,4],0)
head(cenetered)
mean(dat[,4])
mean(cenetered)
sd(dat[,4])
sd(cenetered)
sd(dat[,4])-sd(cenetered)
all.equal(sd(dat[,4]),sd(cenetered))

dataNA <- dat
dataNA[10,4] <- NA
center(dataNA[,4],0)
dataNA[,1] <- as.factor(dataNA[,1])
dataNA[,2] <- as.factor(dataNA[,2])
center(dataNA[,1],0)
center(dataNA[,2],0)

# Write a function called analyze that takes a filename as an argument and 
# displays the three graphs produced in the previous lesson (average, min and max
# inflammation over time). analyze("data/inflammation-01.csv") should produce the 
# graphs already shown, while analyze("data/inflammation-02.csv") should produce 
# corresponding graphs for the second data set. Be sure to document your function 
# with comments.
analyze <- function(fileName){
  plotData <- read.csv(fileName,header = FALSE)
  max_plot <- apply(plotData,2,max)
  plot(max_plot)
  min_plot <- apply(plotData,2,min)
  plot(min_plot)
  mean_plot <- apply(plotData,2,mean)
  plot(mean_plot)
}

analyze("data/inflammation-01.csv")
analyze("data/inflammation-02.csv")

# Write a function rescale that takes a vector as input and returns a 
# corresponding vector of values scaled to lie in the range 0 to 1. (If L and H 
# are the lowest and highest values in the original vector, then the replacement 
# for a value v should be (v-L) / (H-L).) Be sure to document your function with
# comments.
rescale <- function(v){
  L <- min(v)
  H <- max(v)
  ans <- (v-L)/(H-L)
  return(ans)
}

plot(rescale(dat[,4]))

rescale <- function(v,lower = 0,upper = 1){
  L <- min(v)
  H <- max(v)
  ans <- (v-L)/(H-L)*(upper-lower)+lower
  return(ans)
}

rescale(dat[,4])
v = c(1,2,3,4)
L <- min(v)
v-L
 