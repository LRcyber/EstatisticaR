#===============================================================================
# Name   : Introdu��o � estat�stica com R
# Author : Jos� Cl�udio Faria
# Date   : 30/08/2021 08:01:25
# Aim    : Ilustrar alguns conceitos b�sicos de introdu��o � estat�stica
# Mail   : <<<joseclaudio.faria@gmail.com>>>
#===============================================================================

#. POPULA��O VS. AMOSTRA
# Popula��o: gerando um vetor para ilustrar o conceito
set.seed(1)
pop <- rnorm(1e5,
             mean=10,
             sd=2)         # popula��o finita com distribui��o normal

#. Explora��o gr�fica
hist(pop,
     col='darkgreen')      # visualizando a popula��o

#install.packages('fdth')
library(fdth)              # Uma op��o melhor (generalizada) para ser adotada na disciplina
tb <- fdt(pop)             # Tabela de distribui��o de frequ�ncia

par(mfrow=c(1, 2))         # Dispositivo gr�fico para 2 gr�ficos
# Histograma da frequ�ncia absoluta
plot(tb,
     col='darkgreen')

# Pol�gono da frequ�ncia acumuldad %
plot(tb,
     type='cfpp',
     col='darkgreen')

# Uma brincadeira
plot(fdt(pop,
         k=100),
     col=rainbow(50))

boxplot(pop,
        col='darkgreen') # visualizando a popula��o
                         # observar outiliers!

#.. Amostra: retirando uma amostra (aleat�ria simples com reposi��o) da popula��o
set.seed(2)
amo <- sample(pop,
              size=1e2,
              replace=TRUE)

boxplot(amo,
        col='orange')               # visualizando a amostra

plot(fdt(amo),
     col='orange')                  # visualizando a amostra

par(mfrow=c(1, 1))                  # Dispositivo gr�fico para 1 gr�fico
boxplot(pop, amo,                   # ambos (pop e amo)
        col=c('darkgreen',
              'orange'),
        names=c('pop',
                'amo'))

#. Medidas estat�sticas
# Popula��o: par�metros
N  <- length(pop) ; N
M  <- mean(pop)   ; M   # M�dia
MD <- median(pop) ; MD  # Mediana
S2 <- var(pop)    ; S2  # Vari�ncia
S  <- sd(pop)     ; S   # Desvio padr�o

# Amostra: estimativas do par�metros
(n  <- length(amo))  # tamanho da amostra
(m  <- mean(amo))    # Est. M�dia
(md <- median(amo))  # Est. Mediana
(s2 <- var(amo))     # Est. Vari�ncia
(s  <- sd(amo))      # Est. Desvio padr�o

# Observar as desigualdades (17 casas decimais)
M  == m
MD == md
S2 == s2
S  == s

# Com zero casas decimais
round(M)  == round(m)
round(MD) == round(md)
round(S2) == round(s2)
round(S)  == round(s)

#. INFER�NCIA B�SICA
# Retirando uma pequena amostra aleat�ria da popula��o
set.seed(3)
amo2 <- sample(pop,
               5)  # Uma amosta de tamanho 5 da popula��o

# Intervalo de Confian�a para a M�dia (ICM)
# Escrevendo uma fun��o simples no R
icM <- function(x,
                conf=95/100,
                rd=2)
{
  n <- length(x)            # Tamanho da amostra
  m <- mean(x)              # Estimativa da m�dia
  s2 <- var(x)              # Estimativa da vari�ncia
  p <- c((1 - conf)/2,      # Probabilidades
         1 - (1-conf)/2)

  qu <- qt(p,               # Quantis
           df=n-1)

  ic <- m + qu * sqrt(s2/n) # ICM
  ic <- round(ic,
              rd)           # Arredondamento
  return(ic)                # Retorno da fun��o
}

# Usando a fun��o acima (icM)
icM(amo2)
#  8.38 - Limite inferior do ICM
# 11.31 - Limite superior do ICM

# Usando a fun��o t.test (do pacote stats)
(tt <- t.test(amo2))

# Digerindo
round(tt$conf.int[1:2],
      2)
#  8.38 - Limite inferior do ICM
# 11.31 - Limite superior do ICM
# T�m-se 95% de probabilidade do intervalo estimado conter a m�dia populacional


#. ESTAT�STICA UNIVARIADA VS. MULTIVARIADA
# Univariada: interesse em uma ou mais vari�vel, de forma isolada
# Observar que n�o h� altera��o da informa��o com a inclus�o/exclus�o
# de vari�veis
par(mfrow=c(1, 2))
boxplot(iris[-5],
        col=c('red', 'green', 'blue', 'pink'),
        ylim=c(0,8))

boxplot(iris[-c(1, 5)],
        col=c('green', 'blue', 'pink'),
        ylim=c(0,8))

# Multivariada: interesse em mais de uma vari�vel, de forma conjunta.
# Ou seja, com foco nas associa��es entre as vari�veis de interesse

#... Exemplo 1: An�lise de agrupamento
#install.packages('cluster')
library(cluster)

? agriculture
agriculture

boxplot(agriculture,
        col=c('red', 'darkgreen'),
        main='Univariada')

plot(agnes(agriculture),
     which=2,
     main='Multivariada')

#... Exemplo 2: Biplot aplicado a base de dados agriculture
#install.packages('bpca')
library(bpca)

# Duas an�lises multivariadas simult�neas para compara��o
plot(agnes(agriculture),
     which=2,
     main='Cluster (mult)')

plot(bpca(agriculture),
     var.cex=2,
     obj.cex=1,
     main='Biplot (mult)')

#... Exemplo 3: Biplot aplicado a base de dados iris
# Observar h� altera��o da informa��o com a inclus�o/exclus�o de vari�veis
par(mfrow=c(2, 1))

plot(bpca(iris[-5]),
     obj.col=unclass(iris$Species),
     obj.names=FALSE,
     obj.cex=1,
     var.cex=1,
     var.factor=.4,
     xlim=c(-8, 8),
     ylim=c(-8, 8))

legend('topleft',
       legend=levels(iris$Species),
       pch=19,
       col=c(1:3))

plot(bpca(iris[-c(2, 5)]),
     obj.col=unclass(iris$Species),
     obj.names=FALSE,
     obj.cex=1,
     var.cex=1,
     var.factor=.4,
     xlim=c(-8, 8),
     ylim=c(-8, 8))

#. OBJETOS, VARI�VEIS e ESCALAS
#.. Nominal
nom <- data.frame(id=1:5,
                  Ocupa��o=c('Estudante',
                             'Professor',
                             'Enfermeiro',
                             'F�sico',
                             'Advogado'))
str(nom)
nom

#.. Ordinal
set.seed(3)
ord <- data.frame(id=1:10,
                  Moh=ordered(sample(1:10,
                                     10),
                              levels=1:10))
str(ord)
ord

#.. Intervalar
Temp.C <- c(37, 40.1, 37.5, 35, 46)

int <- data.frame(id=1:5,
                  Temp.Celsius=Temp.C,
                  Temp.Fahrenheit=Temp.C * 1.8 + 32)

str(int)
int

#.. Proporcional
pro <- data.frame(id=1:5,
                  Massa.kg=c(50, 51.5, 52, 50, 49.5),
                  Volume.m3=c(.5, .515, .52, .5, .495))

str(pro)
pro
