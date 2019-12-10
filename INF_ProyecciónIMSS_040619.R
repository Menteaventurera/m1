#Proyección del IMSS

library("forecast")
library("ggplot2")
library("utils")
library("foreign")
library("g.data")
library("TSPred")
library("tseries")
library("Hmisc")

imss<-read.csv("file:///C:/Users/IN335913/Desktop/DocumentosInfonavit/INF004_ProyecciónIMSS/Datos/DatosIMSS_040619.csv")
attach(imss)
head(imss)
tail(imss)

imms<-ts(imss$Nuevos,start = c(2006,1),frequency = 12)
plot(imms)

aimss<-auto.arima(imms,trace = T,test = "kpss", ic=c("aic"))
#Arima(0,2,1)(1,0,0)

aimss2<-Arima(imms,order=c(1,1,1),seasonal = c(1,0,0) )

fimss<-forecast(aimss,h=65,level = c(10))
fimss2<-forecast(aimss2,h=65,level = c(10))

dataimss<-data.frame(fimss$mean,fimss$upper,fimss2$mean,fimss2$upper)
#View(dataimss)

write.csv(dataimss,"C:/Users/IN335913/Desktop/DocumentosInfonavit/INF004_ProyecciónIMSS/Temporal/INF_ProyeccionesIMSS24.csv")



