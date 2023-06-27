#==============================================================================
#. Título: Introdução ao R (básico e funcional)
# Autor : José Cláudio Faria/UESC/DCET
# Data  : 06/04/2022 17:46:16
# Objetivos:
# =============================================================================
#... Script otimizado para uso no Tinn-R (https://tinn-r.org/pt/)
# =============================================================================

#==============================================================================
#.. Apresentar os recursos gráficos básicos do R
#.. Gerenciamento básico de pacotes
#.. Documentação e ajuda
#.. Operadores
#.. Funções elementares
#.. Estruturas de dados
#.. Estruturas de controle de fluxo
#.. Funções

#==============================================================================
#.. R: um software livre, gratuito, expansível e de qualidade!
#.. (Construído e mantido pela comunidade de usuários)
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
#... ENVIE AS INTRUÇÔES ABAIXO PARA O INTERPRETADOR R, LINHA POR LINHA, PARA SE
#... FAMILIARIZAR COM OS PRINCIPAIS RECURSOS
#==============================================================================

#==============================================================================
#. Alguns exemplos dos recursos gráficos básicos do R
#==============================================================================
demo(graphics,
     echo=FALSE,
     ask=TRUE)  # Recursos gráficos genéricos

demo()                                           # Lista os demos dos pacotes carregados na sessão

demo(package='stats')                            # Lista os demos do pacote stats

demo('lm.glm',                                   # Raoda o demo lm.glm do pacote stats
     package='stats')

system.file('demo',
            'lm.glm.R',
            package='stats')                     # Localiza o local físico do arquivo de um demo

demo(package=.packages(all.available=TRUE))      # Lista os demos de todos os pacotes instalados (carregados ou não)


#==============================================================================
#. Gerenciamento básico de pacotes
#==============================================================================
#.. Definir o repositório que o R irá usar em todas as sessões
# Deve-se definir um repositório o mais perto possível do usuário para tornar
# as intalações e atualizações de pacotes rápidas.

# URL dos mirrors
# https://cran.r-project.org/mirrors.html

# No Tinn-R (após iniciar o R) a sequência a seguir irá definir o
# repositório R escolhido para todas as sessões subsequentes
#... CTRL+F8 | R | Mirrors |  Mirrors (R): update
#... Escolha Name/City: Brazil (BA) [https] / Ilhéus
#... Mirrors (R): set as default repository

#.. Manejo básico de pacotes
# Listar os pacotes em uso na sessão
search()

# Carregar um pacote já instalado no computador para uso
library(cluster)
search()

# Instalar e carregar um pacote
install.packages('fdth')  # Instala no computador

library(fdth)             # Carrega para uso
search()                  # Observar presença do pactoe fdth no caminho de busca do R

# Atualizar todos os pacotes (deve ser feito periódicamente)


update.packages(ask=FALSE)                 # Básico

update.packages(checkBuilt=TRUE,
                ask=FALSE,
                instlib=.libPaths()[1L])   # Mais completo - feito pelo botão update da GUI

# Exemplo com o pacote 'zoo'
install.packages('zoo')
search()        # Foi instalado mas não está em uso

library(zoo)    # Está em uso
search()

# Remover um pacote do caminho de busca da sessão
detach(package:zoo)
search()

# Remover (do computador) um pacote não mais necessário
remove.packages('zoo')
library(zoo)    # Verificar mensagem de erro, pois foi removido do computador


#==============================================================================
#. Documentação e ajuda
#==============================================================================
?round
?'for'                  # ou ?"for"
?'[['                   # ou ?"[["

apropos('mean')
apropos('mean',
        ignore.case=F)
apropos('^mean')         # Expressão regular
apropos('mean$')         # Expressão regular

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
#.. Aritiméticos
#---------------------
# Operador  Descrição
#---------------------
# +	        adição
# -	        subtração
# *	        multiplicação
# /	        divisão
# ^ or **   exponenciação
# x %% y    verifica se a divisão é exata (módulo)
# x %/% y   divisão inteira

1 + 2
4 - 2
2 * 3
5 / 2
2^3
2 ** 3
4 %% 2       # exata = 0
5 %% 2       # não exata = 1
5 %/% 2      # apenas a parte inteira da divisão


#.. Lógicos
#---------------------
# Operador  Descrição
#---------------------
# <         menor que
# <=	       menor ou igual que
# >	        maior que
# >=	       maior ou igual que
# ==	       exatamente igual
# !=	       não igual a
# !x	       não x
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


#.. Atribuição
#---------------------
# Operador  Descrição
#---------------------
# <-     recebe valor
# ->	    atribui valor
# =	     atribui valor

(x <- 1)
x <- 1; x

(2 -> x)
(x = 3)


#.. Extração e substituição
#---------------------
# Operador  Descrição
#---------------------
# []       usado em: vetor, matrix, array, frame e lista
# [[]]	    usado em: vetor, matrix, array, frame e lista
# $	      usado em: frame, lista

# Extração
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

# Atribuição
x[5] <- 999; x
L[1] <- NULL; L

# Definindo operadores próprios
# são funções com dois argumentos cujo nome começa e as extremidades em %
'%mop%' <- function(x, y) x * y
100 %mop% (1:10)

