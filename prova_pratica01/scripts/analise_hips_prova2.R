# Instação de pacote
# install.packages("faraway")
install.packages("moments")

# Carragamento do pacote
library(faraway)
library(moments)
# Consultando detalhes do pacote
help(package="faraway")

# COnsultando detalhes do dataset "hips"
help(hips)
data(hips) # Dados de Espondilite anquilosante

# Transformando o dataset em um dataframe
dados <-  data.frame(hips)

# Lendo as primeiras cinco colunas do dataframe
dados[1:5,]

# Listando os nomes das colunas
names(dados)

# Definindo a variável de interesse
# As análises estatísticas a seguir consideram as dados da variável flexão antes (fbef) e após (baft) a 
# intervenção em indivíduos pertencentes ao grupo de tratamento.
# Nenhuma distinção foi feita em relação ao lado do corpo.

grp_treat <- subset(dados, grp == "treat")

antes <- grp_treat$fbef
depois <- grp_treat$faft

flexao <- depois


# Estatísticas descritivas individuais da variável "fbef"
length(flexao)
summary(flexao)
media <- mean(flexao)
print(media)
dp <- sd(flexao)
print(dp)
cv <-  (dp/media)*100
print(cv)
dma <- mean(abs(flexao-media))
print(dma)
skewness(flexao)
kurtosis(flexao)


# Definindo o número de classes
k = nclass.Sturges(flexao)-1  # Removemos uma classe para evitar que a 2ª classes ficasse vazia. Decisão tomada após a criação da 1ª versão da tabela de distribuição.
k
# Denifindo a amplitude da classe (h)
h <- 10 # Valor escolhido para análise prévia para compatibilizar a visualização dos 2 conj. de dados
h

#  limites inferior e superior da 1ª e última classes, respectivamente.
infclass <- min(flexao)
supclass <- infclass+(k*h)
# Definindo as quebras da distribuição de frequência
brk <-seq(infclass,supclass,h)
brk

# Histograma da variável flexão antes do tratamento.
hist(flexao, freq = FALSE, xlab = "Flexão", main = "Ângulo de flexão", 
     ylab = "Densidade", breaks = brk,
     right = FALSE, # Parâmentro necessário para ajustar o histograma à tabela de frequência
     plot = TRUE,
     col = "#a2c4c9",
     xlim = range(brk),
     ylim = c(0, max(density(flexao)$y)),
     xaxt = "n") # Retira os rótulos automáticos
axis(1, at = brk, labels = brk)  # Adiciona rótulos com base nos intervalos de classes adotados
lines(density(flexao))
shapiro.test(flexao)

norm = shapiro.test(flexao)
pvalor = norm[2]

if (norm[2] < 0.05) {
  print("Os dados não seguem uma distribuição normal (p-valor < 0.05)")
} else {
  print("Os dados seguem uma distribuição normal(p-valor > 0.05)")
}
  
plot(flexao, pch=16,ylab="Ângulo de flexão")

# Gráfico comparativo do grupo de tratamento antes e após a intervenção
boxplot(grp_treat$fbef, grp_treat$faft, col="#a2c4c9",boxwex = 0.2,pch=16, main="Grau de flexão de pacientes com Ankylosing Spondylitis",names=c("Antes", "Após"), ylab="Ângulo de flexão")




