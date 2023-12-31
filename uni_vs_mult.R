#===============================================================================
# Name   : Exemplo: dados coletados na sala de aula
# Author : J.C.Faria
# Date   : 06/04/2022 17:49:51
# Aim    : Diferenciar conceitos an�lise univariada e multivariada
# Mail   : <<<joseclaudio.faria@gmail.com>>>
#===============================================================================

#.. Dados na web
dad <- read.table('https://lec.pro.br/download/R/dados/dad_mtv.txt',
                  header=TRUE,
                  row.names='id')
dad

#.. Dados no computador (ap�s download na p�gina da disciplina)
dad <- read.table('./dados/dad_mtv.txt',
                  header=TRUE,
                  row.names='id')
dad

#. An�lises univariadas
summary(dad)

boxplot(dad,
        col='green')

#. An�lise multivariadas
#.. An�lise de correla��o: a multivariada mais simples
pairs(dad,
      col='red',
      cex=3,
      pch=19)

#.. Biplot aplicado aos Componentes Pricipais
#install.packages('bpca')
library(bpca)
bp <- bpca(dad)

# Medidas associadas ao biplot
summary(bp)

# Representa��o gr�fica do biplot
plot(bp,
     obj.cex=1.5,
     var.cex=1.5)

#.. An�lise de agrupamento (usando fun��es b�sicas)
d <- dist(as.matrix(dad))   # Determina a matrix das dist�ncias multivariadas
hc <- hclust(d)             # Agrupamento
plot(hc)                    # Dendograma

#.. An�lise de agrupamento (usando pacote Cluster)
#library(cluster)
#plot(agnes(dad))
