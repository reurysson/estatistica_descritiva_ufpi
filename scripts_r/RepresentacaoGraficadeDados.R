# Estatística Descritiva - 04/04/2025
# Representação gráfica de dados


# Gráfico de Barras 
# Dados fictícios de vendas por categoria

categorias <- c("Eletrônicos", "Roupas",
                "Livros", 
                "Alimentos")
vendas <- c(120, 200, 150, 180)

# Criar o dataframe
dados <- data.frame(Categoria = categorias, 
                    Vendas = vendas)

# Instalar e carregar a biblioteca ggplot2 (caso ainda não tenha instalado)
install.packages("ggplot2")
library(ggplot2)

# Criar o gráfico de barras horizontais
grafico_barras_horizontais <- ggplot(dados,
                        aes(x = Vendas, 
                                                y = Categoria)) +
  geom_bar(stat = "identity", fill = 
             "lightblue") +
  
  labs(title = "Vendas por Categoria",
       x = "Vendas", 
       y = "Categoria")

# Exibir o gráfico

print(grafico_barras_horizontais)


# Gráfico de Barras
# Dados fictícios de vendas por categoria
categorias <- c("Eletrônicos", "Roupas", "Livros", "Alimentos")
vendas <- c(120, 200, 150, 180)

# Criar o dataframe
dados <- data.frame(Categoria = categorias, Vendas = vendas)


