par(mfrow=c(1,2))

nsample = 10000

x <- rnorm(nsample,0,1)
y <- rnorm(nsample,0,1)

plot(x,y,type="p",pch='.')
hist(x, main="R.V. from Std Normal X", cex.axis=.8, xlim=c(-4,4))
hist(y, main="R.V. from Std Normal Y", cex.axis=.8, xlim=c(-4,4))

eps = matrix(c(x,y), nrow = length(x))

p <- matrix(c(1.0,0.999,
              0.999, 1.0), nrow =2)

A <- t(chol(p))

Z = A%*%t(eps)

x_prime = Z[1,]
y_prime = Z[2,]

plot(x_prime, y_prime,pch='.')

hist(x_prime, main="R.V. from Std Normal X", cex.axis=.8, xlim=c(-4,4))
hist(y_prime, main="R.V. from Std Normal Y", cex.axis=.8, xlim=c(-4,4))

