#===============================================================================
# Name   : Introdução à estatística com R
# Author : José Cláudio Faria
# Date   : 30/08/2021 08:01:25
# Aim    : Ilustrar alguns conceitos básicos de introdução à estatística
# Mail   : <<<joseclaudio.faria@gmail.com>>>
#===============================================================================

#. POPULAÇÃO VS. AMOSTRA
# População: gerando um vetor para ilustrar o conceito
set.seed(1)
pop <- rnorm(1e5,
             mean=10,
             sd=2)         # população finita com distribuição normal

#. Exploração gráfica
hist(pop,
     col='darkgreen')      # visualizando a população

#install.packages('fdth')
library(fdth)              # Uma opção melhor (generalizada) para ser adotada na disciplina
tb <- fdt(pop)             # Tabela de distribuição de frequência

par(mfrow=c(1, 2))         # Dispositivo gráfico para 2 gráficos
# Histograma da frequência absoluta
plot(tb,
     col='darkgreen')

# Polígono da frequência acumuldad %
plot(tb,
     type='cfpp',
     col='darkgreen')

# Uma brincadeira
plot(fdt(pop,
         k=100),
     col=rainbow(50))

boxplot(pop,
        col='darkgreen') # visualizando a população
                         # observar outiliers!

#.. Amostra: retirando uma amostra (aleatória simples com reposição) da população
set.seed(2)
amo <- sample(pop,
              size=1e2,
              replace=TRUE)

boxplot(amo,
        col='orange')               # visualizando a amostra

plot(fdt(amo),
     col='orange')                  # visualizando a amostra

par(mfrow=c(1, 1))                  # Dispositivo gráfico para 1 gráfico
boxplot(pop, amo,                   # ambos (pop e amo)
        col=c('darkgreen',
              'orange'),
        names=c('pop',
                'amo'))

#. Medidas estatísticas
# População: parâmetros
N  <- length(pop) ; N
M  <- mean(pop)   ; M   # Média
MD <- median(pop) ; MD  # Mediana
S2 <- var(pop)    ; S2  # Variância
S  <- sd(pop)     ; S   # Desvio padrão

# Amostra: estimativas do parâmetros
(n  <- length(amo))  # tamanho da amostra
(m  <- mean(amo))    # Est. Média
(md <- median(amo))  # Est. Mediana
(s2 <- var(amo))     # Est. Variância
(s  <- sd(amo))      # Est. Desvio padrão

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

#. INFERÊNCIA BÁSICA
# Retirando uma pequena amostra aleatória da população
set.seed(3)
amo2 <- sample(pop,
               5)  # Uma amosta de tamanho 5 da população

# Intervalo de Confiança para a Média (ICM)
# Escrevendo uma função simples no R
icM <- function(x,
                conf=95/100,
                rd=2)
{
  n <- length(x)            # Tamanho da amostra
  m <- mean(x)              # Estimativa da média
  s2 <- var(x)              # Estimativa da variância
  p <- c((1 - conf)/2,      # Probabilidades
         1 - (1-conf)/2)

  qu <- qt(p,               # Quantis
           df=n-1)

  ic <- m + qu * sqrt(s2/n) # ICM
  ic <- round(ic,
              rd)           # Arredondamento
  return(ic)                # Retorno da função
}

# Usando a função acima (icM)
icM(amo2)
#  8.38 - Limite inferior do ICM
# 11.31 - Limite superior do ICM

# Usando a função t.test (do pacote stats)
(tt <- t.test(amo2))

# Digerindo
round(tt$conf.int[1:2],
      2)
#  8.38 - Limite inferior do ICM
# 11.31 - Limite superior do ICM
# Têm-se 95% de probabilidade do intervalo estimado conter a média populacional


#. ESTATÍSTICA UNIVARIADA VS. MULTIVARIADA
# Univariada: interesse em uma ou mais variável, de forma isolada
# Observar que não há alteração da informação com a inclusão/exclusão
# de variáveis
par(mfrow=c(1, 2))
boxplot(iris[-5],
        col=c('red', 'green', 'blue', 'pink'),
        ylim=c(0,8))

boxplot(iris[-c(1, 5)],
        col=c('green', 'blue', 'pink'),
        ylim=c(0,8))

# Multivariada: interesse em mais de uma variável, de forma conjunta.
# Ou seja, com foco nas associações entre as variáveis de interesse

#... Exemplo 1: Análise de agrupamento
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

# Duas análises multivariadas simultâneas para comparação
plot(agnes(agriculture),
     which=2,
     main='Cluster (mult)')

plot(bpca(agriculture),
     var.cex=2,
     obj.cex=1,
     main='Biplot (mult)')

#... Exemplo 3: Biplot aplicado a base de dados iris
# Observar há alteração da informação com a inclusão/exclusão de variáveis
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

#. OBJETOS, VARIÁVEIS e ESCALAS
#.. Nominal
nom <- data.frame(id=1:5,
                  Ocupação=c('Estudante',
                             'Professor',
                             'Enfermeiro',
                             'Físico',
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
