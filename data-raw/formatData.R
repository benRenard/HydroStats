library(dplyr)
# Azergues QJ
X=read.csv(file.path('data-raw','U4644010_QmnJ(n=1_non-glissant).csv'),header=T)
X$date=as.Date(X$Date..TU.);X$debit=X$Valeur..en.m..s.
dates=data.frame(date=seq(X$date[1],X$date[NROW(X)],by='days'))
Azergues_QJ=left_join(dates,X) %>% select(date,debit)

# Azergues Qm7J
X=read.csv(file.path('data-raw','U4644010_QmnJ(n=7_glissant).csv'),header=T)
X$date=as.Date(X$Date..TU.);X$debit=X$Valeur..en.m..s.
Azergues_Qm7J=left_join(dates,X) %>% select(date,debit)

# Azergues Qn7J
X=read.csv(file.path('data-raw','U4644010_QINnJ(n=7_glissant).csv'),header=T)
X$date=as.Date(X$Date..TU.);X$debit=X$Valeur..en.m..s.
Azergues_Qn7J=left_join(dates,X) %>% select(date,debit)

# Durance QJ
X=read.csv(file.path('data-raw','X0130010_QmnJ(n=1_non-glissant).csv'),header=T)
X$date=as.Date(X$Date..TU.);X$debit=X$Valeur..en.m..s.
dates=data.frame(date=seq(X$date[1],X$date[NROW(X)],by='days'))
Durance_QJ=left_join(dates,X) %>% select(date,debit)

# Zorn QJ
X=read.csv(file.path('data-raw','A3480200_QmnJ(n=1_non-glissant).csv'),header=T)
X$date=as.Date(X$Date..TU.);X$debit=X$Valeur..en.m..s.
dates=data.frame(date=seq(X$date[1],X$date[NROW(X)],by='days'))
Zorn_QJ=left_join(dates,X) %>% select(date,debit)

# save
save(Azergues_QJ,Azergues_Qm7J,Azergues_Qn7J,Durance_QJ,Zorn_QJ,file='data/HydroStats.RData')
