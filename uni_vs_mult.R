#===============================================================================
# Name   : Exemplo: dados coletados na sala de aula
# Author : J.C.Faria
# Date   : 06/04/2022 17:49:51
# Aim    : Diferenciar conceitos análise univariada e multivariada
# Mail   : <<<joseclaudio.faria@gmail.com>>>
#===============================================================================

#.. Dados na web
dad <- read.table('https://lec.pro.br/download/R/dados/dad_mtv.txt',
                  header=TRUE,
                  row.names='id')
dad

#.. Dados no computador (após download na página da disciplina)
dad <- read.table('./dados/dad_mtv.txt',
                  header=TRUE,
                  row.names='id')
dad

#. Análises univariadas
summary(dad)

boxplot(dad,
        col='green')

#. Análise multivariadas
#.. Análise de correlação: a multivariada mais simples
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

# Representação gráfica do biplot
plot(bp,
     obj.cex=1.5,
     var.cex=1.5)

#.. Análise de agrupamento (usando funções básicas)
d <- dist(as.matrix(dad))   # Determina a matrix das distâncias multivariadas
hc <- hclust(d)             # Agrupamento
plot(hc)                    # Dendograma

#.. Análise de agrupamento (usando pacote Cluster)
#library(cluster)
#plot(agnes(dad))
