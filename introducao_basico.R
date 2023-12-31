#==============================================================================
#. T�tulo: Introdu��o ao R (b�sico e funcional)
# Autor : Jos� Cl�udio Faria/UESC/DCET
# Data  : 06/04/2022 17:46:16
# Objetivos:
# =============================================================================
#... Script otimizado para uso no Tinn-R (https://tinn-r.org/pt/)
# =============================================================================

#==============================================================================
#.. Apresentar os recursos gr�ficos b�sicos do R
#.. Gerenciamento b�sico de pacotes
#.. Documenta��o e ajuda
#.. Operadores
#.. Fun��es elementares
#.. Estruturas de dados
#.. Estruturas de controle de fluxo
#.. Fun��es

#==============================================================================
#.. R: um software livre, gratuito, expans�vel e de qualidade!
#.. (Constru�do e mantido pela comunidade de usu�rios)
#..
#...                               ^
#...                              /'\
#...                             /-.-\
#...                            /-----\
#...                          </   R   \>
#...                        <</---------\>>
#..                           BEM  |  VINDO
#...            <<</---------------------------------\>>>
#                 ---'---   ---'---   ---'---   ---'---
#             ... | bas |   | sta |   | gra |   | dat | ...
#                 -------   -------   -------   -------
#                     \-------/           \-------/
#                      ---'---             ---'----
#                  ... | car |             | MASS | ...
#                      -------             --------
#                          \-----------------/
#                                ---'---
#                            ... | xxxx | ...
#                                -------
#                                  ...
#==============================================================================

#==============================================================================
#... ENVIE AS INTRU��ES ABAIXO PARA O INTERPRETADOR R, LINHA POR LINHA, PARA SE
#... FAMILIARIZAR COM OS PRINCIPAIS RECURSOS
#==============================================================================

#==============================================================================
#. Alguns exemplos dos recursos gr�ficos b�sicos do R
#==============================================================================
demo(graphics,
     echo=FALSE,
     ask=TRUE)  # Recursos gr�ficos gen�ricos

demo()                                           # Lista os demos dos pacotes carregados na sess�o

demo(package='stats')                            # Lista os demos do pacote stats

demo('lm.glm',                                   # Raoda o demo lm.glm do pacote stats
     package='stats')

system.file('demo',
            'lm.glm.R',
            package='stats')                     # Localiza o local f�sico do arquivo de um demo

demo(package=.packages(all.available=TRUE))      # Lista os demos de todos os pacotes instalados (carregados ou n�o)


#==============================================================================
#. Gerenciamento b�sico de pacotes
#==============================================================================
#.. Definir o reposit�rio que o R ir� usar em todas as sess�es
# Deve-se definir um reposit�rio o mais perto poss�vel do usu�rio para tornar
# as intala��es e atualiza��es de pacotes r�pidas.

# URL dos mirrors
# https://cran.r-project.org/mirrors.html

# No Tinn-R (ap�s iniciar o R) a sequ�ncia a seguir ir� definir o
# reposit�rio R escolhido para todas as sess�es subsequentes
#... CTRL+F8 | R | Mirrors |  Mirrors (R): update
#... Escolha Name/City: Brazil (BA) [https] / Ilh�us
#... Mirrors (R): set as default repository

#.. Manejo b�sico de pacotes
# Listar os pacotes em uso na sess�o
search()

# Carregar um pacote j� instalado no computador para uso
library(cluster)
search()

# Instalar e carregar um pacote
install.packages('fdth')  # Instala no computador

library(fdth)             # Carrega para uso
search()                  # Observar presen�a do pactoe fdth no caminho de busca do R

# Atualizar todos os pacotes (deve ser feito peri�dicamente)


update.packages(ask=FALSE)                 # B�sico

update.packages(checkBuilt=TRUE,
                ask=FALSE,
                instlib=.libPaths()[1L])   # Mais completo - feito pelo bot�o update da GUI

# Exemplo com o pacote 'zoo'
install.packages('zoo')
search()        # Foi instalado mas n�o est� em uso

library(zoo)    # Est� em uso
search()

# Remover um pacote do caminho de busca da sess�o
detach(package:zoo)
search()

