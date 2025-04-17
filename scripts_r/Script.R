# Estatística Descritiva - 11/04/2025
# Prática computacional no R


# Carregando os dados quando os mesmos se 
# encontram salvos no computador
load("C:/Users/CAMINHO DO SEU DIRETÓRIO/aflsmall.Rdata")

# Acessando os dados do pacote lsc
# Mais informações em: https://github.com/djnavarro/lsr?tab=readme-ov-file

install.packages("lsr")
library(lsr)
who()

# Explicação das variáveis

# afl.finalists: contém os nomes de todos os 400 times que jogaram em todas 
# as 200 partidas finais disputadas durante o período de 1987 a 2010.

# afl.margins: contém a margem de vitória (número de pontos) para todos os
# 176 jogos em casa e fora de casa disputados durante a temporada de 2010. 

# Descrevendo o conjunto de dados
# Há duas variáveis, afl.finalists e afl.margins. Vamos nos concentrar um pouco nessas duas
# variáveis. Esses são dados reais, relativos à Australian Football League (AFL). 
# A variável afl.margins contém a margem de vitória (número de pontos) para todos os
# 176 jogos em casa e fora de casa disputados durante a temporada de 2010. 
# A variável afl.finalists contém os nomes de todos os 400 times que jogaram em todas 
# as 200 partidas finais disputadas durante o período de 1987 a 2010. Vamos dar uma olhada 
# na variável afl.margins:

# Primeiro acesso aos dados
print(afl.margins)
dados<-(afl.margins)
length(dados)

# Minimo e máximo
min(dados)
max(dados)

# Amplitude
max(dados)-min(dados)

# Identificando o máximo e o mínimo dos dados
range(dados)

# Amplitude
AT <- ceiling((max(dados)- min(dados)))
AT

# Rol 
sort (dados)

# Distribuição de frequencia simples
table(sort (dados))
plot(table(sort (dados)))


# Distribuição em  classes: 
k <- nclass.Sturges(dados)

# Tamanho das classes 

h <- ceiling(AT/k)
h
#  limites iniciais e finais da primeira e da última classe

infclass <- min(dados)
supclass <- infclass+(k*h)

# Para informar ao R quais serão as quebras da nossa distribuição usaremos a função seq(),
# que gera sequências regulares

brk <-seq(infclass,supclass,h)
brk


# podemos usar a função table() aliada à função cut()para construirmos uma 
# tabela de distribuição de frequência absoluta, com intervalos definidos anteriormente. 
# O argumento rigth=FALSE indica que não queremos o intervalo fechado à direita.

tabela_dados<-table(cut(dados,breaks = brk, right = FALSE))
tabela_dados


# Caso você queira importar a tabela pode usar a função write.table:

write.table(tabela_dados,"C:/AQUI VOCE INSERE O CAMINHO DO SEU COMPUTADOR/tabela_dados.txt")

# A tabela de distribuição de frequência relativa é obtida facilmente usando 
# a função prop.table() que retorna as proporções:
    
tabela_dados <- prop.table(tabela_dados)
tabela_dados
  
# Histograma de frequência absoluta
hist(dados,  
     main = "Nome da variável", 
     xlab = "Nome do eixo x", ylab = "Freq. Absoluta", 
     col = c("blue"), 
     border = c("royalblue"),
     breaks = brk,
     right = FALSE,
     axes = FALSE
)
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(dados),2))

# Esta saída não facilita a compreensão do que os dados realmente dizem.
# Apenas "olhar para os dados" não é uma maneira muito eficaz de entendê-los. 
# Para ter uma ideia do que está acontecendo, precisamos calcular algumas estatísticas
# descritivas e desenhar algumas figuras. Como as estatísticas descritivas são o
# tópico mais fácil dos dois, começarei com elas, mas, mesmo assim, mostrarei um
# histograma dos dados de afl.margins, pois ele deve ajudar você a ter uma ideia 
# de como os dados que estamos tentando descrever realmente se parecem. 
# Mas, para constar, este histograma foi gerado usando a função hist(). 
# Observar o histograma e notar que ele fornece uma representação bastante interpretável
# dos dados de afl.margins.


hist(afl.margins)
# histograma dos dados de margem de vitória da AFL 2010. 
# Como você pode observar, quanto maior a margem, menos frequentemente ela é vista. Faz sentido?

head(afl.finalists, 25)

# Moda dos dados
modeOf(x = afl.finalists)
