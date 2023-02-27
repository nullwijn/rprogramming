#I'm going to use the built-in dataset 'Orange' an analysis on the Circumference of various orange trees based on their age, presumably in months.

head(Orange, 6)
list(Orange, 6)
#Yes, generic functions work

#S3 class assignment
tree1 <- list(type="Orange",age=Orange$age[1],circumference=Orange$circumference[1])
class(tree1) <- "tree"
tree1
attributes(tree1)
#S3 works on Orange

#S4 class assignment
setClass("tree",
         representation(
           type="character",
           age="numeric",
           circumference="numeric"
         ))
tree1 <- new("tree",type="Orange",age=Orange$age[1],circumference=Orange$circumference[1])
tree1
#S4 works on Orange