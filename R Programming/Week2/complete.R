complete <- function(directory, id =1:332){
  directory<- ("C:/Users/neeld/OneDrive/Desktop/Specdata/")
  mylist <- list.files(path = directory, pattern = ".csv",full.names = TRUE)
  nobs <- numeric()
  
  for (i in id) {
    mydata <- read.csv(mylist[i], header = T, sep = ",") 
    mysum <- sum(complete.cases(mydata)) 
    nobs <- c(nobs, mysum)
  }
   data.frame(id, nobs) 
    
}