mult <- function(x, y) x * y
mult(100, 1:10)


#==============================================================================
#. Algumas funções elementares
#==============================================================================
# set.seed: Semente para poder reproduzir instruções aleatórias
# (runif nesse caso) sempre que necessário
set.seed(25)
(x <- round(runif(n=20,
                  min=0,
                  max=10),
            digits=2))

length(x)    # Número de elementos
min(x)
max(x)
sort(x)
sort(x,
     dec=T)

median(x)    # Mediana
mean(x)      # Média
var(x)       # Variância
sd(x)        # Desvio padrão (standard deviation)
sqrt(var(x)) # Desvio padrão
sum(x)       # Somatório
round(x)
round(x,
      digits=1)

# Quantil arbitrário
quantile(x,
         c(0, .33, .66, 1))

1:10
cumsum(1:10)
cumprod(1:10)

# Imprimir no console uma mensagem ou o valor de uma variável
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

# Algumas operações básicas:
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
             replace=T))  # Entre parênteses atribui e mostra
sort(x)
unique(x)

# Mão na roda pra dar entrada de dados externos no R!
# Coloque o vetor abaixo na área de transferência:
# selecione e tecle (CTRL+C)
# 10,2 08,7 09,5 12,0 09,0 11,2 12,5 10,9 08,9 10,6

# Mande essa instrução para o R
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

# O traço de uma matriz:
sum(diag(m))

# A inversa de uma matriz:
solve(m)
solve(m, x)     # solução de sistemas lineares
solve(m) %*% x  # ídem


#===============
#. Arrays
#===============
# 2 linhas, 4 colunas, 3 dimensões
(ar <- array(letters[1:24],
             c(2, 4, 3)))
class(ar)

ar[1,1,1]       # ar[linha, coluna, dimensão] -> ar(x, y, z)
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
levels(l)  # observar a diferenças de fator!

levels(x)

set.seed(17)
(x <- factor(sample(l,
                    5,
                    rep=T)))
levels(x)

# Pode-se preferir uma tabela:
table(x)
table(l)

# Se os valores estão de acordo com alguma razão, pode-se gerar níveis:
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

## O comando expand.grid é comparável (ele produz um frame), sendo muito útil
## para a geração de níveis de fatores para as matrizes provenientes de dados
## experimentais:
#a   <- c('a1', 'a2', 'a3')
#b   <- c('b1', 'b2')
#c   <- c('c1', 'c2')
#dad <- expand.grid(a, b, c)
#names(dad) <- c('A', 'B', 'C')
#dad

# Problemas na atribuição de fatores
x
xn <- as.numeric(x)

x[1] <- 9  # Erro!
x          # Observar <NA>

# Contornando a limitação
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
# que contém:
str(dF)

# A instrução 'summary' sumariza um objeto (aqui, um frame, mas vai bem com
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
# Obs: Não deve esquecer-se de destacá-lo detach() quando terminar!
attach(dF)
  summary(A)
  table(B)
detach(dF) # Nunca esqueça do detach após um attach!!!

# Opção melhor!
with(dF,
     summary(A))

# Seleção de data.frames pelo valor das colunas
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

# Usando o pacote sqldf (mão na roda!)
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

# Exemplo, os parâmetros gráficos são armazenados em uma lista
str(par())  # a função par abre um novo dispositivo gráfico
par(pch=19, cex=2)

# Indexando
l2$s3[l2$s3 >= 5 &
      l2$s3 < 9]

l2['s4']
l2['s4']/2
l2[['s4']]/2  # OK

length(l2['s4'])    # Observar a diferença com abaixo
length(l2[['s4']])  # Observar a diferença com acima

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
# Uma família que não para de crescer!
# mapply, ...
# O comando apply torna possível aplicar uma função (para o exemplo, a média)
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

# Em dimensões mais elevadas:
# (Exercício)
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

# A função tapply permite reagrupar as observações de acordo com o valor dos
# fatores e uma função (média, soma, etc..) para cada grupo obtido:
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

# A função sapply aplica a cada elemento de uma lista (ou de um vetor, etc..) e
# se possível retorna um vetor:
set.seed(2012)
(x <- list(a=rnorm(5),
           b=runif(10),
           c=rgamma(15, 1)))

sapply(x,
       sd)

# A função lapply faz a mesma coisa, mas retorna uma lista:
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
#. Conexão:
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
    cat('não\n')

  a <- a + 1  # Expressão avaliada..
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
    cat('não\n')

  if (a == 10) break
}


#==============================================================================
#. Funções
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

# Na chamada da função, pode-se usar o nome dos argumentos, passar novos valores
# para as variáveis, não sendo necessário que os mesmos sigam a ordem declarada
# na função (desde que os valores sejam acompanhados dos respectivos nomes):
f(y=1, x=10)
f(1, 10)

f <- function(x, y)
{
  x/10 + 1 - y
}

f(1, 10)
f(10, 1)

# No fim dos argumentos, pode haver três pontos, representando todos os
# argumentos não especificados:
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
   pch=19)           # 'pch' é um argumento da função plot
                     # que não foi especificado na função 'mf'

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
