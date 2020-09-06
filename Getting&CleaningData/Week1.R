getwd()
setwd("../")            # move up
setwd("./xyx")          # goto xyz


file.exists("NameOfDirectory")  ## checks if it exists
dir.create("XYZ")               ## creates if dosnt exist

if (!file.exists("data")) {     ## creating a new directory
  dir.create("data")
}

download.file()           ## downloads a file + increases reproducibility url, destfile, method
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile ="./data/camera.csv", method = "curl" )
list.files("./data")
dateDownload <- date()

# Excel files
if (!file.exists("data")) {     ## creating a new directory
  dir.create("data")
}
filerUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(filerUrl, destfile = "./data/camera.xlsx", method = "curl")
dateDownload2 <- date()

library(xlsx2dfs)
cameraData <- read_excel("./data/camera.xlsx")               ## Some Error
head(cameraData)

##XML
library("RCurl")
library("XML")
fileURL <- "https://www.w3schools.com/xml/simplexsl.xml"
data.unparsed <- getURL(fileURL)
doc <- xmlTreeParse(data.unparsed, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

rootNode[[1]]
rootNode[[1]][[1]]

xmlSApply(rootNode,xmlValue)
 ## XPATH PDF :-> https://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf

xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

## option 1 -----> not working
library("RCurl")
library("XML")
fileUrl <- "https://www.espn.in/nfl/team/_/name/bal/baltimore-ravens"
data.unparsed <- getURL(fileUrl)
doc <- htmlTreeParse(fileUrl, useInternalNodes = TRUE)
scores <- as.character(xpathSApply(doc,"//div[@class='score']",xmlValue))
teams <- xpathSApply(doc, "//div[@class='game-info']", xmlValue)
scores
teams



## option 2
library(xml2)
suppressWarnings(dx<-read_xml("https://www.espn.com/nfl/team/_/name/bal/baltimore-ravens", as_html=TRUE))
teams<-as.character(xml_contents(xml_find_all(dx,"//div[@class='game-info']")))
scores<-as.character(xml_contents(xml_find_all(dx,"//div[@class='score']")))
scores
teams




## JSON
library(jsonlite)
JsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(JsonData)
names(JsonData$owner)
JsonData$owners$login

myJson <- toJSON(iris, pretty = T)
myJson
cat(myJson)

iris2 <- fromJSON(myJson)
head(iris2)
head(iris)



##DataTable
library(data.table)
DF <- data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3),z = rnorm(9))
head(DF, 3)                 
DT <- data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3),z = rnorm(9))                               
head(DT, 3)
tables()     ## Descibes the data table/frame
DT[2,]
DT[DT$y == "a", ]
DT[c(2,3),]
DT[,c(2,3)]
k = {print(10); 5}
print(k)

DT[, list(mean(x), sum(z))]                 ## passing list/funtions in 2nd argument
DT[,table(y)]                               ## Displays conents of y in table
DT[,w:=z^2]                                 ## New column w values = z^2
DT2 <- DT                                   ## Wont make a save copy
DT[, y := 2]                                ##changes both DT and DT2
head(DT, 3)
head(DT2, 3)                                ##Copy isnt made
DT[,m:= { tmp <- (x + z); log2(tmp + 5)}]   ## log part will be assigned to the m
DT[ ,a:=x>0]                                
DT[, b:= mean(x + w), by = a]               ##Grouped 'by a'
DT

set.seed(123)
DT <- data.table(x = sample(letters[1:3], 1E5, TRUE))
DT[, .N, by = x]                            ##Number of times(.N) Grouped by 'x'

DT <- data.table(x= rep(c("a", "b", "c"), each = 100), y = rnorm(300))
setkey(DT, x)                               ## X is key
DT['a']                                     ## Subsets x$a


DT1 <- data.table(x= c('a', 'a', 'b', 'dt1'), y = 1:4)
DT2 <- data.table(x= c('a', 'b', 'dt2'), z = 5:7)
setkey(DT1, x); setkey(DT2, x)
merge(DT1, DT2)                             ## Merging is done wrt x
 
big_df <- data.frame(x= rnorm(1E6),y =rnorm(1E6))
file <- tempfile()
write.table(big_df, file = file, row.names = F, col.names =  T, sep = "\t", quote = F)
system.time(fread(file))
system.time(read.table(file, header = T, sep = "\t"))
