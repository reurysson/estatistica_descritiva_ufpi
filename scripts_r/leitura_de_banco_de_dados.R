rm(list=ls(all=TRUE))
getwd()
load("C:/Users/reury/OneDrive/Estatistica_UFPI/estatistica_descritiva/aflsmall.Rdata")
#install.packages("lsr")
library (lsr)
who()
print(afl.finalists)
print(afl.margins)

dados <- (afl.margins)
length((dados))

min(dados)
max(dados)
mean(dados)
range(dados)

sort(dados)

# Distribuição de Frequência
table(sort(dados))

k <- nclass.Sturges(dados)

h <- ceiling(dados)

hist(dados,main="Histograma", breaks = "Sturges",nclass = 9, freq=TRUE, xlab="Número de Vitórias", ylab="Frequências")
help(hist)
