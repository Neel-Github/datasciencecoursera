url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url1, destfile = "data")
q1 <- read.csv(url1)
head(q1)
q1_colnames <- names(q1)
strsplit(q1_colnames, "^wgtp")[[123]]

#

url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
FGDP <- data.table::fread(url2,
                          skip = 5,
                          nrows = 190,
                          select = c(1, 2, 4, 5), 
                          col.names=c("CountryCode", "Rank", "Economy", "Total")
                          )
head(FGDP)
FGDP$Total <- as.integer(gsub(",", "", FGDP$Total))
FGDP
mean(FGDP$Total, na.rm = TRUE)

#

countryNames <- as.character(FGDP$Economy)
grep("^United", countryNames),3

#

url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
q4 <- read.csv(url3)
FEDSTATS <- data.table::fread(url3)
mergedDF <- merge(FGDP, FEDSTATS, by = "CountryCode")
nrow(mergedDF)
FEDSTATS
Fascal_June <- grep("Fiscal year end: June ", mergedDF$`Special Notes`)
Fascal_June

#

library(quantmod)
library(lubridate)
?getSymbols
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sampleTimes
amzn2012 <- sampleTimes[grep("^2012", sampleTimes)]
NROW(amzn2012)
?NROW
NROW(amzn2012[weekdays(amzn2012) == "Monday"])
?wday
