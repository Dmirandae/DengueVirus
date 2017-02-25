setwd("/home/andrea/LSB//Piloto_Dengue/bin/descargar CDS r")

library(ape)
library(seqinr)

source('downloadCDSgb.R')

ID<-c( ) 
length(ID)


downloadCDSgb(No.Accesion = ID,save.fasta = 'Dengue_17')
