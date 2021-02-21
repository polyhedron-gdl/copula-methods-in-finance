#par(mfrow=c(1,2))

c_plus<-function(x,y){
   return (pmin(x,y))
}

c_minus<-function(x,y){
  return(pmax(x+y-1,0))
}

x = seq(0,1,length = 25)
y = x
z = outer(x,y,FUN=c_plus)

dev.new()
persp(x, y, z, 
      theta = 30, 
      phi = 30, 
      expand = 0.5, 
      col = "lightgreen",
      ltheta = 100, 
      ticktype = "detailed",
      xlab = "u", 
      ylab = "v", 
      zlab = "Copula")

z = outer(x,y,FUN=c_minus)

dev.new()
persp(x, y, z, 
      theta = 30, 
      phi = 30, 
      expand = 0.5, 
      col = "lightgreen",
      ltheta = 100, 
      ticktype = "detailed",
      xlab = "u", 
      ylab = "v", 
      zlab = "Copula")

z = outer(x,y,FUN="*")
dev.new()
persp(x, y, z, 
      theta = 30, 
      phi = 30, 
      expand = 0.5, 
      col = "lightgreen",
      ltheta = 100, 
      ticktype = "detailed",
      xlab = "u", 
      ylab = "v", 
      zlab = "Copula")
#library(rgl)
#plot3d(x,y,z,pch=20,col='navyblue')

