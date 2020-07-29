##Apply
a<- array(rnorm(2*2*10),c(2,2,10))
z<-apply(a,c(1,2),mean)                                  ##equal to rowMean(a,dims=2)
y<-rowMeans(a,dims = 2)

##   Apply

x<- matrix(rnorm(200),20,10)
apply(x,1,quantile,probs =c(.05,.07))

##   Mapply

list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
rep(1:4,4:1)
mapply(rep, 1:4,4:1)

noise<- function(n,mean,sd){
  rnorm(n,mean,sd)
}
noise(1:5,1:5,2)

mapply(noise,1:5,1:5,2)                                 ##when we need a list of op and not just 1

##  TAPPLY

j <- c(rnorm(10),runif(10),rnorm(10, 1))
f<- gl(3, 10)
f
tapply(j, f, mean)
tapply(j, f, mean,simplify = FALSE)
tapply(j, f, range)

##SAPPLY

split(j, f)
lapply(split(j, f),mean)


library(datasets)
head(airquality)
s<-split(airquality,airquality$Month)
lapply(s, function(x) colMeans(x[ , c("Ozone", "Solar.R", "Wind")]))
sapply(s, function(x) colMeans(x[ , c("Ozone", "Solar.R", "Wind")],na.rm = TRUE))

s1<-rnorm(10)
f1<-gl(2,5)
f2<-gl(5,2)
f1
f2
interaction(f1, f2)
str(split(s1, list(f1, f2)))
str(split(s1, list(f1, f2),drop = T))

##
