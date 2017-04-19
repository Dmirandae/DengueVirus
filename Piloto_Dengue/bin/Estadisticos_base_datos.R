#########################################################################
#                      Estadisticas de la base de datos                ##
#########################################################################

## Datos del gen E con Pais, localidad y año, sin Nas ####
##########################################################

#Leer archivo .csv de la base de datos del gen E con pais, localidad y año

GenE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_GenE_P_L_A.csv")

seroE <- GenE$Serotype

# Saber el numero de datos que hay por cada serotipo

length(which(seroE=="Dengue virus 1"))
length(which(seroE=="Dengue virus 2"))
length(which(seroE=="Dengue virus 3"))
length(which(seroE=="Dengue virus 4"))

## Datos de genoma completo#### 
###############################

# Leer el archivo .csv de la base de datos de genoma completo

db_gc <-  read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_genoma_completo.csv")

# Extraer las columnas de pais. localidad y fecha
Genome_pla <- db_gc[9:11]

# Saber cuantos datos tiene inf de las 3 columnas pais, localidad y fecha

na_genome <- data.frame()
for (i in 1:nrow(Genome_pla)){
  if (anyNA(Genome_pla[i,]) == T){
    na_genome[i,1] <- 0
  }
  if (anyNA(Genome_pla[i,]) == F){
    na_genome[i,1] <- 1
  }
}

length(which(na_genome==1))


longy <- db_gc$Size_sequence


########################################333333
##   Estadisticos para UCLUST          #######
##############################################

#Leer base de datos de Dengue

db_gc <-  read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_genoma_completo.csv")

View(db_gc)

# Extraer los numeros de acceso

Nacso <- db_gc$N_Accesion

#Leer archivo con los IDs de las secuencias eliminadas por uclust

diff_uclust <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo_bd2016/diff_ideff_0.csv", sep = "_", header = F)

View(diff_uclust)

diff_nace <- as.character(diff_uclust$V4)

# Extraer las posiciones de las secuencias eliminas por uclust en la base de datos de Dengue

pon <- data.frame()
for(i in diff_nace){
  pon[i,1] <- which(Nacso==i)
}
 
View(pon)

# Extraer de la base de datos las columnas de pais, localidad y año

newdb <- db_gc[,9:11]

# Obtener las columnas pais, localidad y año solo de las IDs eliminadas por uclust

info <- newdb[pon$V1[1:2306],]
