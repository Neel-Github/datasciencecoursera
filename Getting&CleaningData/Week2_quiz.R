library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "7187b451b8ffdec0367c",
                   secret = "87fb709d19ba9d07271dd8c93a35da8c99c865bf"
)
##Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
1
##Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
##Find "datasharing"
datashare <- which(sapply(output, FUN=function(anything) "datasharing" %in% anything))
datashare
##Find the time that the datasharing repo was created.
list(output[[19]]$name, output[[19]]$created_at)





## 2
library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "acs.csv")
acs <- read.csv("acs.csv")
head(acs)
detach("package:RMySQL", unload=TRUE)
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select * from acs where AGEP < 50 and pwgtp1")
sqldf("select pwgtp1 from acs")
sqldf("select pwgtp1 from acs where AGEP < 50")         ##ANS

##3
Z <- unique(acs$AGEP)
A <- sqldf("select AGEP where unique from acs")
B <- sqldf("select distinct AGEP from acs")             ##Ans       
identical(Z, B$AGEP)
C <- sqldf("select distinct pwgtp1 from acs")
identical(Z, C$AGEP)
D <- sqldf("select unique AGEP from acs")


##4
htmlUrl <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode <- readLines(htmlUrl)
close(htmlUrl)
head(htmlCode)
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))

##5
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
SST <- read.fwf(fileUrl, skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))        ##fixed width file format
head(SST)
sum(SST[,4])

