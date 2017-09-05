setwd("/home/andrea/LSB//Piloto_Dengue/bin/descargar CDS r")

library(ape)
library(seqinr)

source('downloadCDSgb.R')


# Los ID son especificados en el script Datos_a_descargar.R

downloadCDSgb(No.Accesion = ID[765],save.fasta = 'Dengue_1')
