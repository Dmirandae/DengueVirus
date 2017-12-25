            #######################################################################
            ##     Conteo de k-mer y calculo de las distancias geneticas  #########
            ####     distancia Euclidiana, de Mahalanobis y Conteo comun  #########
            #####                       de k-mer                          #########
            #######################################################################

# Lectura de datos: secuencias de DNA Dengue

#-----------------------------------------------------------------------------------
## GEN E ##
            
#1. Secuencias del Gen E con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_loan.txt", header= T, sep=" ")

seq <- dat_seq$seq

#1.1 Secuencias del Gen E Dengue 1 con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv1.txt", header = T, sep = " ")
seq <- dat_seq$seq

#1.2 Secuencias del Gen E Dengue 1 con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv1.txt", header = T, sep = " ")
seq <- dat_seq$seq

#1.3 Secuencias del Gen E Dengue 2 con localidad y año
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv2.txt", header = T, sep = " ")
seq <- dat_seq$seq

#1.4 Secuencias del Gen E Dengue 3 con localidad y año
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv3.txt", header = T, sep = " ")
seq <- dat_seq$seq

#1.4 Secuencias del Gen E Dengue 4 con localidad y año
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Seq_denv4.txt", header = T, sep = " ")
seq <- dat_seq$seq
#------------------------------------------------------------------------------------------

## GENOMA ##

#1. Secuencias del Genoma con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_loan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#1.1 Secuencias del Genoma Dengue 1 con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv1_loan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#1.2 Secuencias del Genoma Dengue 2 con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv2_loan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#1.3 Secuencias del Genoma Dengue 3 con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv3_loan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#1.4 Secuencias del Genoma Dengue 4 con localidad y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_denv4_loan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#-------

#2. Secuencias del Genoma con pais y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Seq_pa_an.txt", header= T, sep=" ")
seq <- dat_seq$seq

#2.1 Secuencias del Genoma Dengue 1 con pais y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv1_paan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#2.2 Secuencias del Genoma Dengue 2 con pais y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv2_paan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#2.3 Secuencias del Genoma Dengue 3 con pais y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv3_paan.txt", header= T, sep=" ")
seq <- dat_seq$seq

#2.4 Secuencias del Genoma Dengue 4 con pais y ano
dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/seq_denv4_paan.txt", header= T, sep=" ")
seq <- dat_seq$seq

# Conteo de k-mers para tripletas k=3

library(stringi)

kmer3 <-  paste(rep(c("A","C","G","T"),each=16),rep(c("A","C","G","T"),each=4),c("A","C","G","T"),sep = "")

length(kmer3)

result <- t(sapply(seq, stri_count_fixed, pattern=kmer3, overlap=TRUE))
colnames(result) <- kmer3 
result <- as.data.frame(result)

######################################################################################################
########################
# Distancia Euclidiana #
# sum(p(s1)-p(s2))^2  ##
########################

Euclidian <- function(table){
  distE <- matrix(0,nrow(table),nrow(table))
  for (i in 1:nrow(table)){
    for (j in 1:nrow(table)){
      distE[i,j] <- sum((table[i,]-table[j,])^2)
    }
  }
  return(distE)
}

Euclidiana <- Euclidian(result)

#-----------------------------------------------------------------------------------------------
## MATRICES GEN E ##

# matrix genE con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Euclidiana_loan.csv")

# matrix Dengue 1 genE con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Euclidiana_DENV1_loan.csv")

# matrix Dengue 2 gen E con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Euclidiana_DENV2_loan.csv")

# matrix Dengue 3 gen E con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Euclidiana_DENV3_loan.csv")

# matrix Dengue 4 gen E con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Euclidiana_DENV4_loan.csv")
#---------------------------------------------------------------------------------------------

## MATRICES GENOMA

# matrix genoma con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_loan.csv")

# matrix Dengue 1 genoma con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV1_loan.csv")

# matrix Dengue 2 genoma con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV2_loan.csv")

# matrix Dengue 3 genoma con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV3_loan.csv")

# matrix Dengue 4 genoma con localidad y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV4_loan.csv")
#----------

# matrix genoma con pais y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_paan.csv")

# matrix Dengue 1 genoma con pais y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV1_paan.csv")

# matrix Dengue 2 genoma con pais y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV2_paan.csv")

# matrix Dengue 3 genoma con pais y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV3_paan.csv")

# matrix Dengue 4 genoma con pais y ano
Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Euclidiana_DENV4_paan.csv")

