install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user = "genome", host = "genome-mysql.soe.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);
result
hg19 <- dbConnect(MySQL(),user = "genome",db ="hg19", host = "genome-mysql.soe.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]

dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")   ## Select only a subset of the data to prevent overloading R
affyMiss <- fetch(query); quantile(affyMiss$misMatches)        ## fetches the data
affyMisSmall <- fetch(query, n=10); dbClearResult(query)     ## Contains only 1st 10 rows ## used to prevent fetching gigantic DAtaTable // Clearing query from remote server
dim(affyMis)
dbDisconnect(hg19)


                ## HDF5                   


install.packages("BiocManager")
BiocManager::install()
BiocManager::install("rhdf5")
library(rhdf5)
file <- h5createFile("example.h5")
file
file <- h5createGroup("example.h5", "foo")
file <- h5createGroup("example.h5", "baa")
file <- h5createGroup("example.h5", "foo/foobaa")
h5ls("example.h5")
A <- matrix(1:10,nr=5, nc=2)
h5write(A, "example.h5", "foo/A")
B = array(seq(0.1, 2.0, by = 0.1), dim = c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/foobaa/B")
h5ls("example.h5")
              #df
df = data.frame(1L:5L, seq(0,1,length.out = 5), c("ab","cde","fghi","a","s"), strigAsFactor = FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")
              #read
readA <- h5read("example.h5", "foo/A")
readA
             # Writing and Reading In Chunks
h5write(c(12,13,14), "example.h5", "foo/A", index = list(1:3,1))
h5read("example.h5", "foo/A")
h5read("example.h5", "foo/A", index = list(1:3,1))

## Web scraping
 
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

library(XML)
library(httr)
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(rawToChar(GET(url)$content), useInternalNodes = TRUE)
xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)


library(httr); html2=GET("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
content2=content(html2,as="text")
parsedHtml=htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title",xmlValue)


pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user","passwd"))
pg2
names(pg2)


google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")



## API
