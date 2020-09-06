directory <- "C:/Users/neeld/OneDrive/Desktop/datasciencecoursera/R Programming/Week4/ProgrammingAssignment3/rprog_data_ProgAssignment3-data"
setwd(directory)

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
nrow(outcome)
ncol(outcome)
names(outcome)

outcome[, 11] <- as.numeric((outcome[, 11]))
hist(outcome[, 11], xlab = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")





