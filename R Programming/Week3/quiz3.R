library(datasets)
data(iris)
?iris
mean(Sepal.Length)
virginica_sepalmean <- iris[ 101:150, ]
sapply(virginica_sepalmean, mean)
?apply




library(datasets)
data(mtcars)
?mtcars
new <- tapply(mtcars$hp, mtcars$cyl, mean)
new
round(new[3]-new[1])

debug(ls)
