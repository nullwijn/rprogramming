#1
A <- matrix(c(2,0,1,3), ncol=2)
B <- matrix(c(5,2,4,-1), ncol=2)
A+B
A-B
#2
diag(c(4,1,2,3))
#3
C <- diag(c(3,3,3,3,3))
C[1, 2:5] <- 1
C[2:5, 1] <- 2
C