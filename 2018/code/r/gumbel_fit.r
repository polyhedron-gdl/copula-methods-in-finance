# http://firsttimeprogrammer.blogspot.it/2015/02/how-to-fit-copula-model-in-r.html
# http://firsttimeprogrammer.blogspot.it/2014/07/copula-functions-in-r.html

# https://www.r-bloggers.com/copulas-made-easy/
# https://www.r-bloggers.com/modelling-dependence-with-copulas-in-r/

setwd("C:/Users/T004314/Documents/GitHub/working/R/appunti/varie")

x <- read.table("./x.txt")
y <- read.table("./y.txt")

mat <- matrix(nrow=100,ncol=2)

for(i in 1:100)
{
  mat[i,1] <- x[,1][i]
  mat[i,2] <- y[,1][i]
}

# Actual observations
plot(mat[,1],mat[,2],main="Returns",xlab="x",ylab="y",col="blue")

# Normal copula
normal.cop <- normalCopula(dim=2)
fit.cop<- fitCopula(normal.cop,pobs(mat),method="ml")

# Coefficients
rho <- coef(fit.cop)
print(rho)

# Pseudo observations
p_obs <- pobs(mat)
plot(p_obs[,1],p_obs[,2],main="Pseudo/simulated observations: BLUE/RED",xlab="u",ylab="v",col="blue")

# Simulate data
set.seed(100)
u1 = rCopula(500,normalCopula(coef(fit.cop),dim=2))
points(u1[,1],u1[,2],col="red")

# Plot data with histograms
xhist <- hist(mat[,1], breaks=30, plot=FALSE)
yhist <- hist(mat[,2], breaks=30, plot=FALSE) 
top <- max(c(xhist$counts, yhist$counts)) 
xrange <- c(-4,4)
yrange <- c(-6,6)
nf <- layout(matrix(c(2,0,1,3),2,2,byrow=TRUE), c(3,1), c(1,3), TRUE) 
par(mar=c(3,3,1,1)) 
plot(mat[,1], mat[,2], xlim=xrange, ylim=yrange, xlab="", ylab="") 
par(mar=c(0,3,1,1)) 
barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0) 
par(mar=c(3,0,1,1)) 
barplot(yhist$counts, axes=FALSE, xlim=c(0, top), space=0, horiz=TRUE)

