# Distancias Geograficas
# point distances

library(raster)

## GEN E ##
#1. Gen E con localidad
CoordenadasGE_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/Coordenadas_loan.csv")
lon_lat <- CoordenadasGE_loan[,c(4,3)]

dist.GE.loan <- pointDistance(lon_lat, lon_lat, lonlat = F, allpairs = T)
colnames(dist.GE.loan) <- CoordenadasGE_loan$Location
rownames(dist.GE.loan) <- CoordenadasGE_loan$Location
write.csv(dist.GE.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist.GE.loan.csv")

#1.1 Gen E Dengue 1 localidades
CoordenadasD1GE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD1_loan.csv")
lon_lat1 <- CoordenadasD1GE[,c(4,3)]

dist.D1.loan <- pointDistance(lon_lat1, lon_lat1, lonlat = F, allpairs = T)
colnames(dist.D1.loan) <- CoordenadasD1GE$Location
rownames(dist.D1.loan) <- CoordenadasD1GE$Location
write.csv(dist.D1.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist.D1.loan.csv")

#1.2 Gen E Dengue 2 localidades
CoordenadasD2GE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD2_loan.csv")
lon_lat2 <- CoordenadasD2GE[,c(4,3)]

dist.D2.loan <- pointDistance(lon_lat2, lon_lat2, lonlat = F, allpairs = T)
colnames(dist.D2.loan) <- CoordenadasD2GE$Location
rownames(dist.D2.loan) <- CoordenadasD2GE$Location
write.csv(dist.D2.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist.D2.loan.csv")

#1.3 Gen E Dengue 3 localidades
CoordenadasD3GE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD3_loan.csv")
lon_lat3 <- CoordenadasD3GE[,c(4,3)]

dist.D3.loan <- pointDistance(lon_lat3, lon_lat3, lonlat = F, allpairs = T)
colnames(dist.D3.loan) <- CoordenadasD3GE$Location
rownames(dist.D3.loan) <- CoordenadasD3GE$Location
write.csv(dist.D3.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist.D3.loan.csv")

#1.4 Gen E Dengue 4 localidades
CoordenadasD4GE <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genE/sub_database/CoordenadasD4_loan.csv")
lon_lat4 <- CoordenadasD4GE[,c(4,3)]

dist.D4.loan <- pointDistance(lon_lat4, lon_lat4, lonlat = F, allpairs = T)
colnames(dist.D4.loan) <- CoordenadasD4GE$Location
rownames(dist.D4.loan) <- CoordenadasD4GE$Location
write.csv(dist.D4.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist.D4.loan.csv")

## GENOMA ##

#2. Genoma con localidad
CoordenadasGN_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Coordenadas_loan.csv")
lon_lat <- CoordenadasGN_loan[,c(4,3)]

dist.GN.loan <- pointDistance(lon_lat, lon_lat, lonlat = F, allpairs = T)
colnames(dist.GN.loan) <- CoordenadasGN_loan$Location
rownames(dist.GN.loan) <- CoordenadasGN_loan$Location
write.csv(dist.GN.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.GN.loan.csv")

#2.1 Genoma dengue 1 con localidad
CoordenadasD1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD1_loan.csv")
lon_lat1 <- CoordenadasD1_loan[,c(4,3)]

dist.D1.loan <- pointDistance(lon_lat1, lon_lat1, lonlat = F, allpairs = T)
colnames(dist.D1.loan) <- CoordenadasD1_loan$Location
rownames(dist.D1.loan) <- CoordenadasD1_loan$Location
write.csv(dist.D1.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D1.loan.csv")

#2.2 Genoma dengue 2 con localidad
CoordenadasD2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD2_loan.csv")
lon_lat2 <- CoordenadasD2_loan[,c(4,3)]

dist.D2.loan <- pointDistance(lon_lat2, lon_lat2, lonlat = F, allpairs = T)#REVISAR
colnames(dist.D2.loan) <- CoordenadasD2_loan$Location
rownames(dist.D2.loan) <- CoordenadasD2_loan$Location
write.csv(dist.D2.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D2.loan.csv")

#2.3 Genoma dengue 3 con localidad
CoordenadasD3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD3_loan.csv")
lon_lat3 <- CoordenadasD3_loan[,c(4,3)]

dist.D3.loan <- pointDistance(lon_lat3, lon_lat3, lonlat = F, allpairs = T)
colnames(dist.D3.loan) <- CoordenadasD3_loan$Location
rownames(dist.D3.loan) <- CoordenadasD3_loan$Location
write.csv(dist.D3.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D3.loan.csv")

#2.4 Genoma dengue 4 con localidad
CoordenadasD4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD4_loan.csv")
lon_lat4 <- CoordenadasD4_loan[,c(4,3)]

dist.D4.loan <- pointDistance(lon_lat4, lon_lat4, lonlat = F, allpairs = T)
colnames(dist.D4.loan) <- CoordenadasD4_loan$Location
rownames(dist.D4.loan) <- CoordenadasD4_loan$Location
write.csv(dist.D4.loan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D4.loan.csv")
#-----------------------
#3. Genoma con pais

CoordenadasGN_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/Coordenadas_paan.csv")
lon_lat <- CoordenadasGN_paan[,c(4,3)]

dist.GN.paan <- pointDistance(lon_lat, lon_lat, lonlat = F, allpairs = T)
colnames(dist.GN.paan) <- CoordenadasGN_paan$Location
rownames(dist.GN.paan) <- CoordenadasGN_paan$Location
write.csv(dist.GN.paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.GN.paan.csv")

#3.1 Genoma dengue 1 con pais
CoordenadasD1_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD1_paan.csv")
lon_lat1 <- CoordenadasD1_paan[,c(4,3)]

dist.D1.paan <- pointDistance(lon_lat1, lon_lat1, lonlat = F, allpairs = T)
colnames(dist.D1.paan) <- CoordenadasD1_paan$Location
rownames(dist.D1.paan) <- CoordenadasD1_paan$Location
write.csv(dist.D1.paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D1.paan.csv")

#3.2 Genoma dengue 2 con pais
CoordenadasD2_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD2_paan.csv")
lon_lat2 <- CoordenadasD2_paan[,c(4,3)]

dist.D2.paan <- pointDistance(lon_lat2, lon_lat2, lonlat = F, allpairs = T)
colnames(dist.D2.paan) <- CoordenadasD2_paan$Location
rownames(dist.D2.paan) <- CoordenadasD2_paan$Location
write.csv(dist.D2.paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D2.paan.csv")

#3.3 Genoma dengue 3 con pais
CoordenadasD3_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD3_paan.csv")
lon_lat3 <- CoordenadasD3_paan[,c(4,3)]

dist.D3.paan <- pointDistance(lon_lat3, lon_lat3, lonlat = F, allpairs = T)
colnames(dist.D3.paan) <- CoordenadasD3_paan$Location
rownames(dist.D3.paan) <- CoordenadasD3_paan$Location
write.csv(dist.D3.paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D3.paan.csv")

#3.4 Genoma dengue 4 con pais
CoordenadasD4_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Secuencias_descargadas/Secuencias_genoma_completo/sub_database/CoordenadasD4_paan.csv")
lon_lat4 <- CoordenadasD4_paan[,c(4,3)]

dist.D4.paan <- pointDistance(lon_lat4, lon_lat4, lonlat = F, allpairs = T)
colnames(dist.D4.paan) <- CoordenadasD4_paan$Location
rownames(dist.D4.paan) <- CoordenadasD4_paan$Location
write.csv(dist.D4.paan,file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D4.paan.csv")
