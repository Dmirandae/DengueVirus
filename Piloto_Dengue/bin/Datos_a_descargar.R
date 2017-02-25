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
# Las secuencias del 472 al 495 no pertenecen a genoma total, ya fueron revisadas en el genbank
ID <- ID[-c(472:495)]
# NOTA : LA SECUENCIA 671 Y LA 1059:1062, 1081 PRESENTÓ PROBLEMAS PARA DESCARGARSE PORQUE EN EL GENBANK NO SE ESPECIFICA EL CDS,
# ASI QUE ME SALE ESA SECUENCIA.

ID <- ID[471:500]
ID <- ID[966:1000]  
ID <- ID[1107:1500] 
ID <- ID[1501:2000] ##EStre
ID <- ID[2001:2500]
ID <- ID[2501:3000]
ID <- ID[3001:3500]
ID <- ID[3501: 4000]
ID <- ID[4001:4016]

which(ID == "GQ868513")
ID[1106]
sequences_dengue <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/bin/descargar CDS r/Dengue_16")

ID[470]
which(ID == "KF286649")
which(ID == "KF286648")
which(ID == "KF286647")
which(ID == "KF286646")
which(ID == "KF286645")
which(ID == "KF286644")
which(ID == "KF286643")
which(ID == "KF286642")
which(ID == "KF286641")
which(ID == "KF286640")
which(ID == "KF286639")
which(ID == "KF286638")
which(ID == "KF286637")
which(ID == "KF286636")
which(ID == "KF286635")
which(ID == "KF286634")
which(ID == "KF286633")
which(ID == "KF286632")
which(ID == "KF286631")
which(ID == "KF286630")
which(ID == "KF286629")
which(ID == "KF286628")
which(ID == "KF286627")
which(ID == "KF286626")

