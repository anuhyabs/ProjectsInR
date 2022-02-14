analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}
analyze("data/inflammation-01.csv")
analyze("data/inflammation-02.csv")

best_practice <- c("Let","the","computer","do","the","work")
print_words <- function(sentence){
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}
print_words(best_practice)
best_practice[-6]
print_words(best_practice[-6])

print_words_new <- function(sentence){
  for (word in sentence){
    print(word)
  }
}
print_words_new(best_practice)
print_words_new(best_practice[-6])

len <- 0
vowels <- c("a","e","i","o","u")
for(v in vowels){
  len <- len + 1
}
len

letter <- "z"
for(letter in c("a","b","c")){
  print(letter)
}

length(vowels)
seq(3)

# R has a built-in function called seq that creates a list of numbers.
# Using seq, write a function that prints the first N natural numbers, one per line
print_N <- function(num){
  for(i in seq(num)){
    print(i)
  }
}
print_N(3)

# Write a function called total that calculates the sum of the values in a vector.
# (R has a built-in function called sum that does this for you. Please don’t use
# it for this exercise.)
total <- function(numToAdd){
  sumOfNos <- 0
  for(i in numToAdd){
    sumOfNos = sumOfNos + i;
  }
  return(sumOfNos)
}
ex_vec <- c(4, 8, 15, 16, 23, 42)
total(ex_vec)

expo <- function(base,exp){
  ans <- 1
  for(i in seq(exp)){
    ans <- ans * base
  }
  return(ans)
}
expo(2,4)

list.files(path = "data",pattern = "csv")
list.files(path = "data",pattern = "inflammation")
list.files(path = "data",pattern = "inflammation",full.names = TRUE)
filenames <- list.files(path = "data",pattern = "inflammation-[0-9]{2}.csv",
                        full.names = TRUE)
filenames <- filenames[1:3]
for(file in filenames){
  print(file)
  analyze(file)
}

# Write a function called analyze_all that takes a folder path and a filename
# pattern as its arguments and runs analyze for each file whose name matches the 
# pattern.
analyze_all <- function(path,pattern){
  all_files <- list.files(path,pattern,full.names = TRUE)
  for (f in all_files){
    analyze(f)
  }
}
analyze_all("data","inflammation-[0-4]{2}.csv")
