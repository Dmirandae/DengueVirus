dat_seq <- read.table(file = "seq_cosmo.txt", header= T, sep=" ")
seq <- dat_seq$seq

###
library(stringi)

kmer3 <-  paste(rep(c("A","C","G","T"),each=16),rep(c("A","C","G","T"),each=4),c("A","C","G","T"),sep = "")

length(kmer3)

result <- t(sapply(seq, stri_count_fixed,pattern=kmer3,overlap=TRUE))
colnames(result) <- kmer3
result

####
# Distancia Euclidiana
# sum(p(s1)-p(s2))^2
?table()
Euclidiana <- function(table){
  distE <- matrix(0,nrow(table),nrow(table))
  for (i in 1:nrow(table)){
    for (j in 1:nrow(table)){
      distE[i,j] <- sum((table[i,]-table[j,])^2)
    }
  }
  return(distE)
}

Euclidiana(result)

########
# Distancia Conteo comun de k-mer
# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC373290/

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
