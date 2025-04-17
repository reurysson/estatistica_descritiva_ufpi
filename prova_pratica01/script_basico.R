# Instação de pacote
# install.packages("faraway")

library(faraway)


help(package="faraway")


data(xxx) # DSubstitua xxx pelo nome da sua base de dados

# Transformando o dataset em um dataframe
dados <-  data.frame(xxx)


# Lendo as primeiras cinco colunas do dataframe
dados[1:5,]

# Listando os nomes das colunas
names(dados)


zzz  = dados$zzz  # Substitua zzz pelo nome da coluna de sua base de dados 


minimo = min(zzz)
maximo = max(zzz)
media = mean(zzz)
mediana = median(zzz)
amplitude = v_max - v_min
moda <- function(x) {
  modal <- unique(x)
  modal[which.max(tabulate(match(x, modal)))]
}
moda(zzz)


minimo
maximo
media
mediana
amplitude

summary(zzz) #Outra forma de obter as estatisticas descritivas

sort(zzz) # Rol

# Construindo uma distribuição de  frequência simples
tabela = table(sort(zzz))

# Gráfico de barras simples
barplot(tabela, xlab="Descrição de sua variável", ylab = "Frequência")

# Número de classes
k = nclass.Sturges(zzz)

# Amplitude da classe (h)
h <- ceiling(amplitude/k)
h
#  limites da tabela de frequência
infclass <- min(zzz)
supclass <- infclass+(k*h)

# DQuebras da distribuição de frequência
brk <-seq(infclass,supclass,h)
brk

# Tabela de frequência absoluta
tabela <-table(cut(zzz, breaks = brk, right = FALSE))
tabela


# Histograma.

hist(zzz, xlab = "Flexão anterior", main = "Título", 
     ylab = "Freqência", breaks = brk,
     right = FALSE, # Parâmentro necessário para ajustar o histograma à tabela de frequência
     plot = TRUE, 
     xlim = range(brk), ylim = c(0, 25))

      