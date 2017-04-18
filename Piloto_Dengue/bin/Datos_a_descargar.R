###################################################################################
#                Datos a Descaragar para empezar a correr                   #######
###################################################################################

## DESCARGAR BASE DE DATOS DE GENOMA COMPLETO ###

# Leer el archivo con la base de datos de genoma completo.
db_gc <-  read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_genoma_completo.csv")

# Lista de numeros de acceso
ID <- db_gc$N_Accesion


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

library(ape)
library(seqinr)
# Leer base de datos del Gen E

dat_genE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos_Dengue_2016/bd_GenE.csv")

genE_naccesion <- dat_genE$N_Accesion

genE_sequences <- read.GenBank(genE_naccesion)

genE_sequences_ids <- paste(attr(genE_sequences, "species"), names(genE_sequences), sep = "_")

write.dna(genE_sequences, file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE_bd2016/genE_secuencias.fas", format = "fasta", nbcol = 6)

genE_seq_format <- read.fasta(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE_bd2016/genE_secuencias.fas", seqtype = "DNA", as.string = T)

write.fasta(sequences = genE_seq_format, names = genE_sequences_ids, file.out = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE_bd2016/genE_secuencias_total.fasta")

