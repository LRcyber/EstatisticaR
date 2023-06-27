#===============================================================================
# Título: Leitura e gravação de dados no R
# Curso : CET076
# Autor : José Cláudio Faria/UESC/DCET
# Data  : 06/04/2022 17:30:14
# Objetivos:
#===============================================================================
# - Apresentar os recursos básicos para leitura e gravação de dados
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
                 dec=',')         # observar que não foi definido o caracter usado para dado não diponível

bm1 <- read.table(w_bm,
                  head=T,
                  dec=',',
                  na.strings='.') # agora está OK
ls()

ms <- read.table(w_ms,
                 dec=',',
                 sep=';')         # observar que faltou informar que a primeira linha do arquivo é o nome das variáveis

ms1 <- read.table(w_ms,
                  head=T,
                  dec=',',
                  sep=';')        # agora está OK
ls()

ms2 <- read.table(w_ms,
                  head=T,
                  dec=',',
                  sep=';',
                  stringsAsFactors=TRUE)  # agora está OK
ls()

ls1 <- read.table(w_se,
                  head=T,
                  dec=',',
                  sep=';')        # um arquivo um pouco maior

tg <- read.table(w_tg,
                 head=T,
                 dec=',')         # exemplo com um número maior de variáveis

# o objeto anterior 'bm' vai ser eliminado e será criado outro
bm <- read.table(l_bm,
                 head=T,
                 dec=',',
                 na.strings='.')

ls()
str(bm)
summary(bm)
plot(bm)

#. Gravação de dados local
# É necessário ajustar a localização dos arquivos para o computador do usuário
# Os arquivos texto estão disponíveis no LEC

dad <- read.table('./dados/peridon.txt',
                  h=T,
                  stringsAsFactors=T)
str(dad)
head(dad)

# Gravação de dados
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


#. Salvar conteúdo de análises
getwd()                  # Verificando onde está o dir. de trabalho (workdir)
dir()

sink('./res/teste.txt')  # O canal stdOUT é desviado para a conexão 'analise.txt'
  summary(iris)

  library(fdth)

  tb <- fdt(iris)

  summary(tb)
sink()                   # O canal stdOUT retorna para o console do R

summary(iris)
