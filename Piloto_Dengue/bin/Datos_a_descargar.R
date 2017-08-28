################################################################################
####              Descargar secuencias de Genoma completo                #######
###                y del Gen E para el virus del Dengue                  #######
################################################################################

## DESCARGAR BASE DE DATOS DE GENOMA COMPLETO ###

# Leer el archivo con la base de datos 
datos <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue/bd_Dengue.csv", stringsAsFactors = F)

# Extraigo solo los datos que tiene genoma completo
Complete_genome <- datos[which(datos$Gene=="Complete_Genome"),]

# Lista de numeros de acceso
ID <- Complete_genome$N_Accesion

# Presenta problemas con la secuencia 103, 163, 164 y 165 la elimine de los datos para ver si es solo esa y poder a vanzar.
ID <- ID[-c(103, 163, 164, 165)]

# NOTA : LA SECUENCIA 671 Y LA 1059:1062, 1081, 1737, 3311, 3313:3327, 3369, 3553, 3554, 3769, 3838:1840, 3883:3885, 
# 3892,3893, 3915, 3988:3990(clones) PRESENTÓ PROBLEMAS PARA DESCARGARSE PORQUE EN EL GENBANK NO SE ESPECIFICA EL CDS,
# ASI QUE ME SALTE ESA SECUENCIA.

# Patición para correr por partes

ID <- ID[1:500]
ID <- ID[501:1000]  
ID <- ID[1001:1500] 
ID <- ID[1501:2000]
ID <- ID[2001:2500]
ID <- ID[2501:3000]
ID <- ID[3001:3500]
ID <- ID[3501: 4000]
ID <- ID[4001:4016]

sequences_dengue <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/bin/descargar CDS r/Dengue_total")

#-----------------------------------------------------------------------------------------

###################################
# Descargar secuencias del gen E  #
####################################

# Librerias requeridas

library(ape)
library(seqinr)

# Extraigo solo los datos que tiene genoma completo

Gen_E <- datos[which(datos$Gene=="E"),]

# Lista de numeros de acceso

ids <- Gen_E$N_Accesion

# Busqueda de las secuencas por medio de sus numero de accseso

genE_sequences <- read.GenBank(ids)

genE_sequences_ids <- paste(attr(genE_sequences, "species"), names(genE_sequences), sep = "_")

# Guardando las secuencias 

write.fasta(sequences = genE_sequences, names = genE_sequences_ids, file.out = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/Gen_E.fasta")

