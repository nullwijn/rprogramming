A <- matrix(1:100, nrow = 10)
B <- matrix(1:1000, nrow = 10)

DA <- det(A)
DB <- det(B)

IA <- solve(A)
IB <- solve(B)