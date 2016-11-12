#######################################################################
##     Conteo de k-mer y calculo de las distancias geneticas  #########
####     distancia Euclidiana, de Mahalanobis y Conteo comun  #########
#####                       de k-mer                          #########
#######################################################################

# Lectura de datos: secuencias de DNA Dengue

dat_seq <- read.table(file = "/home/andrea/LSB/Piloto_Dengue/data/genomas_denv2/cosmopolitan/seq_cosmo.txt", header= T, sep=" ")
seq <- dat_seq$seq
length(seq[1])
length(as.character.fact(seq[1]))
length(strsplit(as.character(seq[4]), NULL)[[1]])
(strsplit("A text I want to display with spaces", NULL)[[1]])
seq[2]
length(seq)


# Conteo de k-mers para tripletas

library(stringi)

kmer3 <-  paste(rep(c("A","C","G","T"),each=16),rep(c("A","C","G","T"),each=4),c("A","C","G","T"),sep = "")

length(kmer3)

result <- t(sapply(seq, stri_count_fixed,pattern=kmer3,overlap=TRUE))
colnames(result) <- kmer3 

kmer3[1][[1]]

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

Euclidian(result)

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

#####

# N ---> las longitudes de todas las secuencias

lonN <- data.frame()

for (i in 1:length(seq)){
  lonN[i,1] <- length(strsplit(as.character(seq[i]), NULL)[[1]])
}


# funcion de la esperada para k = 3
# E(f(a1...ak)) = N-k+1/4^k

Expec <- function(table){
  Expe <- data.frame()
  k <- 3
  for(i in 1:nrow(table)){
    Expe[i,1] <- ((table[i,1]-k+1)/4^k)
  }
  return(Expe)
}

esperada <- Expec(lonN)

#funcion de la varianza para k = 3
# Var[f(a1..ak)] = E (1-1/4^k) - 2/4^2k (k-1)(N-(3/2K)+1) + 2/4^k sum(N-K+1-t) Jt/4^t

Varian <- function(table,k=3,J=0){
  vari <- data.frame()
  for(i in 1:nrow(table)){
    vari[i,1] <- abs(((table[i,1]-k+1)/4^k)*(1-1/4^k)-2/4^2*k*(k-1)*(table[i,1]-(3/2*k)+1)+2/4^k*sum((table[i,1]-k+1-1)* J/4))
  }
  return(vari)
}

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

sum(overlap[1,])

esp_var <- cbind(esperada,varianza)
colnames(esp_var) <- c("esperada","varianza")
esp_var$esperada[1,]
esp_var[1,2]

#Distancia de mahalanobis

Manobis <- function(table){
  distMa <- matrix(0,nrow(table),nrow(table))
  for(i in 1:nrow(table)){
    for(j in 1:nrow(table)){
      distMa[i,j] <- sum(((table[,i]-esp_var1[i,1]/sqrt(esp_var1[i,2]))-(table[,j]-esp_var1[j,1]/sqrt(esp_var[j,2])))^2)
    }
  }
  return(distMa)
}

Manobis(result1)

#########################################################
# Distancia Conteo comun de k-mer                      ##
# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC373290/  ##
# log (0.1 + sum (min(p(s1),p(s2))/(min(l1,l2)-k +1))) ##
# min(p(s1),p(s2) --> valor minimo del conteo de k-mers #
# min(l1,l2) --> Valor minimo de longitud de secuencia ##
# k --> longitud de subsecuencia                       ##
# log --> transformacion logaritmica                   ##
#########################################################

min_tri <- list()
Fractional <- function(table){
  for(n in 1:ncol(table)){
    for (i in 1:nrow(table)){
      for (j in 1:nrow(table)){
        k <- 3
        min_tri[[i]] <- sum(min(c(i,j))/min(c(length(strsplit(as.character(seq[i]), NULL)[[1]])),length(strsplit(as.character(seq[j]), NULL)[[1]])))
      }
    }
  }
}

Fractional(result)
warnings()

Fractional <- function(table){
  distF <- matrix(0,nrow(table),nrow(table))
  for (i in 1:nrow(table)){
    for (j in 1:nrow(table)){
      
      dist[i,j] <- log2(0,1 + sum(min_s)/)
    }
  }
}

####
## Archivo Igual

##############################################################################
##              Calculo de k-mers y test de Mantel para ADN                 ##
##          11-09-15 Laboratorio de Sistematica y Biogeografia              ##                                        
##############################################################################


#Cargar datos

dat_seq <- read.table(file = "seq_cosmo.txt", header= T, sep=" ")
seq <- dat_seq$seq

dat_anos <- read.table(file = "seqNS.txt", header=T, sep=" ")
seqaa <- dat_anos$seq


# Conteo de k-mer

library(stringi)

kmer3 <-  paste(rep(c("A","C","G","T"),each=16),rep(c("A","C","G","T"),each=4),c("A","C","G","T"),sep = "")

length(kmer3)

result <- t(sapply(seq, stri_count_fixed,pattern=kmer3,overlap=TRUE))
colnames(result) <- kmer3
a <- result[8,]


### distancia euclidiana
#table para no asignar el objeto vacio

distEucli <- function(matriz=NULL){
  result <- matrix(0,nrow(matriz),nrow(matriz))
  for (i in 1:nrow(matriz)){
    for (j in 1:nrow(matriz)){
      result[i,j] <- sum((matriz[i,]-matriz[j,])^2)
    }
  }
  return(result)
}

distEucli(result)

dist_eucli <- distEucli(result)

###
distEucli <- function(matriz=NULL){
  result <- matrix(0,nrow(matriz),nrow(matriz))
  for (i in 1:nrow(matriz)){
    for (j in 1:nrow(matriz)){
      result[i,j] <- sum((matriz[i,]-matriz[j,])^2)
    }
  }
  return(result)
}

### Delta del tiempo

tiempo <- function(x){
  result <- matrix(0,length(x),length(x))
  for (i in 1:length(x)){
    for (j in 1:length(x)){
      result[i,j] <- abs(x[[i]]-x[[j]])
    }
  }
  return(result)
}

tiempo(anos)

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= dist_eucli, ydis= dist_eucliaa)

#############################
## escribiendo las tablas ###
#############################

#write.table(dist_eucli, file="dist_eucli.csv")

#write.table(dist_eucliaa, file="dist_eucliaaNS.csv")
