#######################################################################
##     Conteo de k-mer y calculo de las distancias geneticas  #########
####     distancia Euclidiana, de Mahalanobis y Conteo comun  #########
#####                       de k-mer                          #########
####          CORRELACION ENTRE LAS TRES METRICAS             ######### 
#######################################################################

# Lectura de datos: secuencias de DNA Dengue

# Set datos 1: secuencias que yo cree para comparar las metricas

seq <- c("TCAGGTCATCAGG", "CGGTTACATCGGT", "CACGCTAGACTAT", "TCAAAAAAGCTAG", "CAGTAAAAAAGCT")

# seq 1 = "AGCGTACGTAGCG"
# seq 2 = "TCAGGTCATCAGG"
# seq 3 = "AGCGTACGTAGCG"
# seq 4 = "CGGTTACATCGGT"
# seq 5 = "CACGCTAGACTAT"
# seq 6 = "TCAAAAAAGCTAG"
# seq 7 = "CAGTAAAAAAGCT"


# Set datos 2: 41 secuencias del genoma de dengue 2 que use en el trabajo para el congreso de ciencias biologicas

dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Piloto_congreso_CCB/genomas_denv2/todos/genotipos_genoma.txt", header= T, sep=" ")

seq <- dat_seq$seq

# Set datos 3: 142 secuencias del Gen E de Dengue 1, 2 ,3 ,y 4.(estas son las secuencias que se seleccionaron luego de hacer uclust con id 97%)

dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/seq_Disimilaridad97.txt", header= T, sep=" ")

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


Dist_Euclidiana <- write.csv(Euclidiana, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/Dist_Euclidiana.csv")

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

Dist_Mahalanobis <- write.csv(Mahalanobis, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/Dist_Mahalanobis.csv")

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
  soul_sal[1:20164,i] <- soul
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

mmtx <- matrix(data = Fractional_common, nrow = 142, ncol = 142, byrow = FALSE,
               dimnames = NULL)


Dist_Fractional <- write.csv(fra_matrix, file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/Dist_Fraccional.csv")

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= Euclidiana, ydis= Mahalanobis)
mantel(xdis= Mahalanobis, ydis= mmtx)
mantel(xdis= Euclidiana, ydis= mmtx)


#####################
#### Pearson     ####
#####################

# Euclidiana Vs Mahalanobis
Mahalanobis <- as.matrix(Mahalanobis)
cor.test(Euclidiana, Mahalanobis, method = "pearson")

# Mahalanobis Vs Fractional
Fractional_common <- as.matrix(Fractional_common)
mmtx <- matrix(data = Fractional_common, nrow = 142, ncol = 142, byrow = FALSE,
               dimnames = NULL)
cor.test(Mahalanobis, mmtx, method = "pearson")

# Euclidiana Vs Fractional
cor.test(Euclidiana, mmtx, method = "pearson")

# Graficas y regresion lineal

# 1. Ajustar datos

Elim_Eu <- which(upper.tri(Euclidiana)==F)
dist.eucli <- Euclidiana[-Elim_Eu]

Elim_Ma <- which(upper.tri(Mahalanobis)==F)
dist.maha <- Mahalanobis[-Elim_Ma]

Elim_Fr <- which(upper.tri(mmtx)==F)
dist.fract <- mmtx[-Elim_Fr]

data.dist <- cbind(dist.eucli,dist.maha,dist.fract)
data.dist <- as.data.frame(data.dist)

library("ggpubr")

pem <- ggscatter(data.dist, x = "dist.eucli", y = "dist.maha", size = 0.5,
          add = "reg.line", add.params = list(color="red"), conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Dist. Euclidiana", ylab = "Dist. Mahalanobis")

pmf <- ggscatter(data.dist, x = "dist.maha", y = "dist.fract", size = 0.5,
          add = "reg.line", add.params = list(color="red"), conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Dist. Mahalanobis", ylab = "Dist. Conteo Fracional de k-mer comunes ")

pef <- ggscatter(data.dist, x = "dist.eucli", y = "dist.fract", size = 0.5,
          add = "reg.line", add.params = list(color="red"), conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Dist. Euclidiana", ylab = "Dist. Conteo Fracional de k-mer comunes ")
