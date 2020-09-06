fileUrl <- 'http://www.espn.com/nfl/team/schedule/_/name/bal/year/2016'
doc <- htmlTreeParse(fileUrl, useInternal=TRUE)

# score vector is straightforward, using <li> tag   
score <- xpathSApply(doc,"//li[@class='score']", xmlValue)

# game status is a bit more tricky, because there are two different types
# first, we combine the two classes in an R object
gameStatus <- c("//li[@class='game-status loss']","//li[@class='game-status win']")

# second, we use the object as the query string in xpathSApply()
result <- xpathSApply(doc,gameStatus,xmlValue)

opponent <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)

# third, use a similar technique to extract game dates from the table, ignoring bye week
daysOfWeek <- c("//td['Sun,']","//td['Mon,']","//td['Thu,']","//td['Sat,']")
date <- grep("Sun,|Mon,|Thu,|Sat,",xpathSApply(doc,daysOfWeek,xmlValue),value=TRUE)

# finally, combine into a data frame and print
team <- rep("Baltimore Ravens",length(opponent))
scoresData <- data.frame(team,date,opponent,result)
scoresData