# Remover (do computador) um pacote n�o mais necess�rio
remove.packages('zoo')
library(zoo)    # Verificar mensagem de erro, pois foi removido do computador


#==============================================================================
#. Documenta��o e ajuda
#==============================================================================
?round
?'for'                  # ou ?"for"
?'[['                   # ou ?"[["

apropos('mean')
apropos('mean',
        ignore.case=F)
apropos('^mean')         # Express�o regular
apropos('mean$')         # Express�o regular

help.search('mean')

help.start()            # ou menu 'Help/Html help
vignette()              # Documentos em pdf (dependente dos pacotes instalados)
vignette('grid')        # Abre pdf relacionado ao pacote grid

install.packages('sos')
library(sos)
findFn('biplot')


#==============================================================================
#. Operadores
#==============================================================================
#.. Aritim�ticos
#---------------------
# Operador  Descri��o
#---------------------
# +	        adi��o
# -	        subtra��o
# *	        multiplica��o
# /	        divis�o
# ^ or **   exponencia��o
# x %% y    verifica se a divis�o � exata (m�dulo)
# x %/% y   divis�o inteira

1 + 2
4 - 2
2 * 3
5 / 2
2^3
2 ** 3
4 %% 2       # exata = 0
5 %% 2       # n�o exata = 1
5 %/% 2      # apenas a parte inteira da divis�o


#.. L�gicos
#---------------------
# Operador  Descri��o
#---------------------
# <         menor que
# <=	       menor ou igual que
# >	        maior que
# >=	       maior ou igual que
# ==	       exatamente igual
# !=	       n�o igual a
# !x	       n�o x
# x | y     x ou y
# x & y     x e y

2 <  1
2 <= 1
2 <= 2
1 >  2
2 == 2; 2 == 3
1 != 1
1 != 2
!TRUE

x <- 1:10
names(x) <- letters[1:length(x)]; x

x[(x < 3) | (x > 8)]
x[(x < 5) & (x > 5)]
x[(x <= 5) & (x >= 5)]


#.. Atribui��o
#---------------------
# Operador  Descri��o
#---------------------
# <-     recebe valor
# ->	    atribui valor
# =	     atribui valor

(x <- 1)
x <- 1; x

(2 -> x)
(x = 3)


#.. Extra��o e substitui��o
#---------------------
# Operador  Descri��o
#---------------------
# []       usado em: vetor, matrix, array, frame e lista
# [[]]	    usado em: vetor, matrix, array, frame e lista
# $	      usado em: frame, lista

# Extra��o
(x <- 1:10)
names(x) <- letters[1:length(x)]; x

x[6]
x[c(1:2, 9:10)]
x[x >= 8]


(L <- list(x=c(4, 6, 8),
           y=TRUE,
           z=letters[1:6]))
L[1]
L[1] / 2     # erro proposital
L[[1]]
L[[1]] / 2

L$z[1:3]
L$z[c(1:2, 6)]

str(iris)            # iris: conjunto de dados do pacote datasets
iris$Species
table(iris$Species)

# Atribui��o
x[5] <- 999; x
L[1] <- NULL; L

# Definindo operadores pr�prios
# s�o fun��es com dois argumentos cujo nome come�a e as extremidades em %
'%mop%' <- function(x, y) x * y
100 %mop% (1:10)

mult <- function(x, y) x * y
mult(100, 1:10)


#==============================================================================
#. Algumas fun��es elementares
#==============================================================================
# set.seed: Semente para poder reproduzir instru��es aleat�rias
# (runif nesse caso) sempre que necess�rio
set.seed(25)
(x <- round(runif(n=20,
                  min=0,
                  max=10),
            digits=2))

length(x)    # N�mero de elementos
min(x)
max(x)
sort(x)
sort(x,
     dec=T)

median(x)    # Mediana
mean(x)      # M�dia
var(x)       # Vari�ncia
sd(x)        # Desvio padr�o (standard deviation)
sqrt(var(x)) # Desvio padr�o
sum(x)       # Somat�rio
round(x)
round(x,
      digits=1)

# Quantil arbitr�rio
quantile(x,
         c(0, .33, .66, 1))

