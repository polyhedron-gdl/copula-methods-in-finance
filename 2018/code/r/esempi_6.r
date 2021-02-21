# Copula package
library(copula)
# Fancy 3D plain scatterplots
library(scatterplot3d)
# ggplot2
library(ggplot2)
# Useful package to set ggplot plots one next to the other
library(grid)

set.seed(235)

# Select the copula
#cp <- claytonCopula(param = c(3.4), dim = 2)
cp <- normal <- normalCopula(param = 0.2, dim = 2)
# Generate the multivariate distribution (in this case it is just bivariate) with normal and t marginals
#multivariate_dist <- mvdc(copula = cp,
#                          margins = c("norm", "t"),
#                          paramMargins = list(list(mean = 2, sd=3),
#                                              list(df = 2)) )

#multivariate_dist <- mvdc(copula = cp,
#                          margins = c("norm", "norm"),
#                          paramMargins = list(list(mean = 0, sd=1),
#                                              list(mean = 0, sd=1)) )

multivariate_dist <- mvdc(copula = cp,
                          margins = c("t", "t"),
                          paramMargins = list(list(df = 2),
                                              list(df = 2)) )

print(multivariate_dist)

# Generate the normal copula and sample some observations
coef_ <- 0.2
mycopula <- normalCopula(coef_, dim = 2)
u <- rCopula(2000, mycopula)

# Compute the density
pdf_ <- dCopula(u, mycopula)

# Compute the CDF
cdf <- pCopula(u, mycopula)

# Generate random sample observations from the multivariate distribution
v <- rMvdc(2000, multivariate_dist)

# Compute the density
pdf_mvd <- dMvdc(v, multivariate_dist)

# Compute the CDF
cdf_mvd <- pMvdc(v, multivariate_dist)

par(mfrow = c(1, 3))
# 3D plain scatterplot of the density, plot of the density and contour plot
scatterplot3d(u[,1], u[,2], pdf_, color="red", main="Density", xlab ="u1", ylab="u2", zlab="dCopula", pch=".")
persp(mycopula, dCopula, main ="Density")
contour(mycopula, dCopula, xlim = c(0, 1), ylim=c(0, 1), main = "Contour plot")

par(mfrow = c(1, 3))
# 3D plain scatterplot of the CDF, plot of the CDF and contour plot
scatterplot3d(u[,1], u[,2], cdf, color="red", main="CDF", xlab = "u1", ylab="u2", zlab="pCopula",pch=".")
persp(mycopula, pCopula, main = "CDF")
contour(mycopula, pCopula, xlim = c(0, 1), ylim=c(0, 1), main = "Contour plot")

# 3D plain scatterplot of the multivariate distribution
par(mfrow = c(1, 2))
scatterplot3d(v[,1],v[,2], pdf_mvd, color="red", main="Density", xlab = "u1", ylab="u2", zlab="pMvdc",pch=".")
scatterplot3d(v[,1],v[,2], cdf_mvd, color="red", main="CDF", xlab = "u1", ylab="u2", zlab="pMvdc",pch=".")

dev.new()
persp(multivariate_dist, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "Density")
contour(multivariate_dist, dMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "Contour plot")


persp(multivariate_dist, pMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "CDF")
contour(multivariate_dist, pMvdc, xlim = c(-4, 4), ylim=c(-4, 4), main = "Contour plot")

