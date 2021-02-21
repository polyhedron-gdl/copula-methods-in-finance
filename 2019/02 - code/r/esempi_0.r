library(MASS)
set.seed(100)

m <- 3
n <- 2000
sigma <- matrix(c(1, 0.4, 0.2,
                  0.4, 1, -0.8,
                  0.2, -0.8, 1), 
                nrow=3)
z <- mvrnorm(n,mu=rep(0, m),Sigma=sigma,empirical=T)

library(psych)
cor(z,method='spearman')
pairs.panels(z)

u <- pnorm(z)
pairs.panels(u)


library(rgl)
plot3d(u[,1],u[,2],u[,3],pch=20,col='navyblue')
