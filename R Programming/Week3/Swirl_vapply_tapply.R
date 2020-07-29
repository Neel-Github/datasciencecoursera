sapply(flags, unique)
vapply(flags, unique, numeric(1))
ok()
sapply(flags, class)
vapply(flags, class, character(1))
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate, flags$landmass, mean)                             ##
tapply(flags$population, flags$red, summary)
2
tapply(flags$population, flags$landmass, summary)
56
2
2
neeldeshmukh619@gmail.com 
