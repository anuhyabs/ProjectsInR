main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  num1 <- as.numeric(args[1])
  num2 <- as.numeric(args[3])
  sum <- 0
  if(args[2]=="+")
  {
    sum <- num1 + num2
  }
  else if(args[2]=="-")
  {
    sum <- num1 - num2
  }
  else
  {
    sum <- "Invalid"
  }
  cat(sum,sep = "\n")
}

main()