1:10
cumsum(1:10)
cumprod(1:10)

# Imprimir no console uma mensagem ou o valor de uma vari�vel
print('Teste:')
x <- 10
x
print(x)


#==============================================================================
#. Estruturas de dados: MUITO IMPORTANTE!!!
#==============================================================================
#===============
#. Vetores
#===============
# Algumas das diversas formas de criar:
c(1, 2, 3, 4, 5)
1:6

seq(from=1,
    to=10,
    by=1)

seq(1,
    2,
    length=10)

letters[1:5]
LETTERS[1:5]
c(a=1, b=5, c=10)

# Algumas formas de indexar:
x <- seq(1,
         10,
         by=1)

names(x) <- letters[1:length(x)]; x

x[5:10]
x[c(5, 7:10)]
x[-(5:10)]
x > 5
x[x > 5]
x[x <= 6]

# Indexando pelo nome
x
x['b']

# Algumas opera��es b�sicas:
set.seed(3)
x <- round(runif(5,
                 0,
                 10),
           d=1)
names(x) <- letters[1:length(x)]; x

x/2
x*2
x+10

sort(x)

sort(x,
     dec=T)

rev(sort(x))    # idem anterior

set.seed(16)
(x <- sample(1:5,
             10,
             replace=T))  # Entre par�nteses atribui e mostra
sort(x)
unique(x)

# M�o na roda pra dar entrada de dados externos no R!
# Coloque o vetor abaixo na �rea de transfer�ncia:
# selecione e tecle (CTRL+C)
# 10,2 08,7 09,5 12,0 09,0 11,2 12,5 10,9 08,9 10,6

# Mande essa instru��o para o R
A <- scan(dec=',')
#1: Cole o vetor (CTRL+V)
#11: CTRL+ENTER para encerrar

A


#===============
#. Matrizes
#===============
(m <- matrix(c(1, 2, 3, 4),
             nrow=2))
m[1,2]

# O produto matricial:
(x <- matrix(c(6, 7),
             nrow=2))
m %*% x

# O determinante de uma matriz:
det(m)

# A transposta de uma matriz:
t(m)

# Uma matriz diagonal:
diag(c(1,2))

# A identidade da matriz:
diag(x=10,
     nrow=2)

diag(nrow=2)

diag(rep(1, 3))
diag(2)

# Comandos cbind e o rbind para criar matrizes:
cbind(c(1, 2),
      c(3, 4))

rbind(c(1, 3),
      c(2, 4))

# O tra�o de uma matriz:
sum(diag(m))

# A inversa de uma matriz:
solve(m)
solve(m, x)     # solu��o de sistemas lineares
solve(m) %*% x  # �dem


#===============
#. Arrays
#===============
# 2 linhas, 4 colunas, 3 dimens�es
(ar <- array(letters[1:24],
             c(2, 4, 3)))
class(ar)

ar[1,1,1]       # ar[linha, coluna, dimens�o] -> ar(x, y, z)
ar[1,1,2]
ar[1,2,3]

class(iris3)    # iris3: array localizado no pacote datasets
iris3


#===============
#. Fatores
#===============
set.seed(218)
(x <- factor(sample(c('a', 'b', 'c'),
                    5,
                    replace=T)))
class(x)

(l <- c('d', 'e', 'f'))
class(l)
levels(l)  # observar a diferen�as de fator!

levels(x)

set.seed(17)
(x <- factor(sample(l,
                    5,
                    rep=T)))
levels(x)

# Pode-se preferir uma tabela:
table(x)
table(l)

# Se os valores est�o de acordo com alguma raz�o, pode-se gerar n�veis:
gl(n=1,
   k=4)

gl(2, 4)
gl(2, 4,
   labels=c(T, F))

gl(2, 4,
   labels=c('a', 'b'))

gl(n=2,
   k=1,
   length=8)

gl(2, 1, 8,
   labels=c(T, F))

# Pode fazer o produto cartesiano de dois fatores:
(x <- gl(2, 4))
(y <- gl(2,
         1,
         length=8))

interaction(x, y)

