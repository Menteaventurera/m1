
library("forecast")
library("ggplot2")
library("utils")
library("foreign")
library("g.data")
library("TSPred")

p1<-read.csv("file:///C:/Users/IN335913/Desktop/DocumentosInfonavit/INF002_ProyecciónPIB/Bases/PIB_1trim18.csv")
attach(p1)
head(p1)

tail(p1)

#Serie Original
pib<-ts(PIB_orig,start = c(2000,1),frequency = 4)
plot(pib, main="Serie real")
p1_pro<-arima(pib,order=c(1,0,2),seasonal = c(0,0,1))
#Mejor modelo ARIMA(1,0,2)(0,0,1)[4]
fp1<-forecast(p1_pro, h=5,level = c(10,50,75,90))
View(fp1$mean)
View(fp1$upper)
m_o<-fp1$mean
u_o<-fp1$upper
l_o<-fp1$lower

#serie Desestacionalizada 

pib_d<-ts(PIB_des,start = c(2000,1),frequency = 4)
plot(pib_d, main="PIB desestacionalizado")

#p1_d<-arima(pib_d,order=c(2,1,3),seasonal = c(1,0,1))

p1_d<-arima(pib_d,order=c(2,1,3),seasonal = c(1,0,1))
#Mejor modelo ARIMA(1,0,2)(0,0,1)[4]
fp1_d<-forecast(p1_d, h=5,level = c(10,50,75,90))
View(fp1_d$mean)
m_d<-fp1_d$mean
u_d<-fp1_d$upper

t<-data.frame(m_o,u_o,m_d,u_d)

write.csv(t,"file:///C:/Users/IN335913/Desktop/DocumentosInfonavit/INF002_ProyecciónPIB/Temporal/PIB_proy_301019.csv")






