setwd("/home/andrea/LSB//Piloto_Dengue/bin/descargar CDS r")

library(ape)
library(seqinr)

source('downloadCDSgb.R')

db_gc <-  read.csv(file = "/home/andrea/LSB/Piloto_Dengue/bin/descargar CDS r/bd_genoma_completo.csv")

ID <- db_gc$N_Accesion
ID <- ID[-c(103, 163, 164, 165)]
ID <- ID[-c(472:495)]

ID <- ID[3886:4016]

#ID<-c( ) 
length(ID)


downloadCDSgb(No.Accesion = ID,save.fasta = 'Dengue_24')