## O comando expand.grid � compar�vel (ele produz um frame), sendo muito �til
## para a gera��o de n�veis de fatores para as matrizes provenientes de dados
## experimentais:
#a   <- c('a1', 'a2', 'a3')
#b   <- c('b1', 'b2')
#c   <- c('c1', 'c2')
#dad <- expand.grid(a, b, c)
#names(dad) <- c('A', 'B', 'C')
#dad

# Problemas na atribui��o de fatores
x
xn <- as.numeric(x)

x[1] <- 9  # Erro!
x          # Observar <NA>

# Contornando a limita��o
str(x)
str(xn)

xn[1:3] <- 99
xn


#===============
#. Data.frame
#===============
set.seed(17)
dF <- data.frame(x=rnorm(10,
                         m=10,
                         s=2),
                 y=sample(c(T, F),
                          10,
                          replace=T))
dF

# O comando str informa (retorna) a estrutura de um objeto e a parte dos dados
# que cont�m:
str(dF)

# A instru��o 'summary' sumariza um objeto (aqui, um frame, mas vai bem com
# quase todos objetos):
summary(dF)

# Pode-se ter acesso aos dados das colunas de diversas maneiras:
dF
dF$x
dF[,1]
dF[['x']]
dim(dF)
names(dF)
row.names(dF)

# Pode-se mudar o nome das linhas ou das colunas:
dF
names(dF) <- LETTERS[1:ncol(dF)]
row.names(dF) <- letters[1:nrow(dF)]
dF

# Pode-se ter acesso direto as colunas de um frame usando o comando attach().
# Obs: N�o deve esquecer-se de destac�-lo detach() quando terminar!
attach(dF)
  summary(A)
  table(B)
detach(dF) # Nunca esque�a do detach ap�s um attach!!!

# Op��o melhor!
with(dF,
     summary(A))

# Sele��o de data.frames pelo valor das colunas
dF
subset(dF,
       sub=(A > 10))

subset(dF,
       sub=(B == TRUE))

subset(dF,
       sub=(A > 10) & (B == TRUE))

# Ordenando um data.frame pelos valores das coluna
(rk <- head(rock, 9))

rk[order(rk$perm, rk$peri), ]
rk[order(rk$perm, rk$peri, decreasing=c(TRUE, TRUE)), ]

