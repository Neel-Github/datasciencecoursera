if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile ="./data/camera.csv", method = "curl" )
cameraData <- read.csv("./data/camera.csv")
names(cameraData)
tolower(names(cameraData))
splitnames <- strsplit(names(cameraData), "\\.")
splitnames[[5]]
splitnames[[6]]
mylist <- list(letters = c("A", "B", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)
mylist[1]
mylist$letters
mylist[[1]]
splitnames[[6]][[1]]
firstelement <- function(x){x[1]}
sapply(splitnames, firstelement)
fileUrl1 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileUrl2 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
download.file(fileUrl1, destfile = "./data/reviews.csv", method = "curl")
download.file(fileUrl2, destfile = "./data/solution.csv", method = "curl")
reviews <- read.csv("./data/reviews.csv") 
solution <- read.csv("./data/solution.csv")
head(reviews, 2)
head(solution,2)
names(reviews)
sub("_", "", names(reviews), )
testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))
cameraData <- cameraData[!grepl("Alameda", cameraData$intersection), ]
cameraData
library(stringr)
nchar("Neel Deshmukh")
substr("Neel Deshmukh", 1, 7)
paste("Neel", 'Deshmukh', sep = " ")
paste0("Neel", 'Deshmukh') 
str_trim("Neel        ")


######Dates#######
d1 <- date()
d1
class(d1)
d2 <- Sys.Date()
d2
class(d2)
format(d2, "%a %b %d")
julian(d2)
# ??? %d = day as number (0-31)
# ??? %a = abbreviated weekday
# ??? %A = unabbreviated weekday
# ??? %m = month (00-12
# ??? %b = abbreviated month
# ??? %B = unabbreviated month
# ??? %y = 2 digit year
# ??? %Y = 4 digit year

as.Date("1Jan1960", "%d%b%Y") # = converts character vector/variable into Date format by using the codes above
 
library(lubridate)
ymd("20200905")              
ymd("87651231")
mdy()
dmy()
ymd_hms("20200905 11:21:23")
ymd_hms("20200905 11:21:23", tz = "Pacific/Auckland")
?Sys.timezone
x <- dmy("1Jan1960")
wday(x[1])    #weekday
wday(x[1], label = TRUE)



# #####################################################################################################################
# quantmod package #= get historical stock prices for publicly traded companies on NASDAQ or NYSE
install.packages("quantmod")
