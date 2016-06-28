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
columna <- read.csv(file="columna_6.csv", sep=",")
columna <- datos$V6
col <- columna[,2]
col <- as.data.frame(col)

write.csv(columna, file="/home/andrea/LSB/Piloto_Dengue/data/columna_6.csv")

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

write.table(subname, file="/home/andrea/LSB/Piloto_Dengue/data/columna_paises.csv", sep = ",")

###########################
## Columna de genotipos ##
###########################

genotipos <- c("I",
               "II",
               "III",
               "V",
               "IV",
               "Cosmopolitan",
               "American",
               "Asian",
               "American African",
               "American/Asian",
               "American-Asian",
               "Asian/American",
               "Asian I",
               "Asian II",
               "Genotype I",
               "Genotype II",
               "Genotype III",
               "Genotype V",
               "Genotype IV",
               "type 1",
               "1",
               "2",
               "3",
               "4",
               "5"
               )
class(genotipos)
genotipos <- as.data.frame(genotipos)

genoty <- data.frame()

for(i in 1:length(columna)){
  result <- vector()
  for(j in 1:length(genotipos)){
    result[j] <- match(genotipos[j],columna[i])
    for(n in result){
      if(any(is.na(result)==T)==T){
        genoty[i,1] <- NA
      }
      if(is.numeric(match(j,columna[i])==T)==T){
        genoty[i,1]<-"andrea"
      } 
    }
  }
}
#############################
salida <- data.frame()
for(averi in 1:length(col[,1])){
  for(i in 1:length(genotipos[,1])){
    result <- match(genotipos[i,1], col[averi,1])
    if(is.na(result)==F){
      salida[averi,1] <- genotipos[i,1]
    }
  }
}

length(which(is.na(salida)==F))

write.table(salida, file = "/home/andrea/LSB/Piloto_Dengue/data/columna_genotipos.csv")

############################
for(i in col){
  for (j in genotipos){
    result <- match(j,i)
    if(is.na(result)==T){
      genoty[i,1] <- NA
    }
    if(is.numeric(result)==T){
      genoty[i,1] <- genotipos[j]
    }
  }
}


gen <- cbind(genoty,columna)

a <- c("azul", "amarillo", "rojo", "cafe")
b <- c("a", "rojo", "ca","amarillo", NA)
c <- c(1,2,3)
d <- c(NA,NA,NA,NA,NA,5)
is.na(d)
is.numeric(d)
any(is.numeric(d))

class(a)
a[1]
na <- is.na(b)==T
na[3]
aja <- vector()
prueba <- match(b,a)
is.na(prueba[1])==T
is.numeric(c)==T
if(is.numeric(prueba[2])==T){
  aja[1]<-a[prueba[2]]
}

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
write.table(fechas, file="/home/andrea/LSB/Piloto_Dengue/data/fecha_anos.csv")

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

write.table(fecha_meses, file="/home/andrea/LSB/Piloto_Dengue/data/fecha_meses.csv")


co_pa <- read.csv(file="columna_paises.csv", sep = "," , header = T)
fe_an <- read.csv(file="fecha_anos.csv", sep = " " , header = T)
fe_me <- read.csv(file="fecha_meses.csv", sep = " " , header = T)

datos_2 <- cbind(datos,co_pa,fe_an,fe_me)

write.table(datos_2, file="/home/andrea/LSB/Piloto_Dengue/data/Compendio_datos2.csv")
