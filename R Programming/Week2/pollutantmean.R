
pollutantmean <- function(directory, pollutant, id=1:332){
  directory<- ("C:/Users/neeld/OneDrive/Desktop/datasciencecoursera/R Programming/Week2/Specdata")
  mylist <- list.files(path=directory, pattern=".csv")
  x <- numeric()
  for(i in id){
    mydata <- read.csv(mylist[i], header = TRUE,sep = ",")
    x <- c(x, mydata[[pollutant]])
    
    
  }
  
  mean(x, na.rm=TRUE)
}

