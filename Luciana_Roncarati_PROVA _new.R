#Disciplina Probabilidade e Estat?stica
#Docente: Jos? Cl?udio Faria/UESC/DCET
#Discente: Luciana Roncarati dos Santos
#Matricula:202010910

 install.packages('fdth')  
 install.packages('mvtnorm')
 install.packages('Matrix')
 
 
dad <- gerar_dados(m1=202210000,
                   m2=202210000,
                   m3=202210000)
                   


str(dad) 
summary (dad)
dad_b <- remove_outlier(dad)
summary(dad_b)
str(dad_b)  

dad$Sexo<-as.factor(dad$Sexo) 
#boxplot(dad_b)

dad_b_m<-subset(dad_b,subset=(Sexo == 'M'))
dad_b$Sexo<-as.factor(dad_b$Sexo)

#plota sem a 3 coluna 
boxplot(dad_b_m [-3])

dad_b_f<-subset(dad_b,subset=(Sexo == 'F'))
dad_b$Sexo<-as.factor(dad_b$Sexo)

boxplot(dad_b)

dad_rl <- gerar_dados_rl(m1=202210000,
                        m2=202210000,
                       m3=202210000)
str(dad_rl)
plot(dad_rl,
      pch=20)
plot(dad_b_m$Y1 )    

      
dad_rl <- gerar_dados_rl(m1=201720309,
                         m2=202121144,
                         m3=202010910)
str(dad_rl)
plot(dad_rl,
     pch=20)
     
methods (plot)  

 library("ggplot2")    
ggplot(dad_b, aes(Y1, Y2)) + geom_point()  
plot (dad_rl)    

plot (dad_b_m&Y1 )   

library(fdth)
library("psych")

ggplot(dad_b_m, aes(Y1, Y2)) + geom_point()  

ggplot(dad_b_f, aes(Y1, Y2)) + geom_point()  

plot(dad_rl,
      pch=20)    
      
install.packages("pacman")
library("pacman")     
pacman::p_load(dplyr,ggplot2,car,rstatix,lmtest,ggpurb) 
View(dad_rl)

#ggplot(dad_rl, aes(X, Y)) 
#               + geom_point() 
#               + geom_smooth(method ="lm", col ="red")
#               +theme_classic()
install.packages("zoo")
install.packages("gridExtra")
#dat <- matrix(c(1000, 100, 10000, 10000,3.145,1700.42), 2)
grid.table(dat)
install.packages('fdth')
 tb_1 <- fdt(dad_b_m$Y1)
tb_1

tb_2 <- fdt(dad_b_f$Y1)
tb_2

plot (tb_1)        #histograma 

plot (tb_1, type='cfp') 

plot(eval(dad_rl) ~ x,
     type='b')


install.packages("ggplot2")

library (ggplot)
dad_brl <- remove_outlier(dad)
dad_brl
dad_rl
dataframe (dad_rl)
