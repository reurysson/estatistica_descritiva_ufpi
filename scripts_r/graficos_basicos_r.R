# Gráfico de Barras
# Dados fictícios de vendas por categoria

categorias <- c("Eletrônicos", "Roupas", "Livros", "Alimentos")
vendas <- c(120, 200, 150, 180)

# Criar o dataframe
dados <- data.frame(Categoria = categorias, Vendas = vendas)
dados

# Instalar e carregar o pacote ggplot2
#install.packages("ggplot2")
library(ggplot2)

dados
# Criar grafico de barras horizontais
barras_horiz <- ggplot(dados, 
                       aes(x=Vendas, geom_bar(stat="identity", fill="lightblue") +
                             labs(title="Vendas por Categoria", x="Vendas", y="Categoria")
print(barras_horiz)

dados$Categoria <- factor(dados$Categoria, levels = categorias)

cores <- c("skyblue", "lightgreen", "salmon", "orange")
barplot(dados$Vendas, 
        names.arg = dados$Categoria,
        col = cores,
        main = "Vendas por Categoria",
        xlab = "Categoria", 
        ylab = "Vendos")

dados
# Gráficos de setores
pie(dados$Vendas, labels = dados$Categoria,
    col = rainbow(length(categorias)),
    main = "Distribuição de Vendas por Categoria")

