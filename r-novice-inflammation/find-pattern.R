main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  filenames = list.files(pattern = args[1])
  cat(filenames,sep = "\n")
}

main()
