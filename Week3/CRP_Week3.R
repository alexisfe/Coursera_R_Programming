library(datasets)
data(iris)

# What is the mean of 'Sepal.Length' for the species virginica?

mean(subset(iris, Species=="virginica")$Sepal.Length, na.rm=T)
qwqwwqqw                                               
#Continuing with the 'iris' dataset from the previous Question
# , what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)

# How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?

mpg_by_cyl <- with(mtcars, tapply(mpg, cyl, mean))
abs(mpg_by_cyl[3]-mpg_by_cyl[1])
