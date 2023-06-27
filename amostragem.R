#===============================================================================
# Título: Noções de amostragem
# Curso : Introdução à estatística
# Autor : José Cláudio Faria/UESC/DCET
# Data  : 06/04/2022 17:42:36
# Objetivos: Ilustrar técnicas básicas de amostragem probabilística no R
#===============================================================================
# - Aleatória simples
# - Sistemática
# - Estratificada
#===============================================================================

#. AMOSTRA ALEATÓRIA SIMPLES - AAS
pop <- rnorm(1e4,
             m=1.7,
             s=.3)

n <- 1/100  # percentagem da população a ser amostrada
amo <- sample(x=pop, 
              size=n * length(pop))

boxplot(pop, amo, 
        names=c('pop', 'amo')) 


#. AMOSTRAGEM SISTEMÁTICA - AS
# Função
# x = População (vetor)
# p = Percentagem da população a ser amostrada
# r = Número inteiro entre 1 e k: primeiro elemento a ser sorteado

s_sis <- function(x, p=20, r=NULL)
{
  k <- round(1/p * 100)

  if (is.null(r))
    r <- sample(1:k, 1)   # Elemento de aleatoriedade!

  n <- 0:round((p / 100 * length(x)) - 1)

  idx <- (n * k) + r

  res <- x[idx]

  return(res)
}

# Exemplo da apostila de CET018
# https://lec.pro.br/download/faria/apostilas/CET018_10ed_1pf.pdf
pop1 <- c('01 JCF', '02 KLJ', '03 OMI', '04 JUI', '05 PLW', '06 MNH', '07 QUR',
          '08 STR', '09 JOY', '10 LKP', '11 NWO', '12 GTR', '13 LER', '14 GFF',
          '15 EQI', '16 UPL', '17 NMQ', '18 JWF', '19 DFR', '20 PUB', '21 NHU',
          '22 PPO', '23 QDA', '24 NKP', '25 HYU', '26 DRQ', '27 ACD', '28 BCV',
          '29 NHU', '30 PLK', '31 MHZ', '32 POP', '33 HWR', '34 RER', '35 BDB')

# Gerando amostras sistemáticas aleatórias
s_sis(pop1)
s_sis(pop1)

# Reproduzindo a amostra (exemplo da apostila de CET018)
s_sis(pop1, 
      r=3)


#. AMOSTRAGEM ESTRATIFICADA PROPORCIONAL - AEP
# Função
# x = População (data.frame)
# p = Percentagem da população a ser amostrada
# strata = Coluna do fator de estratificação

s_str <- function(x, p=10, strata=NULL)
{
  if (is.null(strata))
    strata <- names(x[sapply(x, 
                             is.factor)])[1]

  l <- levels(x[, strata])
  nl <- length(l)

  res <- numeric()
  for (i in 1:nl)
  {
    nstrata <- length(grep(l[i], 
                           x[, strata]))

    n <- round(nstrata * p / 100)

    sel <- sample(1:nstrata, 
                  n)

    sdata <- subset(x, 
                    subset=eval(parse(text=strata)) == l[i])

    res <- rbind(res, 
                 sdata[sel,])
  }
  return(res)
}

pop2 <- data.frame(y=c(rnorm(450, m=10,  sd=1),
                       rnorm(250, m=20,  sd=2),
                       rnorm(150, m=15,  sd=3),
                       rnorm(100, m=100, sd=20),
                       rnorm(50,  m=30,  sd=2)),
                   st=c(rep('a', 450),
                        rep('b', 250),
                        rep('c', 150),
                        rep('d', 100),
                        rep('e', 50)))

#. Exemplos de uso
s_str(iris)
s_str(pop2)

par(mfrow=c(1, 2))
boxplot(y ~ st, data=pop2, 
        ylim=c(min(pop2$y), 
               max(pop2$y)),
        main='Pop')

boxplot(y ~ st, 
        data=s_str(pop2, 
                   p=20), 
        ylim=c(min(pop2$y), 
               max(pop2$y)),
        main='Amo')

boxplot(Sepal.Length ~ Species, 
        data=iris, 
        ylim=c(min(iris$Sepal.Length), 
               max(iris$Sepal.Length)),
        main='Pop_Iris') 

boxplot(Sepal.Length ~ Species, 
        data=s_str(iris, 
                   p=20), 
        ylim=c(min(iris$Sepal.Length), 
               max(iris$Sepal.Length)),
        main='Amo_Iris')

#. Usando o pacote sampling
# install.packages('sampling')
library(sampling)
strata(data=iris,
       stratanames='Species',
       size=c(5, 5, 5),   # 10%
       method='srswor')   # srswor - simple random sampling without replacement

strata(pop2,
       'st',
       c(45, 25, 15, 10, 5),  # 10%
       'srswor')
