#I'm going to use the built-in dataset 'Orange' an analysis on the Circumference of various orange trees based on their age, presumably in months.

head(Orange, 6)
list(Orange, 6)
#Yes, generic functions work

#S3 class assignment
tree1S3 <- list(type="Orange",age=Orange$age[1],circumference=Orange$circumference[1])
class(tree1S3) <- "treeS3"
tree1S3
attributes(tree1S3)
#S3 works on Orange

#S4 class assignment
setClass("treeS4",
         representation(
           type="character",
           age="numeric",
           circumference="numeric"
         ))
tree1S4 <- new("treeS4",type="Orange",age=Orange$age[1],circumference=Orange$circumference[1])
isS4(tree1S4)
tree1S4
#S4 works on Orange

#UseMethod() and SetGeneric()
#UseMethod()
my_S3function <- function(x) {
  UseMethod("my_S3function")
}

my_S3function.treeS3 <- function(x) {
  paste("This is an", x$type, "tree that is", x$age, "months old and has a circumference of", x$circumference)
}

my_S3function(tree1S3)

#SetGeneric()
setGeneric("my_S4function", function(x) {
  standardGeneric("my_S4function")
})

setMethod("my_S4function", "treeS4", function(x){
  paste("This is an", x@type, "tree that is", x@age, "months old and has a circumference of", x@circumference)
})

my_S4function(tree1S4)