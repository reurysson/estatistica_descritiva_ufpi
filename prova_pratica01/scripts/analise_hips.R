# Instação de pacote
# install.packages("faraway")

# Carragamento do pacote
library(faraway)

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
# As análises estatísticas a seguir consideram a totalidade dos dados da variável escolhida,
# sem fazer distinção entre grupos (controle e tratamento)

fbef  = dados$fbef

# Obtendo estatísticas individuaias de uma variável numérica
v_min = min(fbef)
v_max = max(fbef)
v_media = mean(fbef)
v_med = median(fbef)
v_dp = sd(fbef)
amplitude = v_max - v_min

print("Medidas descritivas da variável fbef")
v_min
v_max
v_media
v_med
v_dp
amplitude

# Estatísticas descritivas usando o summary
summary(fbef)

# Colocando a variável de interesse em rol
sort(fbef)

# Construindo uma distribuição de  frequência simples
tabela = table(sort(fbef))

# Gráfico de barras simples
barplot(tabela)

# Definindo o número de classes
k = nclass.Sturges(fbef) - 1  # Removemos uma classe para evitar que a 2ª classes ficasse vazia. Decisão tomada após inspesão.
k

# Denifindo a amplitude da classe (h)
h <- ceiling(amplitude/k)

#  limites iniciais e finais da primeira e da última classe
infclass <- min(fbef)
supclass <- infclass+(k*h)

# Definindo as quebras da distribuição de frequência
brk <-seq(infclass,supclass,h)
brk

# Tabela de frequência absoluta
tabela <-table(cut(fbef,breaks = brk, right = FALSE))
tabela

# Criando um dataframe com frequência absoluta e relativa
tabela_df <- data.frame(
  Categoria = names(tabela),
  Freq_Absoluta = as.numeric(tabela),
  Proporcao = prop.table(tabela,)
)

# Exibindo a tabela formatada
print(tabela_df)

# Box plot da variável flexão, antes e após tratamento
boxplot(fbef, xlab="flexão anterior", main="Flexão antes do tratamento", ylab="Ângulo de flexão")
hist(fbef, xlab = "Flexão anterior", main = "Histograma da variável flexão antes do tratamento", 
     ylab = "Freqência", breaks = brk,
     plot = TRUE, 
     xlim = range(brk), ylim = c(0, 25),
     xaxt = "n") # Retira os rótulos automáticos
axis(1, at = brk, labels = brk)  # Adiciona rótulos com base nos intervalos de classes adotados
shapiro.test(fbef)

# FIM das questões propostas na avaliação
#________________________________________


# Criando um subset com dados de flexão anterior e posterior
dados_flexao <- subset(dados, grp=="treat")
dados_flexao

# Sumário estatístico
summary(dados_flexao)
sd(dados_flexao$fbef)
sd(dados_flexao$faft)

# Gráfico comparativo do grupo de tratamento antes e após a intervenção
boxplot(dados_flexao$fbef, dados_flexao$faft, main="Flexão antes e após o tratamento",names=c("Antes", "Após"), ylab="Ângulo de flexão")

shapiro.test(dados_flexao$faft)

