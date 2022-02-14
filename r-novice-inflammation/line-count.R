main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  filename <- args[1]
  if(length(filename)==0){
    countLines(file("stdin"))
  } 
  else if{
    countLines(filename)
  }
}

countLines <- function(f){
  lines <- readLines(f)
  count <- length(lines)
  cat("lines in standard input: ")
  cat(count,sep = "\n")
}