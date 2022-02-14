main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  filename <- args[1]
  dat <- read.csv(filename,header = FALSE)
  mean_per_patient <- apply(dat,1,mean)
  cat(mean_per_patient,sep = "\n")
}

main()