#######################################################################################################
###################
# Dist Mahalanobis #
####################

#Calculo de capacidad de solapamiento para todas las tripletas posibles

library(reshape2)
kmerspt <- colsplit(kmer3, "", names=c(1,2,3))

overlap <- data.frame()
for(i in 1:nrow(kmerspt)){
  for(j in 1:ncol(kmerspt)){
    overlap[i,1] <- as.numeric(kmerspt[i,3]==kmerspt[i,1])
    overlap[i,2] <- as.numeric(kmerspt[i,3]==kmerspt[i,2])
  }
}

rownames(overlap) <- kmer3

#Calculo de la longitud de cada una de las secuencias
# N ---> las longitudes de todas las secuencias

lonN <- data.frame()

for (i in 1:length(seq)){
  lonN[i,1] <- length(strsplit(as.character(seq[i]), NULL)[[1]])
}


# Funcion de la varianza para k = 3
# Var[f(a1..ak)] = E (1-1/4^k) - 2/4^2k (k-1)(N-(3/2K)+1) + 2/4^k sum(N-K+1-t) Jt/4^t

Varian <- function(table1, table2, k=3){
  vari <- data.frame()
  for(i in 1:nrow(table1)){
    for(j in 1:nrow(table2)){
      vari[i,j] <- (((table1[i,1]-k+1)*(1/4)^k) * (1-((table1[i,1]-k+1)*(1/4)^k)) + ((((1/4)^k)^2)*((table1[i,1]-k+1)-k)*((table1[i,1]-k+1)-k+1)) + (2*(1/4)^k) * sum(((table1[i,1]-k+1)-1)*(sum(table2[j,]))*((1/4)^1)))   
    }
  }
  return(vari)
}

varianza <- Varian(lonN,overlap)
colnames(varianza) <- kmer3

# Calculo de la Distancia de mahalanobis

nobis <- data.frame()
for (i in 1:nrow(result)){
  for (j in 1:nrow(varianza)){
    nobis[i,j] <- sum(((result[i,]/varianza[i,])-(result[j,]/varianza[j,]))^2)
  }
}

Mahalanobis <- nobis

#--------------------------------------------------------------------------------------------

## MATRICES GEN E 

# Matrix de Gen E con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Mahalanobis_loan.csv")

# Matrix de Dengue 1 Gen E con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Mahalanobis_DENV1_loan.csv")

# Matrix de Dengue 2 Gen E con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Mahalanobis_DENV2_loan.csv")

# Matrix de Dengue 3 Gen E con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Mahalanobis_DENV3_loan.csv")

# Matrix de Dengue 4 Gen E con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Mahalanobis_DENV4_loan.csv")
#--------------------------------------------------------------------------------------------------

## MATRICES GENOMA

# matrix genoma con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_loan.csv")

# matrix de Dengue 1 genoma con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV1_loan.csv")

# matrix de Dengue 2 genoma con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV2_loan.csv")

# matrix de Dengue 3 genoma con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV3_loan.csv")

# matrix de Dengue 4 genoma con localidad y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV4_loan.csv")

#----------------
# matrix genoma con pais y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_paan.csv")

# matrix Dengue 1 genoma con pais y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV1_paan.csv")

# matrix Dengue 2 genoma con pais y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV2_paan.csv")

# matrix Dengue 3 genoma con pais y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV3_paan.csv")

# matrix Dengue 4 genoma con pais y ano
Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Mahalanobis_DENV4_paan.csv")

# 3:25.82 min

########################################################################################################
#########################################################
# Distancia Conteo comun de k-mer                      ##
# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC373290/  ##
# 1 - (sum (min(p(s1),p(s2))/(min(l1,l2)-k +1)))       ##
# min(p(s1),p(s2) --> valor minimo del conteo de k-mers #
# min(l1,l2) --> Valor minimo de longitud de secuencia ##
# k --> longitud de subsecuencia                       ##
# log --> transformacion logaritmica                   ##
#########################################################

# Calculo de los minimos entre las frecuencias por pares de secuencias

soul_sal <- data.frame()

for(i in 1:ncol(result)){
  soul <- vector()
  for(f in 1:length(result[,i])){
    for(ty in 1:length(result[,i])){
      soul <- c(soul, min(c(result[f,i], result[ty,i])))
    }
  }
  soul_sal[1:100,i] <- soul
}

sume <- t(apply(soul_sal, 1, sum))
sume <- as.data.frame(t(sume))
##40 seg
# Calculo de lo minimos entre las longitudes por pares de secuencias

