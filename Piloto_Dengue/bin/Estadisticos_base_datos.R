#########################################################################
#                      Estadisticas de la base de datos                ##
#########################################################################

## Datos del gen E con Pais, localidad y año, sin Nas ####

#Leer archivo .csv de la base de datos del gen E con pais, localidad y año

GenE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_GenE_P_L_A.csv")

seroE <- GenE$Serotype

# Saber el numero de datos que hay por cada serotipo

length(which(seroE=="Dengue virus 1"))
length(which(seroE=="Dengue virus 2"))
length(which(seroE=="Dengue virus 3"))
length(which(seroE=="Dengue virus 4"))

## Datos de genoma completo 

# Leer el archivo .csv de la base de datos de genoma completo

db_gc <-  read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_genoma_completo.csv")

# Extraer 
Genome_pla <- db_gc[9:11]

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
