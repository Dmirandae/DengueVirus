################################################################################
####              Descargar secuencias de Genoma completo                #######
###                y del Gen E para el virus del Dengue                  #######
################################################################################

## DESCARGAR BASE DE DATOS DE GENOMA COMPLETO ###

# Leer el archivo con la base de datos 
bd_dengue <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue/bd_Dengue.csv", stringsAsFactors = F)

# Saber las posiciones de los datos con las siguentes caracteristicas:
# (Esto con el fin de poder eliminar estos datos que no me sirven para mi trabajo y poder descargar los datos ya filtrados)

# 1. Los datos que tengan NA tanto en la columna pais como en la columna ano
country_year_na <- which(is.na(bd_dengue$Country) & is.na(bd_dengue$Year))

# 2. Los datos que no tienen reportado el serotipo
dsserotype <- which(bd_dengue$Serotype=="DENV")

# 3. Los datos que son clones
dsclone <- which(bd_dengue$Serotype=="Clone")

# 4. Los datos no verificados
dsunverified <- which(bd_dengue$Serotype=="UNVERIFIED")

# 5. Los datos que son quimeras
dschimeric <- which(bd_dengue$Serotype=="Chimeric")

# Concateno las posiciones de esos datos que no me sirve, que no quiero descargar
bd_eliminar <- c(country_year_na,dsserotype,dschimeric, dsclone,dsunverified)

# Eliminos esos datos que ya he identificado antes y que no quiero descargar
datos <- bd_dengue[-bd_eliminar,]

# Escribo esta nueva version de la base de datos
write.csv(datos,file = "/home/andrea/LSB/Piloto_Dengue/data/Base_Datos/Base_Datos_Dengue/bd_Dengue_v02.csv")

# De la nueva base de datos Extraigo solo los datos que tiene genoma completo
Complete_genome <- datos[which(datos$Gene=="Complete_Genome" & datos$Size_sequence>10100),]

# Lista de numeros de acceso
ID <- Complete_genome$N_Accesion

which(ID=="AJ487271")
No.Accesion <-ID[3893:3916]
ID[3893]
length(ID)
----------------------------------------------------------------------------------------------------
# Estas secuencias fueron descargadas usando la funcion escrita por Viviana Romero-Alarcon 
# en el codigo downloadCDSgb.R 
# ejecutado con el codigo CDS_dowland_genbank.R 
# https://github.com/alarconvv/download.CDS.GenBank  
  
  
#Algunas secuencias no se descargaron por alguna de las sifuientes razones:

# No se reporta el CDS en el GenBank
# No se reporta un numero de acceso, solo se reporta el numero gb y este numero no esreconocido por el código
# Tiene una longitud menor a 1100 pb
# Estan etiquetadas por el Gen Bnak como clon, quimera, inverificada
# No reporta el serotipo al que pertenece

# No tiene como tal un numero de acceso si no que se reporta se numero de gb asi:
#  "NC_002640" "NC_001474" "NC_001477" "NC_001475" 

# NO REPORTA CDS
#sincds <- c("EU920839", "KC131141", "KC131140", "HM631854", "HM631853" ,"HM631852", "HM631851", "HM631855", 
#            "FJ913015", "JQ045685", "JQ045683", "JQ045682", "JQ045681", "JQ045680", "JQ045679", "JQ045678", 
#            "JQ045677", "JQ045676", "JQ045675", "JQ045674", "JQ045673", "JQ045672", "JQ045671", "JQ045669", 
#            "JQ045627", "M87512", "EU179861", "EU179860", "FJ177308")

# Clones
# FJ828987, FJ828986, AY145122, AY145121, AY145123, U88537, U88536, U88535, AB543624
# AF375822, AF326827, AF326826, AF326825, DQ285561,
----------------------------------------------------------------------------------------------------
# Patición para correr por partes. 

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
length(ids)
which(ids=="AB111090")
# Busqueda de las secuencas por medio de sus numero de accseso

genE_sequences <- read.GenBank(ids)

genE_sequences_ids <- paste(attr(genE_sequences, "species"), names(genE_sequences), sep = "_")

# Guardando las secuencias 

write.dna(genE_sequences,"/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/Gen_E.fasta", format = "fasta")