minlon <- vector()
for (i in 1:nrow(lonN)){
  algo <- 1:length(lonN[,1])
  for(n in algo){
    minlon <- c(minlon,min(lonN[i,1],lonN[n,1]))
  }
}
min_lon <- as.data.frame(minlon)

# Calculo de la ecuacion completa
# Fraccional k-mer common

Fractional <- function(table, table1, k=3){ # sume, minlon
  commonk <- data.frame()
  for(j in 1:nrow(table)){
    commonk[1,j] <- 1- (table[j,1]/(table1[j,1]-k+1))
  }
  return(commonk)
}

Fractional_common <- Fractional(sume, min_lon)

# 15 seg

#Construcción de la matriz para Fraccional k-mer common

mmtx <- matrix(data = Fractional_common, nrow = 10, ncol = 10, byrow = FALSE,
       dimnames = NULL)

#-------------------------------------------------------------------------------------------------

## MATRICES GEN E

# Matrix gen E con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_loan.csv")

# Matrix Dengue1 gen E con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV1_loan.csv")

# Matrix Dengue2 gen E con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV2_loan.csv")

# Matrix Dengue3 gen E con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV3_loan.csv")

# Matrix Dengue4 gen E con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV4_loan.csv")
#------------------------------------------------------------------------------------------------

## MATRICES GENOMA ##

# Matrix genoma con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_loan.csv")

# Matrix Dengue 1 genoma con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV1_loan.csv")

# Matrix Dengue 2 genoma con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV2_loan.csv")

# Matrix Dengue 3 genoma con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV3_loan.csv")

# Matrix Dengue 4 genoma con localidad y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV4_loan.csv")
#-----

# Matrix genoma con pais y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_paan.csv")

# Matrix Dengue 1 genoma con pais y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV1_paan.csv")

# Matrix Dengue 2 genoma con pais y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV2_paan.csv")

# Matrix Dengue 3 genoma con pais y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV3_paan.csv")

# Matrix Dengue 4 genoma con pais y ano
Dist_Fractional <- write.csv(mmtx, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV4_paan.csv")

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= Euclidiana, ydis= Mahalanobis)
mantel(xdis= Mahalanobis, ydis= mmtx)
mantel(xdis= Euclidiana, ydis= mmtx)

#############################
## escribiendo las tablas ###
#############################

#write.table(dist_eucli, file="dist_eucli.csv")

#write.table(dist_eucliaa, file="dist_eucliaaNS.csv")

####################################################################################################
# Calculo de los minimos entre las frecuencias por pares de secuencias

#salida <- data.frame()
#for(i in 1:ncol(result)){
#  rest <- 1:length(result[,i])
#  salida_col <- vector()
#  for(f in 1:length(result[,i])){
#   res <- rest[-(1:f)]
#    for(ty in res){
#      salida_col <- c(salida_col, min(c(result[f,i], result[ty,i])))
#    }
#  }
# salida[1:6,i] <- salida_col
#}
#colnames(salida) <- kmer3

# Calculo de lo minimos entre las longitudes por pares de secuencias

#minlon <- vector()
#for (i in 1:nrow(lonN)){
#  algo <- 1:length(lonN[,1])
#  noalgo <- algo[-(1:i)]
#  for(n in noalgo){
#    minlon <- c(minlon,min(lonN[i,1],lonN[n,1]))
#  }
#}

#min_lon <- as.data.frame(minlon)

###
# Calculo de la ecuacion completa
# Fraccional k-mer common

#Fractional <- function(table, table1, k=3){ # sume, minlon
#  commonk <- data.frame()
#  frec <- vector()
#  lonv <- vector()
#  for(j in 1:nrow(table)){
#    frec <- sum(table[j,])
#    lonv <- sum(table1[j,])
#    commonk[j,1] <- log(0.1 + frec/(lonv-2))
#  }
#  return(commonk)
#}

#Fraccional_common <- Fractional(salida,min_lon)


#for (i in 1:nrow(mmtx)){
#  n <- nrow(mmtx)
#  m <- nrow(mmtx)-i
#  mfila <- common[1:m]
# common <- common[-(1:length(mfila))]
#  mmtx[i:n,i] <- mfila
#}


#fra_matrix <- data.frame(NA)
#for (i in 1:nrow(result)){
#  n <- nrow(result)
#  m <- nrow(result)-i
#  mfila <- common[1:m]
#  common <- common[-(1:length(mfila))]
#  fra_matrix[1:n,i] <- c(1:i,mfila) 
#}