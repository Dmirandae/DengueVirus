################################################################################
####              Descargar secuencias de Genoma completo                #######
###                y del Gen E para el virus del Dengue                  #######
################################################################################

## DESCARGAR BASE DE DATOS DE GENOMA COMPLETO ###

# Leer el archivo con la base de datos 
datos <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue/bd_Dengue.csv", stringsAsFactors = F)

# Extraigo solo los datos que tiene genoma completo
Complete_genome <- datos[which(datos$Gene=="Complete_Genome" & datos$Size_sequence>10100 & datos$Size_sequence<11000),]

# Lista de numeros de acceso
ID <- Complete_genome$N_Accesion

# Presenta problemas con la secuencia 103, 163, 164 y 165 la elimine de los datos 
# para ver si es solo esa y poder a vanzar, observe que el problema con estas secuencias
# es que no tiene como tal un numero de acceso si no que se reporta se numero de gb asi:
#  "NC_002640" "NC_001474" "NC_001477" "NC_001475" respectivamente
ID <- ID[-c(103, 163, 164, 165)]

# NOTA : LA SECUENCIA 671 Y LA 1059:1062, 1081, 1737, 3311, 3313:3327, 3369, 3553, 3554, 3769, 3838:1840, 3883:3885, 
# 3892,3893, 3915, 3988:3990(clones) PRESENTÓ PROBLEMAS PARA DESCARGARSE PORQUE EN EL GENBANK NO SE ESPECIFICA EL CDS,
# ASI QUE ME SALTE ESA SECUENCIA.
# NO REPORTA CDS
# EU920839, KC131141, KC131140, HM631854, "HM631853" "HM631852" "HM631851", "HM631855", 
# FJ913015, JQ045685
# JQ045683, JQ045682, JQ045681, "JQ045680" "JQ045679" "JQ045678" "JQ045677" "JQ045676"
# "JQ045675" "JQ045674" "JQ045673" "JQ045672" "JQ045671" "JQ045669"
# JQ045627, 

# Patición para correr por partes

ID <- ID[1:5]
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

# Extraigo solo los datos de gen E, que tengan una longitud de la secuencia entre
# 1300 a 1600 pb , teniendo encuenta que la longitud del gen E reportada por las 
# secuencias de referencia del GenBnak es de 1485 pb

Gen_E <- datos[datos$Gene=="E" & datos$Size_sequence>1300 & datos$Size_sequence<1600, ]

# Lista de numeros de acceso

ids <- Gen_E$N_Accesion

# Busqueda de las secuencas por medio de sus numero de accseso

genE_sequences <- read.GenBank(ids[1])

genE_sequences_ids <- paste(attr(genE_sequences, "species"), names(genE_sequences), sep = "_")

# Guardando las secuencias 

write.fasta(sequences = genE_sequences, names = genE_sequences_ids, file.out = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/Gen_E.fasta")

