main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  for (f in args){
    dat <- read.csv(f,header = FALSE)
    mean_per_patient <- apply(dat, 1, mean)
    cat(mean_per_patient,sep = "\n")
  }
}

main()