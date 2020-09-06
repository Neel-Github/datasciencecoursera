##Subsetting & Sorting
set.seed(12345)
X <- data.frame("var1"=sample(1:5), "var2"= sample(6:10), "var3"=sample(11:15))
X <- X[sample(1:5), ]; X$var2[c(1,3)] = NA
X
X[,1]
X[,"var1"]
X[1:2,"var1"]
X[(X$var1 <= 3 & X$var3 > 11), ]
X[(X$var1 <= 3 | X$var3 > 15), ]
X[which(X$var2 > 8), ]
sort(X$var1)
sort(X$var1, decreasing = T)
sort(X$var2, na.last = T)
X[order(X$var1), ]              ## Everything is sorted by the values of variable one
X[order(X$var1, X$var3), ]

library(plyr)
arrange(X, var1)
arrange(X, desc(var1))
X$var4 <- rnorm(5)
X
Y1 <- cbind(X, rnorm(5))
Y
Y2 <- cbind(rnorm(5), X)
Y


##Summarizing
dir <- "C:/Users/neeld/OneDrive/Desktop/datasciencecoursera/Getting&CleaningData"
setwd(dir)
getwd()

if(!file.exists("./data")){
  dir.create("./data")  
}
if(!file.exists("./data/restaurants.csv")){
  fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl, destfile="./data/restaurants.csv")
}
restData <- read.csv("./data/restaurants.csv")
head(restData,n=3)
tail(restData, n=3)
summary(restData)
str(restData)
quantile(restData$councilDistrict, na.rm = T)
quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9))
table(restData$zipCode, useNA="ifany")
table(restData$councilDistrict, restData$zipCode)
sum(is.na(restData$councilDistrict)) # count of NAs in a column
any(is.na(restData$councilDistrict)) # TRUE if there is at least one NA in column
all(restData$councilDistrict > 0) # TRUE if every value in column > 0 (will spot negative value)
colSums(is.na(restData)) # get count of missing values per column
all(colSums(is.na(restData))==0) # TRUE if none of the columns have any NAs
any(is.na(restData))
table(restData$zipCode %in% c("21212")) # determine number of restaurants in 21212
table(restData$zipCode %in% c("21212","21213")) # determine num. restaurants in 2 zips
head(restData[restData$zipCode %in% c("21212", "21213"),]) # return rows in the 2 zips
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt
warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks ~ ., data=warpbreaks)
xt
ftable(xt)
fakeData <- rnorm(1e5)
object.size(fakeData)  
print(object.size(fakeData), units="Mb")


## Creating new Variables
if(!file.exists("./data")){
  dir.create("./data")  
}
if(!file.exists("./data/restaurants.csv")){
  fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl, destfile="./data/restaurants.csv")
}
restData <- read.csv("./data/restaurants.csv")
s1 <- seq(1,10,by=2) # creates sequence from 1 up to 10 in step size of 2
s1
s2 <- seq(1,10,length=32) # creates sequence from 1 to exactly 10, spaced evenly to create 32 values
s2
x <- c(1,3,8,25,100); seq(along=x) # creates a sequence for each element in x
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")   ##appending new findings
table(restData$nearMe)
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE) # look for "negative" zip codes
table(restData$zipWrong, restData$zipCode < 0)
restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode))
table(restData$zipGroups, restData$zipCode)

library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g=4) # "bin" zipCode into four groups
table(restData$zipGroups)
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac <- factor(yesno)
yesnofac # levels default to alphabetical order
yesnofac <- factor(yesno, levels=c("yes", "no")) # specify the levels, and their order
yesnofac
yesnofac <- factor(yesno)
yesnofac <- relevel(yesnofac, ref="yes") # relevel makes the ref value first, others pushed down
yesnofac
as.numeric(yesnofac) # returns the level index for each value

library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode,g=4) # "bin" zipCode into four groups
table(restData$zipGroups)
library(Hmisc); library(plyr)
restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData2$zipGroups)
##
abs(x) absolute value
sqrt(x) square root
ceiling(x) round value up to next whole number, so ceiling(3.1) is 4
floor(x) round value down to next whole number, so floor (3.9) is 3
round(x, digits=n) rounds to n digits, round(3.457, digits=2) is 3.46
signif(x, digits=n): signif(3.475,digits=3) is 3.5
cos(x), sin(x), etc.
log(x): natural logarithm
log2(x), log10(x): other common logarithms
exp(x): exponentiating x
##



##     Reshaping the data
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg", "hp"))
head(carMelt,n=3)
tail(carMelt,n=3)
cylData <- dcast(carMelt, cyl~variable)
cylData
cylData <- dcast(carMelt, cyl~variable, mean)
cylData
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray,sum)
head(InsectSprays,n=10)
spIns = split(InsectSprays$count,InsectSprays$spray)
spIns
sprCount = lapply(spIns,sum) ##list applies sum func through spIns 
sprCount                    
unlist(sprCount)           ## list to vector
sapply(spIns, sum)         # We can combine the apply-combine steps with sapply, which returns an atomic vector
ddply(InsectSprays, .(spray),summarise, sum=sum(count))
spraySums <- ddply(InsectSprays,.(spray),summarise,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)




## dlpyr
library(dplyr)
options(width = 105)
chicago <- readRDS("chicago.rds")
dim(chicago)
names(chicago)
head(select(chicago, city:dptp))
head(select(chicago, -(city:dptp)))
i <- match("city", names(chicago))                  ## equivalent
j <- match("dptp", names(chicago))                  ## code
head(chicago[, -(i:j)])                             ## without dplyr
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f, 10)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f, 10)
chicago <- arrange(chicago, date)
head(chicago)
chicago <- arrange(chicago, desc(date))
head(chicago)
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)
chicago <- mutate(chicago, pm25detrend = pm25 - mean (pm25, na.rm = TRUE))
head(select(chicago, pm25, pm25detrend))     
chicago <- mutate(chicago, tempcat = factor(1* (tmpd > 80), labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
hotcold
summarise(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1990)
years <- group_by(chicago, year)
summarise(years, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
chicago %>% mutate(month = as.POSIXlt(date)$mon + 1 )%>% group_by(month) %>% summarise(pm25 = mean(pm25, na.rm = T), o3 = max(o3tmean2), no2 = median(no2tmean2))




##         Merging DAta
if(!file.exists("./data")){
  dir.create("./data")
}
fileUrl1 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
fileUrl2 = "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
if(!file.exists("./data/reviews.csv")) {
  download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
}
if(!file.exists("./data/solutions.csv")) {
  download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
}
reviews = read.csv("./data/reviews.csv")
solutions = read.csv("./data/solutions.csv")
head(reviews,2)
head(solutions,2)
names(reviews)
names(solutions)
mergedData = merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData)
intersect(names(solutions), names(reviews))
mergedData2 = merge(reviews, solutions, all=TRUE)
head(mergedData2)
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
arrange(join(df1,df2),id) # merge and then sort
df1 = data.frame(id=sample(1:10),x=rnorm(10))
df2 = data.frame(id=sample(1:10),y=rnorm(10))
df3 = data.frame(id=sample(1:10),z=rnorm(10))
dfList = list(df1,df2,df3)
join_all(dflist)