# Criar o gráfico de Colunas
grafico_barras <- ggplot(dados, aes(x = Categoria, y = Vendas)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Vendas por Categoria", x = "Categoria", y = "Vendas")

# Exibir o gráfico
print(grafico_barras)

# Forma alternativa (simples)
# Dados fictícios de vendas por categoria
categorias <- c("Eletrônicos", "Roupas", "Livros", "Alimentos")
vendas <- c(120, 200, 150, 180)
# Criar o dataframe
dados <- data.frame(Categoria = categorias, 
                    Vendas = vendas)

# Criar o gráfico de barras
# Converter as categorias em fatores para 
# garantir a ordem correta no gráfico
dados$Categoria <- factor(dados$Categoria,
                      levels = categorias)

# Criar o gráfico de barras usando a função barplot
# Definir as cores das barras usando o vetor de cores
cores <- c("skyblue", "lightgreen",
           "salmon", "orange")
barplot(dados$Vendas, 
        names.arg = dados$Categoria, 
        col = cores, 
        main = "Vendas por Categoria", 
        xlab = "Categoria", ylab = "Vendas")



# Gráfico de colunas múltiplas
# Dados fictícios de vendas por categoria ao 
# longo de três períodos de tempo

categorias <- c("Eletrônicos", "Roupas",
                "Livros", "Alimentos")
periodo1 <- c(120, 200, 150, 180)
periodo2 <- c(130, 190, 160, 175)
periodo3 <- c(125, 205, 155, 185)

# Criar o dataframe
dados <- data.frame(Categoria = categorias, 
                    Periodo1 = periodo1, 
                    Periodo2 = periodo2, 
                    Periodo3 = periodo3)

# Transformar os dados para o formato longo
library(tidyr)
dados_longos <- gather(dados, Periodo, 
                       Vendas,-Categoria)

# Criar o gráfico de colunas múltiplas
grafico_colunas_multiplas <- ggplot(dados_longos, 
                          aes(x = Categoria, 
                          y = Vendas, fill = Periodo)) +
                          geom_col(position = "dodge", 
                                   width = 0.7) +
        labs(title = "Vendas por Categoria e Período",
         x = "Categoria", 
         y = "Vendas", fill = "Período")

# Exibir o gráfico
print(grafico_colunas_multiplas)

# Gráfico de Setores (Pizza)

# Dados fictícios de vendas por categoria
categorias <- c("Eletrônicos", "Roupas", "Livros", "Alimentos")
vendas <- c(120, 200, 150, 180)

# Criar o dataframe
dados <- data.frame(Categoria = categorias, Vendas = vendas)

# Criar o gráfico de setores
grafico_setores <- ggplot(dados, aes(x = "", y = Vendas, fill = Categoria)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Distribuição de Vendas por Categoria")

# Exibir o gráfico
print(grafico_setores)

# Refazendo de uma maneira simples

# Dados fictícios de vendas por categoria
categorias <- c("Eletrônicos", "Roupas", 
                "Livros", "Alimentos")
vendas <- c(120, 200, 150, 180)

# Criar o dataframe
dados <- data.frame(Categoria = categorias,
                    Vendas = vendas)

# Criar o gráfico de setores
pie(dados$Vendas, labels = dados$Categoria, 
    col = rainbow(length(categorias)), 
    main = "Distribuição de Vendas por 
    Categoria")



#Gráfico de linhas 
# Dados fictícios de vendas ao longo de três meses
meses <- c("Janeiro", "Fevereiro", "Março")
vendas <- c(100, 120, 150)

# Criar o dataframe
dados <- data.frame(Mês = factor(meses, levels = meses), Vendas = vendas)

# Criar o gráfico de linhas
grafico_linhas <- ggplot(dados, aes(x = Mês, y = Vendas, group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Vendas ao Longo dos Meses", x = "Mês", y = "Vendas")

# Exibir o gráfico
print(grafico_linhas)

# Refazendo de uma maneira simples
# Exemplo I
v <- c(17, 25, 38, 13, 41)
plot(v, type = "o")
plot(v, type = "l")

# Exemplo II

v <- c(17, 25, 38, 13, 41)
t <- c(22, 19, 36, 19, 23)
m <- c(25, 14, 16, 34, 29)

plot(v, type = "o", col = "red",
     xlab = "Meses", ylab = "---",
     main = "Gráfico de linhas")

lines(t, type = "o", col = "blue")
lines(m, type = "o", col = "green")

# Gráfico de dispersão

# Dados fictícios de altura e peso
altura <- c(160, 165, 170, 175, 180)
peso <- c(60, 65, 70, 75, 80)

# Criar o dataframe
dados <- data.frame(Altura = altura, Peso = peso)

# Criar o gráfico de dispersão
plot(dados$Altura, dados$Peso, pch = 16, 
     col = "blue", xlab = "Altura (cm)", 
     ylab = "Peso (kg)",
     main = "Gráfico de Dispersão")
cor(altura,peso)

# No ggplot

# Criar o gráfico de dispersão com ggplot2
grafico_dispersao <- ggplot(dados, aes(x = Altura, y = Peso)) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Gráfico de Dispersão", x = "Altura (cm)", y = "Peso (kg)")

# Exibir o gráfico
print(grafico_dispersao)

# Histograma 

# Carregar a biblioteca ggplot2 (caso ainda não tenha instalado)
# install.packages("ggplot2")
library(ggplot2)

# Gerar dados fictícios de notas
set.seed(42)  # Define uma semente para reprodução dos resultados
notas <- round(rnorm(100, mean = 70, sd = 10))  # Gera 100 notas aleatórias com média 70 e desvio padrão 10

# Criar o dataframe
dados_notas <- data.frame(Notas = notas)

# Criar o histograma com ggplot2
grafico_histograma_notas <- ggplot(dados_notas, aes(x = Notas)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Histograma de Notas", x = "Notas", y = "Frequência")

# Exibir o gráfico
print(grafico_histograma_notas)

# Boxplot
# Gerar dados fictícios de notas de duas turmas
set.seed(42)  # Define uma semente para reprodução dos resultados
notas_turma1 <- round(rnorm(50, mean = 70, sd = 10))
notas_turma2 <- round(rnorm(50, mean = 75, sd = 10))

# Criar o dataframe
dados_notas <- data.frame(Turma = c(rep("Turma 1", 
                                  50), 
                                  rep("Turma 2", 50)),
                          Notas = c(notas_turma1, 
                                    notas_turma2))

# Criar o box plot com ggplot2
grafico_boxplot <- ggplot(dados_notas, aes(x = Turma, y = Notas, fill = Turma)) +
  geom_boxplot() +
  labs(title = "Box Plot das Notas por Turma", x = "Turma", y = "Notas") +
  theme_minimal()

# Exibir o gráfico
print(grafico_boxplot)

# Forma alternativa sem uso do ggplot
# Gerar dados fictícios de notas de duas turmas
set.seed(42)  # Define uma semente para reprodução dos resultados
notas_turma1 <- round(rnorm(50, mean = 70, sd = 10))
notas_turma2 <- round(rnorm(50, mean = 75, sd = 10))

# Criar o dataframe
dados_notas <- data.frame(Turma = c(rep("Turma 1", 50), rep("Turma 2", 50)),
                          Notas = c(notas_turma1, notas_turma2))

# Criar o box plot
boxplot(Notas ~ Turma, data = dados_notas, 
        col = c("skyblue", "lightgreen"), xlab = "Turma", ylab = "Notas", main = "Box Plot das Notas por Turma")

