main <- function(){
  args <- commandArgs(trailingOnly = TRUE)
  first_file <- read.csv(args[1],header = FALSE)
  first_dim <- dim(first_file)
  first_row <- first_dim[1]
  first_col <- first_dim[2]
  
  for(f in args[-1]){
    new_file <- read.csv(f,header = FALSE)
    new_dim <- dim(new_file)
    if(new_dim[1] != first_row || new_dim[2] != first_col){
      cat("Dimensions not same")
    }
  }
}
main()