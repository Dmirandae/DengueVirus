install.packages("rworldmap")
require(rworldmap)
data("countryExData")
paises1 <- countryExData[,2]
paises2 <- c("Brazil", 
            "India", 
            "Puerto Rico", 
            "Peru", 
            "China", 
            "Singapore", 
            "Philippines",
            "Colombia", 
            "Taiwan",
            "Thailand",
            "Papua New Guinea",
            "hawai",
            "Pakistan",
            "Malaysia",
            "Laos",
            "Paraguay",
            "Indonesia",
            "Japan", 
            "Nicaragua",
            "Mexico",
            "Argentina",
            "Pakistan",
            "New Caledonia",
            "Texas",
            "Cambodia",
            "Angola",
            "Fiji",
            "Yemen",
            "Germany",
            "Saudi Arabia",
            "Myanmar",
            "Viet Nam",
            "Tuvalu",
            "Bhutan",
            "Guayana",
            "Bolivia",
            "Cuba",
            "Guadeloupe",
            "French Guiana",
            "Martinique",
            "Suriname",
            "Trinidad and Tobago",
            "Virgin Islands",
            "micronesia",
            "Dominican Republic",
            "Ecuador",
            "Venezuela",
            "Samoa",
            "Cook Islands",
            "Barbados",
            "Costa Rica",
            "Guam",
            "Maldives",
            "Guatemala",
            "Honduras",
            "Sri Lanka",
            "Senegal",
            "Cameroon",
            "Djibouti",
            "Guayana",
            "Haiti",
            "El Salvador",
            "Madagascar",
            "Cote d'Ivoire",
            "Russia",
            "France",
            "Tanzania",
            "Nepal",
            "Iran",
            "South Korea",
            "Guyana",
            "Timor")
paises <-c(paises1, paises2)

datos <- read.csv(file="compendio_datos.csv", sep = "," , header = T)
columna <- datos$V6

subname <- data.frame()
for(i in 1:length(columna)){
  result <- vector()
  for(j in paises){
    result[j] <- grepl(j,columna[i])
    if(any(result==T)==F){
      subname[i,1] <- NA
    }
    if(grepl(j,columna[i])==TRUE){
      subname[i,1]<-j 
    } 
  }
}
 
length(which(is.na(subname)==T)) 

write.table(datos, file="/home/andrea/PROYECTO_LSB/Piloto_Dengue/data/columna_paises.csv", sep = ",")


genotipos <- c("I",
               "II",
               "III",
               "IV",
               "V",
               "1",
               "2",
               "3",
               "4",
               "5",
               "Cosmopolitan",
               "American",
               "Asian/American",
               "Asian I",
               "Asian II"
               )
genoty <- data.frame()

for(i in 1:length(columna)){
  result <- vector()
  for(j in genotipos){
    result[j] <- grepl(j,columna[i])
    if(any(result==T)==F){
      genoty[i,1] <- NA
    }
    if(grepl(j,columna[i])==TRUE){
      genoty[i,1]<-j 
    } 
  }
}

grepl("2", datos$V6)

####################################################
# Columna Fecha
##############################################

# Creo vector de meses y vector de años

meses <- data.frame()
month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
           "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
meses[1:12,1] <- month


anos_frame <- data.frame()
anos <- 1600:2016
long_anos <- 1:417
anos_frame[long_anos,1] <- anos

# Unir vector meses con años
#month_date <- data.frame()
#for (i in anos){
#  for(j in month){
#  month_date[paste(j,i, sep="-"), 1] <- paste(j,i,sep="-")  
#  }
#}
#rownames(month_date) <-1:5004


# Hacer la busqueda de meses y años en la columna 6 
fechas <- data.frame()

for(i in 1:length(columna)){
  result <- vector()
  for(j in 1:length(anos_frame[,1])){
    result[j] <- grepl(anos_frame[j,1],columna[i])
    if(any(result==T)==F){
      fechas[i,1] <- NA
    }
    if(grepl(anos_frame[j,1],columna[i])==TRUE){
      fechas[i,1]<-anos_frame[j,1] 
    } 
  }
}

#Guardar la columna de años
write.table(fechas, file="/home/andrea/PROYECTO_LSB/Piloto_Dengue/data/fecha_anos.csv")

fecha_meses <- data.frame()

for(i in 1:length(columna)){
  result <- vector()
  for(j in 1:length(meses[,1])){
    result[j] <- grepl(meses[j,1],columna[i])
    if(any(result==T)==F){
      fecha_meses[i,1] <- NA
    }
    if(grepl(meses[j,1],columna[i])==TRUE){
      fecha_meses[i,1]<-meses[j,1] 
    } 
  }
}
