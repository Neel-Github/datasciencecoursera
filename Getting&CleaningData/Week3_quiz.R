url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
q1 <- read.csv(url1)
agricultureLogical <- q1$ACR == 3 & q1$AGS == 6
head(which(agricultureLogical), 3)




library(jpeg)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
              , 'jeff.jpg'
              , mode='wb' )
picture <- jpeg::readJPEG('jeff.jpg'
                         , native=TRUE)
quantile(picture, probs = c(0.3, 0.8) )



library(data.table)
url3 - "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=5
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)
FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv')
mergedDT <- merge(FGDP, FEDSTATS_Country, by = "CountryCode")
nrow(mergedDT)
mergedDT[order(-Rank)][13,.(Economy)]


mergedDT %>% group_by(`Income Group`) %>%
  filter("High income: OECD" %in% `Income Group` | "High income: nonOECD" %in% `Income Group`) %>%
  summarize(Average = mean(Rank, na.rm = T)) %>%
  arrange(desc(`Income Group`))



mergedDT$RankGroups <- cut(mergedDT$Rank, breaks = 5)
vs <- table(mergedDT$RankGroups, mergedDT$`Income Group`)
vs
vs[1, "Lower middle income"]
