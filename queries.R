#Queries
library(DBI)
library(RMySQL)
library(ggplot2)
library(dplyr)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

dbListTables(MyDataBase)

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
head(DataDB)

#Seleccionando paises hispanohablantes
spanish <- filter(DataDB, DataDB$Language == "Spanish")

#Graficando
ggplot(data=spanish, aes(x=CountryCode, y=Percentage, fill=IsOfficial))+
  geom_col()+
  coord_flip()