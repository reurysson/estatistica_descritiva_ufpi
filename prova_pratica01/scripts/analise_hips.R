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
# As análises estatísticas a seguir consideram a totalidade dos dados da variável escolhida (fbef: flexão antes),
# sem fazer distinção entre grupos (controle e tratamento) e lado do corpo.

fbef  = dados$fbef

# Obtendo estatísticas descritivas individuais da variável numérica "fbef
v_min = min(fbef)
v_max = max(fbef)
v_media = mean(fbef)
v_med = median(fbef)
v_dp = sd(fbef)
amplitude = v_max - v_min

# A moda não pode ser obtida diretamente no R. Uma função foi utilizada
# Fonte: https://dma.uem.br/kit/outros-arquivos/moda.pdf
moda <- function(x) {
  modal <- unique(x)
  modal[which.max(tabulate(match(x, modal)))]
}
moda(fbef)

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
barplot(tabela, xlab="Ângulo de flexão", ylab = "Frequência")

# Definindo o número de classes
k = nclass.Sturges(fbef) - 1  # Removemos uma classe para evitar que a 2ª classes ficasse vazia. Decisão tomada após a criação da 1ª versão da tabela de distribuição.
k

# Denifindo a amplitude da classe (h)
h <- ceiling(amplitude/k)
h
#  limites inferior e superior da 1ª e última classes, respectivamente.
infclass <- min(fbef)
supclass <- infclass+(k*h)

# Definindo as quebras da distribuição de frequência
brk <-seq(infclass,supclass,h)
brk

# Tabela de frequência absoluta
tabela <-table(cut(fbef, breaks = brk, right = FALSE))
tabela

# Criando um dataframe com frequência absoluta e relativa
tabela_df <- data.frame(
  Categoria = names(tabela),
  Freq_Abs = as.numeric(tabela),
  Proporcao = proportions(tabela)
)

# Exibindo a tabela formatada
print(tabela_df)

# Box plot da variável flexão antes do tratamento sem disntinção entre grupos.
boxplot(fbef, xlab="flexão anterior", main="Flexão antes do tratamento", ylab="Ângulo de flexão")
hist(fbef, xlab = "Flexão anterior", main = "Histograma da variável flexão antes do tratamento", 
     ylab = "Freqência", breaks = brk,
     right = FALSE, # Parâmentro necessário para ajustar o histograma à tabela de frequência
     plot = TRUE, 
     xlim = range(brk), ylim = c(0, 25),
     xaxt = "n") # Retira os rótulos automáticos
axis(1, at = brk, labels = brk)  # Adiciona rótulos com base nos intervalos de classes adotados
shapiro.test(fbef)

# FIM das questões propostas na avaliação
#________________________________________


# Criando um subset com dados de flexão anterior e posterior para fins de comparação
dados_flexao <- subset(dados, grp=="treat")
dados_flexao

# Sumário estatístico
summary(dados_flexao)

# Gráfico comparativo do grupo de tratamento antes e após a intervenção
boxplot(dados_flexao$fbef, dados_flexao$faft, main="Flexão antes e após o tratamento",names=c("Antes", "Após"), ylab="Ângulo de flexão")

# Estendendo um pouco a análise só por curiosidade
# Teste de normalidade
shapiro.test(dados_flexao$fbef)
shapiro.test(dados_flexao$faft)

# Aplicação do teste não parmétrico para comparação dos dois grupos
wilcox.test(dados_flexao$fbef, dados_flexao$faft, paired = TRUE)
print("Os resultados dos testes sugerem a eficácia do tratamaneto no ganho de amplitura de flexão de pacientes com AS")

      