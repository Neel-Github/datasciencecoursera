corr <- function(directory, threshold = 0){
  directory<- ("C:/Users/neeld/OneDrive/Desktop/Specdata/")
  mylist <- list.files(path=directory, pattern=".csv", full.names = T)
  df <- complete(directory)
  ids <- df[df["nobs"] > threshold, ]$id
  corrr <- numeric()
  for(i in ids){
    mydata <- read.csv(mylist[i])
    dff <- mydata[complete.cases(mydata), ]
    corrr <- c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}
