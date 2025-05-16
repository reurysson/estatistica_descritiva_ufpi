load(url(description = "https://www.ime.usp.br/~pam/dados.RData"))
tab2_1
attach(tab2_1)  # Segmenta o banco de dados para acessar diretamente as variáveis.

summary(tab2_1)

sa = salario  # Acessando apenas o variável salário
sa

var(sa)
sd(sa)

hist(sa)

fig27<-hist(sa, breaks = seq(4,24,by=4),right=FALSE,probability = T,plot=F)
aux<-with(fig27, 100 * density* diff(breaks)[1])
labs <- paste(round(aux), "%", sep="")
#quebras de linha apenas ilustrativas para facilitar a leitura
plot(fig27,
     freq = FALSE, labels = labs,
     xlab="Salário",
     ylab="",
     col="darkgrey",
     border="white",
     yaxt="n",
     xlim=c(0,24), xaxp=c(0,24,6),
     ylim=c(0,.1), main="")

boxplot(sa, xlab = "Salário", ylab = "Número de Salários")

munic
x11()
boxplot(munic$populacao, 
        pch=8,  # tipo de marcador dos outliers
        col="lightblue", # cor do preenchimento do box plot
        border="darkgrey", # cor da linha do box plot
        boxwex=0.2 # Tamanho da caixa
)
# Os comandos 'text'a seguir imprimem no box plot os nomes das cidades dos 4 pontos destacados
text(x=cd_municipios$populacao[1],label=cd_municipios$municipio[1],pos=4,cex=0.7) # Máximo
text(x=cd_municipios$populacao[2],label=cd_municipios$municipio[2],pos=4,cex=0.7)
