#===============================================================================
# T�tulo: Leitura e grava��o de dados no R
# Curso : CET076
# Autor : Jos� Cl�udio Faria/UESC/DCET
# Data  : 06/04/2022 17:30:14
# Objetivos:
#===============================================================================
# - Apresentar os recursos b�sicos para leitura e grava��o de dados
#===============================================================================

#.. Dados na WEB
w_bm <- 'https://lec.pro.br/download/R/dados/bussab_morettin.txt'
w_ms <- 'https://lec.pro.br/download/R/dados/msfinal.csv'
w_se <- 'https://lec.pro.br/download/R/dados/semente.csv'
w_tg <- 'https://lec.pro.br/download/R/dados/tg.csv'

#.. Dados no computador
l_bm <- './dados/bussab_morettin.txt'        # /: slash
l_bm <- '.\\dados\\bussab_morettin.txt'      # \: backslash
l_ms <- './dados/msfinal.csv'
l_pe <- './dados/peridon.txt'
l_se <- './dados/semente.csv'
l_tg <- './dados/tg.csv'

#. Leitura de dados
bm <- read.table(w_bm,
                 head=T,
                 dec=',')         # observar que n�o foi definido o caracter usado para dado n�o dipon�vel

bm1 <- read.table(w_bm,
                  head=T,
                  dec=',',
                  na.strings='.') # agora est� OK
ls()

ms <- read.table(w_ms,
                 dec=',',
                 sep=';')         # observar que faltou informar que a primeira linha do arquivo � o nome das vari�veis

ms1 <- read.table(w_ms,
                  head=T,
                  dec=',',
                  sep=';')        # agora est� OK
ls()

ms2 <- read.table(w_ms,
                  head=T,
                  dec=',',
                  sep=';',
                  stringsAsFactors=TRUE)  # agora est� OK
ls()

ls1 <- read.table(w_se,
                  head=T,
                  dec=',',
                  sep=';')        # um arquivo um pouco maior

tg <- read.table(w_tg,
                 head=T,
                 dec=',')         # exemplo com um n�mero maior de vari�veis

# o objeto anterior 'bm' vai ser eliminado e ser� criado outro
bm <- read.table(l_bm,
                 head=T,
                 dec=',',
                 na.strings='.')

ls()
str(bm)
summary(bm)
plot(bm)

#. Grava��o de dados local
# � necess�rio ajustar a localiza��o dos arquivos para o computador do usu�rio
# Os arquivos texto est�o dispon�veis no LEC

dad <- read.table('./dados/peridon.txt',
                  h=T,
                  stringsAsFactors=T)
str(dad)
head(dad)

# Grava��o de dados
setwd('./tmp')

write.table(dad,
            'peridon.txt')

# BOD do pacote datasets
write.table(BOD,
            'BOD.txt')

# iris do pacote datasets
data(iris)
iris[1,1] <- 999

write.table(iris,
            './iris_alt.txt')


#. Salvar conte�do de an�lises
getwd()                  # Verificando onde est� o dir. de trabalho (workdir)
dir()

sink('./res/teste.txt')  # O canal stdOUT � desviado para a conex�o 'analise.txt'
  summary(iris)

  library(fdth)

  tb <- fdt(iris)

  summary(tb)
sink()                   # O canal stdOUT retorna para o console do R

summary(iris)
