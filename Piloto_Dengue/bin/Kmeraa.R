##############################################################################
##              Calculo de k-mers y test de Mantel para aa                  ##
##          11-09-15 Laboratorio de Sistematica y Biogeografia              ##                                        
##############################################################################


dat_seq <- read.table(file = "protM.txt", header= T, sep=" ")
seq <- dat_seq$seq




dat_anos <- read.table(file = "anos.txt", header=T, sep=" ")
anos <- dat_anos$ano



library( stringi)



kmer3 <-  paste(rep(c("A","C","G","T","I","V","S","P","M","E","K","L","R","D","N","W","F","Q","Y","H"),each=400),
                rep(c("A","C","G","T","I","V","S","P","M","E","K","L","R","D","N","W","F","Q","Y","H"),each=20),
                c("A","C","G","T","I","V","S","P","M","E","K","L","R","D","N","W","F","Q","Y","H"),sep = "")

length(kmer3)

result <- t(sapply(seq, stri_count_fixed,pattern=kmer3,overlap=TRUE))
colnames(result) <- kmer3
result

#### calculo de distancia por pares

#seq1_2 <- sum(result[1,]-result[2,]) 
#seq2_3 <- sum(result[2,]-result[3,]) 
#seq1_3 <- sum(result[1,]-result[3,]) 


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


dist_tim <- tiempo(anos)

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= dist_eucli, ydis= dist_tim)

#############################
## escribiendo las tablas ###
#############################

write.table(dist_eucli, file="dist_eucliE.csv")

#write.table(dist_tim, file="dist_tmpo.csv")
    