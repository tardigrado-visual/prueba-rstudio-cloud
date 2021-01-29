#Reto 2 y 3 Sesion 7

library(rvest)
url <- "https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
archivo <- read_html(url)

#Extrayendo la tabla del HTML
tables <- html_nodes(archivo, "table")
table <- html_table(tables[1], fill = TRUE)
table <- as.data.frame(table1)

#Quitando caracteres no necesarios de la columna Sueldo
table$Sueldo <- gsub("^MXN\\$","",table$Sueldo)
table$Sueldo <- gsub("/mes$","",table$Sueldo)
table$Sueldo <- gsub(",","",table$Sueldo)
table$Sueldo <- as.numeric(as.character(table$Sueldo))

#¿Cuál es la empresa que más paga y la que menos paga?
maximo <- table[which.max(table$Sueldo),]
minimo <- table[which.min(table$Sueldo),]

