#Disciplina Probabilidade e Estatística
#Docente: José Cláudio Faria/UESC/DCET
#Discente: Luciana Roncarati dos Santos
#Matricula:202010910

 install.packages('fdth')  
 install.packages('mvtnorm')
 install.packages('Matrix')
 
 
dad <- gerar_dados(m1=202010910,
                   m2=202010910,
                   m3=202010910)
                   

str(dad)
 
dad_b <- remove_outlier(dad)

summary (dad)

summary(dad_b)
str(dad_b)

dad_rl <- gerar_dados_rl(m1=202010910,
                         m2=202010910,
                         m3=202010910)
str(dad_rl)
plot(dad_rl,
     pch=20)



dad$Sexo<-as.factor(dad$Sexo)

str(dad_b)

boxplot(dad_b)

dad_b_m<-subset(dad_b,subset=(Sexo == 'M'))
# dad_b$Sexo<-as.factor(dad_b$Sexo)
 
boxplot(dad_b_m [-3])

dad_b_f<-subset(dad_b,subset=(Sexo == 'F'))
# dad_b$Sexo<-as.factor(dad_b$Sexo)

boxplot(dad_b)


