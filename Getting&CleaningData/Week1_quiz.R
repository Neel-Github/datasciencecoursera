getwd()
directory <- ("C:/Users/neeld/OneDrive/Desktop/datasciencecoursera/Getting&CleaningData")
setwd(directory)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=fileUrl,destfile="idaho_housing.csv",mode="w",method="curl")
list.files(".")
dateDownloaded <- date()
dateDownloaded
idaho_housing <- read.csv("idaho_housing.csv")
head(idaho_housing)
length(idaho_housing$VAL[!is.na(idaho_housing$VAL) & idaho_housing$VAL==24])   ## sum(quiz1Data$VAL == 24, na.rm = TRUE)



##  Question 3 



fileUrl3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
file3 <- download.file(url=fileUrl1, destfile="gov_NGAP.xlsx", mode="wb")
dateDownloaded <- date()
dateDownloaded
library(xlsx)
col <- 7:15
row <- 18:23
suppressWarnings(dat <- read.xlsx("./gov_NGAP.xlsx", sheetIndex=1, colIndex = col, rowIndex = row, header = TRUE))
dat
sum(dat$Zip*dat$Ext,na.rm=T)



##   Question 4

library(XML)
fileUrl4 <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
doc <- xmlTreeParse(file=fileUrl4,useInternal=TRUE)
rootNode <- xmlRoot(doc)
##  xmlName(rootNode)
##  names(rootNode)
rootNode[[1]][[1]]
zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcode[zipcode==21231])


##  Question 5

fileUrl5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file( url = fileUrl5, destfile = "idaho_housing.csv")
dateDownloaded5 <- date()
dateDownloaded5
library(data.table)
DT <- fread(file = "idaho_housing.csv", sep = ",")
DT
test.times <- 1000
rowMean <- replicate(test.times, system.time(rowMeans(DT[DT$SEX==1]), rowMeans(DT[DT$SEX==2])))

mean.mean <- replicate(test.times, system.time(mean(DT[DT$SEX==1,]$pwgtp15), mean(DT[DT$SEX==2,]$pwgtp15)))

STDT <- replicate(test.times, system.time(DT[,mean(pwgtp15),by=SEX]))

STsapply  <- replicate(test.times, system.time(sapply(split(DT$pwgtp15,DT$SEX),mean)))

STtapply <- replicate(test.times, system.time(tapply(DT$pwgtp15,DT$SEX,mean)))

STmean <- replicate(test.times, system.time(mean(DT$pwgtp15,by=DT$SEX)))

rowMeans(mean.mean[, 1:100],na.rm = T)
rowMeans(STDT[, 1:100],na.rm = T)
rowMeans(STsapply[, 1:100],na.rm = T)
rowMeans(STtapply[, 1:100],na.rm = T)
rowMeans(STmean[, 1:100],na.rm = T)


# [ > rowMeans(mean.mean[, 1:100],na.rm = T)
# user.self   sys.self    elapsed user.child  sys.child 
# 0.0108     0.0043     0.0120        NaN        NaN 
# > rowMeans(STDT[, 1:100],na.rm = T)
# user.self   sys.self    elapsed user.child  sys.child 
# 0.0024     0.0013     0.0030        NaN        NaN 
# > rowMeans(STsapply[, 1:100],na.rm = T)
# user.self   sys.self    elapsed user.child  sys.child 
# 5e-04      0e+00      6e-04        NaN        NaN 
# > rowMeans(STtapply[, 1:100],na.rm = T)
# user.self   sys.self    elapsed user.child  sys.child 
# 7e-04      0e+00      7e-04        NaN        NaN 
# > rowMeans(STmean[, 1:100],na.rm = T)
# user.self   sys.self    elapsed user.child  sys.child 
# 0         0          0        NaN        NaN      ]