# Usando o pacote sqldf (m�o na roda!)
library(sqldf)
sqldf('SELECT perm, peri, area
       FROM rk
       Order BY perm, peri')


#===============
#. Lista
#===============
# Gerando listas
l1 <- list()
l1[['foo']] <- 1
l1[['bar']] <- c('a', 'b', 'c')
str(l1)

l2 <- list(s1=iris,
           s2=Titanic,
           s3=1:10,
           s4=matrix(1:12,
                     nr=3,
                     nc=4))
str(l2)

# Indexando listas
l1
l1[['bar']] <- NULL
str(l1)
l1

# Exemplo, os par�metros gr�ficos s�o armazenados em uma lista
str(par())  # a fun��o par abre um novo dispositivo gr�fico
par(pch=19, cex=2)

# Indexando
l2$s3[l2$s3 >= 5 &
      l2$s3 < 9]

l2['s4']
l2['s4']/2
l2[['s4']]/2  # OK

length(l2['s4'])    # Observar a diferen�a com abaixo
length(l2[['s4']])  # Observar a diferen�a com acima

l2$s4
l2$s4[, 1:2]

l2$s4
l2$s4[1, 4]
l2$s4[, 4]

l2['s3']
l2['s3']/2     # Observar erro
l2[['s3']]/2   # OK
l2$s3/2        # OK


#===============================
#. apply, tapply, lapply, sapply
#===============================
# Uma fam�lia que n�o para de crescer!
# mapply, ...
# O comando apply torna poss�vel aplicar uma fun��o (para o exemplo, a m�dia)
# a cada coluna (ou linha) de um frame (ou de uma matriz):
(dF <- data.frame(x=1:10,
                  y=1:10,
                  z=1:10))

# Marginal nas linhas
apply(dF,
      1,
      mean)

apply(dF[1:3,],
      1,
      mean)

apply(dF,
      1,
      sd)

# Marginal nas colunas
apply(dF,
      2,
      mean)

apply(dF,
      2,
      var)

# Em dimens�es mais elevadas:
# (Exerc�cio)
#(m <- array(1:24,
#            dim=c(4, 3, 2)))
#
#apply(m,
#      1,
#      mean)
#
#mean(c( 1,  5,  9,
#       13, 17, 21)) # Observe!
#
#apply(m,
#      c(1, 2),
#      mean)
#
#mean(c(1, 13))      # Observe!

# A fun��o tapply permite reagrupar as observa��es de acordo com o valor dos
# fatores e uma fun��o (m�dia, soma, etc..) para cada grupo obtido:
tapply(1:10,
       gl(2, 5),
       mean)

tapply(1:10,
       gl(2, 5),
       sum)

by(1:10,
   gl(2, 5),
   mean)

by(1:10,
   gl(2, 5),
   sum)

# A fun��o sapply aplica a cada elemento de uma lista (ou de um vetor, etc..) e
# se poss�vel retorna um vetor:
set.seed(2012)
(x <- list(a=rnorm(5),
           b=runif(10),
           c=rgamma(15, 1)))

sapply(x,
       sd)

# A fun��o lapply faz a mesma coisa, mas retorna uma lista:
lapply(x,
       sd)


#==============================================================================
#. Estruturas de controle
#==============================================================================
set.seed(15)
(x <- round(rnorm(10)))

(y <- ifelse(x > 0,
             1,
             -1))

(z <- ifelse(x > 0,
             1,
             ifelse(x < 0,
                    '< zero',
                    0)))


#===============
#. Conex�o:
#===============
x <- 'a'
y <- switch(x,
            a='Bonjour',
            b='Gutten Tag',
            c='Hello',
            d='Konnichi wa')
y


#===============
#. Loop for:
#===============
for (i in 1:10) {
  print(i)
  print('oi')
}

for (i in 2:9)
  ifelse (i <= 5,
          print(i),
          print(paste(i,
                      '5',
                      sep=' > ')))


#===============
#. Loop while:
#===============
a <- 0
while (a < 11)
{
  if (a >= 3)
    print(a)
  else
    cat('n�o\n')

  a <- a + 1  # Express�o avaliada..
}


#===============
#. Loop repeat:
#===============
a <- 0
repeat
{
  a <- a + 1

  if (a >= 3)
    print(a)
  else
    cat('n�o\n')

  if (a == 10) break
}


#==============================================================================
#. Fun��es
#==============================================================================
f <- function(x)
  x/10 + 1

f()      # erro!
f(x=10)
f(10)    # Chamada alternativa

f <- function(x)
{
  x/10 + 1
}

f()      # erro!
f(x=10)
f(10)    # Chamada alternativa

# Pode atribuir valores aos argumentos:
f <- function(x, y=3)
{
  x/10 + 1 - y
}

f(10)

# Na chamada da fun��o, pode-se usar o nome dos argumentos, passar novos valores
# para as vari�veis, n�o sendo necess�rio que os mesmos sigam a ordem declarada
# na fun��o (desde que os valores sejam acompanhados dos respectivos nomes):
f(y=1, x=10)
f(1, 10)

f <- function(x, y)
{
  x/10 + 1 - y
}

f(1, 10)
f(10, 1)

# No fim dos argumentos, pode haver tr�s pontos, representando todos os
# argumentos n�o especificados:
mf <- function(x,
               y,
               cex1=1,
               cex2=3, ...)
{
  par(mfrow=c(2,1))
  plot(x, cex=cex1, ...)
  plot(y, cex=cex2, ...)
}

mf(x=1:10,
   y=1:10)

mf(x=1:10,
   y=1:10,
   pch=19)           # 'pch' � um argumento da fun��o plot
                     # que n�o foi especificado na fun��o 'mf'

mf(x=1:10,
   y=1:10,
   pch=19,           # Idem
   col=rainbow(3))   # Idem

mf(x=1:10,
   y=1:10,
   pch=19,           # Idem
   col=rainbow(10),  # Idem
   xlab='',          # Idem
   main='Teste')     # Idem
