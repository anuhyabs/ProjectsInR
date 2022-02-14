main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  action <- args [1]
  filenames <- args[-1]
  stopifnot(action %in% c("--min","--max","--mean"))
  
  for ( f in filenames){
    process(f,action)
  }
}

process <- function(f,action){
  dat <- read.csv(f,header = FALSE)
  if(action == "--min"){
   values <- apply(dat, 1, min)
  }
  else if(action == "--max"){
   values <- apply(dat,1,max)
  }
  else if(action == "--mean"){
   values <- apply(dat,1,mean)
  }
  cat(values, sep = "\n")
}

main()