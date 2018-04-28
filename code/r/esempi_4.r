## Initialization and parameters 
set.seed(123)
P <- matrix(c(1, 0.1, 0.8,               # Correlation matrix
              0.1, 1, 0.4,
              0.8, 0.4, 1), nrow = 3)
d <- nrow(P)                             # Dimension
n <- 200                                 # Number of samples

## Simulation (non-vectorized version)
A <- t(chol(P))
U <- matrix(nrow = n, ncol = d)
for (i in 1:n){
  Z      <- rnorm(d)
  X      <- A%*%Z
  U[i, ] <- pnorm(X)
}

## Simulation (compact vectorized version) 
# U <- pnorm(matrix(rnorm(n*d), ncol = d) %*% chol(P))

## Visualization
pairs(U, pch = 16,
      labels = sapply(1:d, function(i){as.expression(substitute(U[k], list(k = i)))}))

