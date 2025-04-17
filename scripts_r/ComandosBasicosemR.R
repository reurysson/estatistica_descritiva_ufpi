# Comandos básicos no R

#----------- Operações básicas de calculadora ------------#
2+2
2*4
2-4
2^2
2^10
sqrt(25)
#--------------- Declarando Objetos ----------------#
a=2
a
b<-2^10
b
c=(2*a)^3
c

#listar objetos
ls()
rm(dados)
ls()
list=ls()
rm(list)
ls()

rm(list=ls(all=TRUE))#remove todos os objetos


obj1=c(1,2,3,4,5)
obj1
notas=c(5.6,6.7,7,9)
notas
alunos=c('Irineu',"Paulo","Pedro","Daniele")
alunos
avaliacao=c(1,1,1,1)
avaliacao
obj1*10
notas^2
notas2=c(10,8,8,9)
notas12=c(notas,notas2)
notas12

#comandos úteis:
rep1=rep(1,times=100)
rep1
a1=c(1,2,3,4,5,6,7,8,9,10)
a1
a2=1:10
a2
a3=seq(1,10)
a4=seq(1,10,by=0.2)
a4
a5=seq(1,100,2)
a5

rep(1,100)
rep(c(1,2),100)
rep(a1,3)
rep(a1,each=3)
rep(c(1,2),c(5,15))
rep("A",12)
letters[1:3]
LETTERS[1:10]

notasord=sort(notas2)
notasord

#---------- operadores lógicos
#igualdade: ==
#diferan?a: !=
#menor: <
#maior: >
#menor ou igual: <=
#maior ou igual? >=

notas>7
notas > 7
notas == 7
notas != 7
notas >= 7


#-------------------- uso dos colchetes

notas
notas[1]
notas[4]
notas[1:2]
notas[c(1,2)]
notas
notas[-1]
notas[-(1:2)]]
m1=matrix(c(1,8,9,10),2,2)
m1
m2=matrix(notas,2,2)
m2
m3=matrix(seq(1,10),5,2)
m3
m3[2,1]
m3[,1]
m3[2,]
m4=m3[1:2,]
m4
t(m4)#transposta
solve(m4)#inversa
det(m4)#determinante
eigen(m4)# autovalor e autovetor
eigen(m4)$values
valvet=eigen(m4)
valvet$values
valvet$vectors # ou:valvet$ve
valvet$values[1]

valvet[1]
valvet[2]

alunos
notas
notas2
notas12
avaliacao
avaliacao1=rep(c(1,2),c(4,4))
cbind(alunos,avaliacao1,notas12)
rbind(alunos,avaliacao1,notas12)

#---------------- dataframe --------------#
dados=data.frame(alunos,avaliacao1,notas12)
dados

dados1=data.frame(alu=c("A","B","C","A","B","C"),
ava=rep(c(1,2,3),c(2,2,2)),not=c(6,7,8,5,6,7))
dados1
class(dados1)


#-------------Leitura de banco de dados---#
rm(list=ls(all=TRUE))

getwd()

# Importando os dados de temperatura da cidade de Natal - RN
tempnatal=read.table("C:\\Users\\CAMINHO DO SEU DIRETÓRIO\\temp_natal.txt",h=T,dec=",")

tempnatal[1:5,] # Apresenta as cinco primeiras linhas da planilha
names(tempnatal) # Lista os nomes das variáaveis do banco de dados
temp # Acessa apenas uma variáveis, mas dará erro
tempnatal$temp # Opção para acessar uma unica variáveis do banco de dados

attach(tempnatal) # Desmembra a base de dados
temp
mes
ano


# Exemplos de gráficos 

plot(temp,type="b",col="blue")
plot(temp,type="l",col="green")
plot(temp,type="o",col="pink")
plot(temp,type="o",col="red",pch=4)

# Gráfico completo
plot(temp,type="o",col="red",pch="*",
     xlab="Tempo",ylab="Temperatura",ylim=c(22,30))
abline(h=mean(temp),col="blue",lty=3)


