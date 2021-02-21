library(plot3D)
# 3D Plot of Half of a Torus
par(mar = c(2, 2, 2, 2))
par(mfrow = c(1, 1))
R <- 3
r <- 2
x <- seq(0, 1, 0.01)
y <- seq(0, 1, 0.01)
M <- mesh(x, y)

xx <- M$x
yy <- M$y

surf3D(x = xx,
       y = yy,
       z = pmin(xx,yy),
       colkey=FALSE,
       bty="b2",
       main="Maximum Copula")

surf3D(x = xx,
       y = yy,
       z = pmax(xx+yy-1,0),
       colkey=FALSE,
       bty="b2",
       main="Minimum Copula")

surf3D(x = xx,
       y = yy,
       z = xx*yy,
       colkey=FALSE,
       bty="b2",
       main="Product Copula")

