###############################################################################################
#####   Selecionar y organizar los datos del Gen E y Genoma que se van a correlacionar   ######
###############################################################################################

##############
##  GEN E  ###
##############

# Datos del Gen E

dat_genE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/Disimilares97.csv", header = T)

# Secuencias del Gen E

seq_genE <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/seq_Disimilaridad97.txt", header= T, sep=" ")

# Datos del gen E que tengan localidad y ano

lo_an <- which(is.na(dat_genE$Location)==F & is.na(dat_genE$Year)==F)

dat_loan <- dat_genE[lo_an,] 

write.csv(dat_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Location_year.csv")

# Datos del gen E que tengan localidad y año por cada serotipo

Denv_1 <- dat_loan[which(dat_loan$Serotype=="DENV_1"),]

Denv_2 <- dat_loan[which(dat_loan$Serotype=="DENV_2"),]

Denv_3 <- dat_loan[which(dat_loan$Serotype=="DENV_3"),]

Denv_4 <- dat_loan[which(dat_loan$Serotype=="DENV_4"),]

# Secuencias del Gen E que tienen localidad y ano

position_loan <- vector()
for(i in 1:length(dat_loan$N_Accesion)){
  position_loan[i] <- which(seq_genE$id==dat_loan$N_Accesion[i])
}

seq_genE_loan <- seq_genE[position_loan,]

write.table(seq_genE_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_loan.txt")

# Secuencias del Gen E que tienen localidad y ano por serotipos
# Denv1
position_denv1 <- vector()
for(i in 1:length(Denv_1$N_Accesion)){
  position_denv1[i] <- which(seq_genE_loan$id==Denv_1$N_Accesion[i])
}

seq_denv1 <- seq_genE_loan[position_denv1,]

write.table(seq_denv1, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv1.txt")

# Denv2
position_denv2 <- vector()
for(i in 1:length(Denv_2$N_Accesion)){
  position_denv2[i] <- which(seq_genE_loan$id==Denv_2$N_Accesion[i])
}

seq_denv2 <- seq_genE_loan[position_denv2,]

write.table(seq_denv2, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv2.txt")

# Denv3
position_denv3 <- vector()
for(i in 1:length(Denv_3$N_Accesion)){
  position_denv3[i] <- which(seq_genE_loan$id==Denv_3$N_Accesion[i])
}

seq_denv3 <- seq_genE_loan[position_denv3,]

write.table(seq_denv3, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv3.txt")

# Denv4
position_denv4 <- vector()
for(i in 1:length(Denv_4$N_Accesion)){
  position_denv4[i] <- which(seq_genE_loan$id==Denv_4$N_Accesion[i])
}

seq_denv4 <- seq_genE_loan[position_denv4,]

write.table(seq_denv4, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv4.txt")
#-----------------------------------------
##  VECTORES DE COORDENADAS GEOGRAFICAS ##

#GEN E
dge_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Location_year.csv", header = T)
Coordenadas_loan <- dge_loan[,c(12,19,20)]

write.csv(Coordenadas_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Coordenadas_loan.csv")

CoordenadasD1_loan <- Denv_1[,c(11,18,19)] 
write.csv(CoordenadasD1_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD1_loan.csv")

CoordenadasD2_loan <- Denv_2[,c(11,18,19)] 
write.csv(CoordenadasD2_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD2_loan.csv")

CoordenadasD3_loan <- Denv_3[,c(11,18,19)] 
write.csv(CoordenadasD3_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD3_loan.csv")

CoordenadasD4_loan <- Denv_4[,c(11,18,19)] 
write.csv(CoordenadasD4_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD4_loan.csv")
#---------------------------------------

## VECTORES DE AÑOS PARA DIST TEMPORAL ##

year.E.loan <- dat_loan$Year
write.csv(year.E.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/year_loan.csv")

year.D1.loan <- Denv_1$Year
write.csv(year.D1.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/yearD1_loan.csv")

year.D2.loan <- Denv_2$Year
write.csv(year.D2.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/yearD2_loan.csv")

year.D3.loan <- Denv_3$Year
write.csv(year.D3.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/yearD3_loan.csv")

year.D4.loan <- Denv_4$Year
write.csv(year.D4.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/yearD4_loan.csv")

###################
###  GENOMA    ####
###################

## 1. Genoma del virus del Dengue con Localidad y Año

# Datos de Genoma
dat_genoma <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/Disimilares97.csv", header = T)

# Secuencias del Genoma
seq_genoma <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/Seq_disimilaridad97.txt", header= T, sep=" ")

# Datos de Genoma que tiene localidad y ano
Genomalo_an <- which(is.na(dat_genoma$Location)==F & is.na(dat_genoma$Year)==F & is.na(dat_genoma$lat_location)==F)
dat_Genomalo_an <- dat_genoma[Genomalo_an,]
dat_Genomalo_an <- dat_Genomalo_an[-25,]

write.csv(dat_Genomalo_an, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Location_year.csv")

Denv_1g <- dat_Genomalo_an[which(dat_Genomalo_an$Serotype=="DENV_1"),]
Denv_2g <- dat_Genomalo_an[which(dat_Genomalo_an$Serotype=="DENV_2"),]
Denv_3g <- dat_Genomalo_an[which(dat_Genomalo_an$Serotype=="DENV_3"),]
Denv_4g <- dat_Genomalo_an[which(dat_Genomalo_an$Serotype=="DENV_4"),]

# Secuencias de Genoma que tiene localidad y ano
posinoma_loan <- vector()
for(i in 1:length(dat_Genomalo_an$N_Accesion)){
  posinoma_loan[i] <- which(seq_genoma$id==dat_Genomalo_an$N_Accesion[i])
}

seq_genoma_loan <- seq_genoma[posinoma_loan,]

write.table(seq_genoma_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_loan.txt")

# Secuencias del Gen E que tienen localidad y ano por serotipos
# Denv1
posinoma_d1g <- vector()
for(i in 1:length(Denv_1g$N_Accesion)){
  posinoma_d1g[i] <- which(seq_genoma_loan$id==Denv_1g$N_Accesion[i])
}

seq_d1_loan <-seq_genoma_loan[posinoma_d1g,]

write.table(seq_d1_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv1_loan.txt")

# Denv2
posinoma_d2g <- vector()
for(i in 1:length(Denv_2g$N_Accesion)){
  posinoma_d2g[i] <- which(seq_genoma_loan$id==Denv_2g$N_Accesion[i])
}

seq_d2_loan <-seq_genoma_loan[posinoma_d2g,]

write.table(seq_d2_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv2_loan.txt")

# Denv3
posinoma_d3g <- vector()
for(i in 1:length(Denv_3g$N_Accesion)){
  posinoma_d3g[i] <- which(seq_genoma_loan$id==Denv_3g$N_Accesion[i])
}

seq_d3_loan <-seq_genoma_loan[posinoma_d3g,]

write.table(seq_d3_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv3_loan.txt")

# Denv4
posinoma_d4g <- vector()
for(i in 1:length(Denv_4g$N_Accesion)){
  posinoma_d4g[i] <- which(seq_genoma_loan$id==Denv_4g$N_Accesion[i])
}

seq_d4_loan <-seq_genoma_loan[posinoma_d4g,]

write.table(seq_d4_loan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv4_loan.txt")
#-----------------------------

## VECTORESDE COORDENAS GEOGRAFICAS

#GENOMA
# LOCALIDAD Y ANO
CoordenadasG_loan <- dat_Genomalo_an[,c(11,18,19)]
write.csv(CoordenadasG_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Coordenadas_loan.csv")

CoordenadasGD1_loan <- Denv_1g[,c(11,18,19)]
write.csv(CoordenadasGD1_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD1_loan.csv")

CoordenadasGD2_loan <- Denv_2g[,c(11,18,19)]
write.csv(CoordenadasGD2_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD2_loan.csv")

CoordenadasGD3_loan <- Denv_3g[,c(11,18,19)]
write.csv(CoordenadasGD3_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD3_loan.csv")

CoordenadasGD4_loan <- Denv_4g[,c(11,18,19)]
write.csv(CoordenadasGD4_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD4_loan.csv")
#------------------------------

## VECTORES DE AÑO 

year_loan <- dat_Genomalo_an$Year
write.csv(year_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/year_loan.csv")

yearD1_loan <- Denv_1g$Year
write.csv(yearD1_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD1_loan.csv")

yearD2_loan <- Denv_2g$Year
write.csv(yearD2_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD2_loan.csv")

yearD3_loan <- Denv_3g$Year
write.csv(yearD3_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD3_loan.csv")

yearD4_loan <- Denv_4g$Year
write.csv(yearD4_loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD4_loan.csv")

## 2. Genoma del virus del Dengue con Pais y Año

# Datos del genoma que tienen pais y ano
Genomapa_an <- which(is.na(dat_genoma$Country)==F & is.na(dat_genoma$Year)==F)
dat_Genoma_paan <- dat_genoma[Genomapa_an,]
write.csv(dat_Genoma_paan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Country_year.csv")

Denv1g_pan <- dat_Genoma_paan[which(dat_Genoma_paan$Serotype=="DENV_1"),]
Denv2g_pan <- dat_Genoma_paan[which(dat_Genoma_paan$Serotype=="DENV_2"),]
Denv3g_pan <- dat_Genoma_paan[which(dat_Genoma_paan$Serotype=="DENV_3"),]
Denv4g_pan <- dat_Genoma_paan[which(dat_Genoma_paan$Serotype=="DENV_4"),]

# Secuencias del genoma con pais y ano
posinoma_paan <- vector()
for(i in 1:length(dat_Genoma_paan$N_Accesion)){
  posinoma_paan[i] <- which(seq_genoma$id==dat_Genoma_paan$N_Accesion[i])
}

seq_genoma_paan <- seq_genoma[posinoma_paan,]

write.table(seq_genoma_paan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_pa_an.txt")

position_d1 <- vector()
for(i in 1:length(Denv1g_pan$N_Accesion)){
  position_d1[i] <- which(seq_genoma_paan$id==Denv1g_pan$N_Accesion[i])
}

seq_d1_paan <- seq_genoma_paan[position_d1,]
write.table(seq_d1_paan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv1_paan.txt")

position_d2 <- vector()
for(i in 1:length(Denv2g_pan$N_Accesion)){
  position_d2[i] <- which(seq_genoma_paan$id==Denv2g_pan$N_Accesion[i])
}

seq_d2_paan <- seq_genoma_paan[position_d2,]
write.table(seq_d2_paan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv2_paan.txt")

position_d3 <- vector()
for(i in 1:length(Denv3g_pan$N_Accesion)){
  position_d3[i] <- which(seq_genoma_paan$id==Denv3g_pan$N_Accesion[i])
}

seq_d3_paan <- seq_genoma_paan[position_d3,]
write.table(seq_d3_paan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv3_paan.txt")

position_d4 <- vector()
for(i in 1:length(Denv4g_pan$N_Accesion)){
  position_d4[i] <- which(seq_genoma_paan$id==Denv4g_pan$N_Accesion[i])
}

seq_d4_paan <- seq_genoma_paan[position_d4,]
write.table(seq_d4_paan, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv4_paan.txt")
#--------------------------
## Vectores de coordenadas geograficas ##

#PAIS Y ANO 
CoordenadasG_paan <- dat_Genoma_paan[,c(10,14,15)]
write.csv(CoordenadasG_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Coordenadas_paan.csv")

CoordenadasGD1_paan <- Denv1g_pan[,c(10,14,15)]
write.csv(CoordenadasGD1_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD1_paan.csv")

CoordenadasGD2_paan <- Denv2g_pan[,c(10,14,15)]
write.csv(CoordenadasGD2_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD2_paan.csv")

CoordenadasGD3_paan <- Denv3g_pan[,c(10,14,15)]
write.csv(CoordenadasGD3_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD3_paan.csv")

CoordenadasGD4_paan <- Denv4g_pan[,c(10,14,15)]
write.csv(CoordenadasGD4_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD4_paan.csv")
#----------------------------------

## VECTORES DE AÑO ##

year_paan <- dat_Genoma_paan$Year
write.csv(year_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/year_paan.csv")

yearD1_paan <- Denv1g_pan$Year
write.csv(yearD1_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD1_paan.csv")

yearD2_paan <- Denv2g_pan$Year
write.csv(yearD2_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD2_paan.csv")

yearD3_paan <- Denv3g_pan$Year
write.csv(yearD3_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD3_paan.csv")

yearD4_paan <- Denv4g_pan$Year
write.csv(yearD4_paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/yearD4_paan.csv")
