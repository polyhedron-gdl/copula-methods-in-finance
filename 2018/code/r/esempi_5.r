library(MASS)
library(psych)

# Esempio Cherubini et al p. 114 (fig. 3.7)

set.seed(123)
P <- matrix(c(1, 0.9, 
              0.9, 1), nrow = 2)
d <- nrow(P)      # Dimensione del problema
n <- 5000         # Numero di Campioni

## Simulazione (compact vectorized version) 
u <- pnorm(matrix(rnorm(n*d), ncol = d) %*% chol(P))

## Visualizzazione
pairs(u, pch = 16,
      labels = sapply(1:d, function(i){as.expression(substitute(U[k], list(k = i)))}))

x1 <- qnorm(u[,1])
x2 <- qnorm(u[,2])

df <- cbind(x1,x2)
pairs.panels(df, xlim=c(-5,5), ylim = c(-5,5))

x1 <- qt(u[,1],df=3)
x2 <- qt(u[,2],df=3)

df <- cbind(x1,x2)
pairs.panels(df, xlim=c(-5,5), ylim = c(-5,5))

