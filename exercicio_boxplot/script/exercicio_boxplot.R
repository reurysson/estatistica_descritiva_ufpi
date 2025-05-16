# Universidade Federal do Piauí
# Centro de Ciências da Natureza
# Curso: Bacharelado em Estatpistica
# Prof.ª Dr.ª Rita Idalino
# Discente: Reurysson Morais

# Exercício - Box Plot
# Questão Única: Construção e interpretação do box plor

dados <- c(50,60,70,80,90,100,100,110,120,130,140,150,150,160,170,180,200,250,300,400)

# Sumário Estatístico
summary(dados)

# Intervalo Interquartil
iiq <- quantile(dados, 0.75)-quantile(dados, 0.25)
iiq

# Análise Gráfica
boxplot(dados, xlab="Dados", main="Nº de visitantes em museus de Arqueologia
        ", ylab="Frequência")

# Interpretação:

# A estrutura apresentada pelo box plot sugere que o número de visitantes nos museus de arqueologia 
# segue uma distribuição aproximadamente simétrica, em que cerca de 50% dos museus recebem entre 97,5 e 172,5
# visitantes no período considerado. Observa-se, ainda, o interesse por dois museus em específicos que registraram
# expressivo número de visitante (300 e 400), considerados outliers. 