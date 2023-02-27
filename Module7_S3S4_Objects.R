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

#Set up the pointer function
my_S3function <- function(x) {
  UseMethod("my_S3function")
}

#Use the tree class I created earlier, create a concatenated summary of the data.
my_S3function.treeS3 <- function(x) {
  paste("This is an", x$type, "tree that is", x$age, "months old and has a circumference of", x$circumference)
}
#Run the function with my S3 object
my_S3function(tree1S3)

#SetGeneric()

#Set up the S4 version of the pointer function
setGeneric("my_S4function", function(x) {
  standardGeneric("my_S4function")
})

#Set up the s4 version of the concatenation, using the same S4 class I defined earlier as well
setMethod("my_S4function", "treeS4", function(x){
  paste("This is an", x@type, "tree that is", x@age, "months old and has a circumference of", x@circumference)
})
#Run the function with my S4 object
my_S4function(tree1S4)