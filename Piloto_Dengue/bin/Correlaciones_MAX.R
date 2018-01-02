
## GEN E VS GEOGRAFICA VS TIEMPO (LOCALIDAD Y AÑOS)

# distancia de kmer
Fraccional_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distGE_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist_GE_loan.csv")
distGE_loan$X <- colnames(distGE_loan[2:30])
rownames(distGE_loan) <- distGE_loan$X
distGE_loan <- distGE_loan[2:30]

#dist temporal
yearE_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_temporalea/yearE_loan.csv")
yearE_loan$X <- colnames(yearE_loan[2:30])
rownames(yearE_loan) <- yearE_loan$X
yearE_loan <- yearE_loan[2:30]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= Fraccional_loan, ydis= distGE_loan)
mantel(xdis= Fraccional_loan, ydis= yearE_loan)
mantel(xdis= distGE_loan, ydis= yearE_loan)

#-----------
## GEN E DENV1 VS GEOGRAFICA VS TIEMPO

# distancia de kmer
FraccionalD1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV1_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distED1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist_D1_loan.csv")
distED1_loan$X <- colnames(distED1_loan[2:7])
rownames(distED1_loan) <- distED1_loan$X
distED1_loan <- distED1_loan[2:7]

#dist temporal
yearED1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_temporalea/yearD1_loan.csv")
yearED1_loan$X <- colnames(yearED1_loan[2:7])
rownames(yearED1_loan) <- yearED1_loan$X
yearED1_loan <- yearED1_loan[2:7]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD1_loan, ydis= distED1_loan)
mantel(xdis= FraccionalD1_loan, ydis= yearED1_loan)
mantel(xdis= distED1_loan, ydis= yearED1_loan)
#--------------------------------

## GEN E DENV2 VS GEOGRAFICA VS TIEMPO

# distancia de kmer
FraccionalD2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV2_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distED2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist_D2_loan.csv")
distED2_loan$X <- colnames(distED2_loan[2:11])
rownames(distED2_loan) <- distED2_loan$X
distED2_loan <- distED2_loan[2:11]

#dist temporal
yearED2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_temporalea/yearD2_loan.csv")
yearED2_loan$X <- colnames(yearED2_loan[2:11])
rownames(yearED2_loan) <- yearED2_loan$X
yearED2_loan <- yearED2_loan[2:11]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD2_loan, ydis= distED2_loan)
mantel(xdis= FraccionalD2_loan, ydis= yearED2_loan)
mantel(xdis= distED2_loan, ydis= yearED2_loan)
#-----------------------

## GEN E DENV3 VS GEOGRAFICA VS TIEMPO

# distancia de kmer
FraccionalD3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV3_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distED3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist_D3_loan.csv")
distED3_loan$X <- colnames(distED3_loan[2:8])
rownames(distED3_loan) <- distED3_loan$X
distED3_loan <- distED3_loan[2:8]

#dist temporal
yearED3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_temporalea/yearD3_loan.csv")
yearED3_loan$X <- colnames(yearED3_loan[2:8])
rownames(yearED3_loan) <- yearED3_loan$X
yearED3_loan <- yearED3_loan[2:8]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD3_loan, ydis= distED3_loan)
mantel(xdis= FraccionalD3_loan, ydis= yearED3_loan)
mantel(xdis= distED3_loan, ydis= yearED3_loan)
#-------------------------

## GEN E DENV4 VS GEOGRAFICA VS TIEMPO

# distancia de kmer
FraccionalD4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/Fraccional_DENV4_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distED4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_geograficas/dist_D4_loan.csv")
distED4_loan$X <- colnames(distED4_loan[2:7])
rownames(distED4_loan) <- distED4_loan$X
distED4_loan <- distED4_loan[2:7]

#dist temporal
yearED4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genE/matrices_temporalea/yearD4_loan.csv")
yearED4_loan$X <- colnames(yearED4_loan[2:7])
rownames(yearED4_loan) <- yearED4_loan$X
yearED4_loan <- yearED4_loan[2:7]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD4_loan, ydis= distED4_loan)
mantel(xdis= FraccionalD4_loan, ydis= yearED4_loan)
mantel(xdis= distED4_loan, ydis= yearED4_loan)
#---------------------

## GENOMA VS GEOGRAFICA VS TIEMPO (LOCALIDAD Y AÑOS)

# distancia de kmer
Fraccional_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distG_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.GN.loan.csv")
distG_loan$X <- colnames(distG_loan[2:42])
rownames(distG_loan) <- distG_loan$X
distG_loan <- distG_loan[2:42]

#dist temporal
yearG_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distG_loan.csv")
yearG_loan$X <- colnames(yearG_loan[2:42])
rownames(yearG_loan) <- yearG_loan$X
yearG_loan <- yearG_loan[2:42]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= Fraccional_loan, ydis= distG_loan)
mantel(xdis= Fraccional_loan, ydis= yearG_loan)
mantel(xdis= distG_loan, ydis= yearG_loan)
#-------------------------

## GENOMA D1 VS GEOGRAFICA VS TIEMPO (LOCALIDAD Y AÑOS)

# distancia de kmer
FraccionalD1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV1_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D1.loan.csv")
distGD1_loan$X <- colnames(distGD1_loan[2:18])
rownames(distGD1_loan) <- distGD1_loan$X
distGD1_loan <- distGD1_loan[2:18]

#dist temporal
yearGD1_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD1_loan.csv")
yearGD1_loan$X <- colnames(yearGD1_loan[2:18])
rownames(yearGD1_loan) <- yearGD1_loan$X
yearGD1_loan <- yearGD1_loan[2:18]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD1_loan, ydis= distGD1_loan)
mantel(xdis= FraccionalD1_loan, ydis= yearGD1_loan)
mantel(xdis= distGD1_loan, ydis= yearGD1_loan)
#--------

## GENOMA D2 VS GEOGRAFICA VS TIEMPO (LOCALIDAD Y AÑOS)

# distancia de kmer
FraccionalD2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV2_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D2.loan.csv")
distGD2_loan$X <- colnames(distGD2_loan[2:16])
rownames(distGD2_loan) <- distGD2_loan$X
distGD2_loan <- distGD2_loan[2:16]

#dist temporal
yearGD2_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD2_loan.csv")
yearGD2_loan$X <- colnames(yearGD2_loan[2:16])
rownames(yearGD2_loan) <- yearGD2_loan$X
yearGD2_loan <- yearGD2_loan[2:16]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD2_loan, ydis= distGD2_loan)
mantel(xdis= FraccionalD2_loan, ydis= yearGD2_loan)
mantel(xdis= distGD2_loan, ydis= yearGD2_loan)
#-------------------

## GENOMA D3 VS GEOGRAFICA VS TIEMPO (LOCALIDAD Y AÑOS)

# distancia de kmer
FraccionalD3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV3_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D3.loan.csv")
distGD3_loan$X <- colnames(distGD3_loan[2:6])
rownames(distGD3_loan) <- distGD3_loan$X
distGD3_loan <- distGD3_loan[2:6]

#dist temporal
yearGD3_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD3_loan.csv")
yearGD3_loan$X <- colnames(yearGD3_loan[2:6])
rownames(yearGD3_loan) <- yearGD3_loan$X
yearGD3_loan <- yearGD3_loan[2:6]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD3_loan, ydis= distGD3_loan)
mantel(xdis= FraccionalD3_loan, ydis= yearGD3_loan)
mantel(xdis= distGD3_loan, ydis= yearGD3_loan)
#---------------------

## GENOMA D4 VS GEOGRAFICA VS TIEMPO (LOCALIDAD Y AÑOS)

# distancia de kmer
FraccionalD4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV4_loan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D4.loan.csv")
distGD4_loan$X <- colnames(distGD4_loan[2:5])
rownames(distGD4_loan) <- distGD4_loan$X
distGD4_loan <- distGD4_loan[2:5]

#dist temporal
yearGD4_loan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD4_loan.csv")
yearGD4_loan$X <- colnames(yearGD4_loan[2:5])
rownames(yearGD4_loan) <- yearGD4_loan$X
yearGD4_loan <- yearGD4_loan[2:5]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD4_loan, ydis= distGD4_loan)
mantel(xdis= FraccionalD4_loan, ydis= yearGD4_loan)
mantel(xdis= distGD4_loan, ydis= yearGD4_loan)
#-----------------------------

## GENOMA VS GEOGRAFICA VS TIEMPO (PAIS Y AÑOS)

# distancia de kmer
Fraccional_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_paan.csv", header = T, row.names = 1)

# distancia geogrfica
distG_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.GN.paan.csv")
distG_paan$X <- colnames(distG_paan[2:84])
rownames(distG_paan) <- distG_paan$X
distG_paan <- distG_paan[2:84]

#dist temporal
yearG_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distG_paan.csv")
yearG_paan$X <- colnames(yearG_paan[2:84])
rownames(yearG_paan) <- yearG_paan$X
yearG_paan <- yearG_paan[2:84]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= Fraccional_paan, ydis= distG_paan)
mantel(xdis= Fraccional_paan, ydis= yearG_paan)
mantel(xdis= distG_paan, ydis= yearG_paan)
#--------------------------

## GENOMA D1 VS GEOGRAFICA VS TIEMPO (PAIS Y AÑOS)

# distancia de kmer
FraccionalD1_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV1_paan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD1_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D1.paan.csv")
distGD1_paan$X <- colnames(distGD1_paan[2:29])
rownames(distGD1_paan) <- distGD1_paan$X
distGD1_paan <- distGD1_paan[2:29]

#dist temporal
yearGD1_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD1_paan.csv")
yearGD1_paan$X <- colnames(yearGD1_paan[2:29])
rownames(yearGD1_paan) <- yearGD1_paan$X
yearGD1_paan <- yearGD1_paan[2:29]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD1_paan, ydis= distGD1_paan)
mantel(xdis= FraccionalD1_paan, ydis= yearGD1_paan)
mantel(xdis= distGD1_paan, ydis= yearGD1_paan)
#-------------

## GENOMA D2 VS GEOGRAFICA VS TIEMPO (PAIS Y AÑOS)

# distancia de kmer
FraccionalD2_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV2_paan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD2_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D2.paan.csv")
distGD2_paan$X <- colnames(distGD2_paan[2:35])
rownames(distGD2_paan) <- distGD2_paan$X
distGD2_paan <- distGD2_paan[2:35]

#dist temporal
yearGD2_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD2_paan.csv")
yearGD2_paan$X <- colnames(yearGD2_paan[2:35])
rownames(yearGD2_paan) <- yearGD2_paan$X
yearGD2_paan <- yearGD2_paan[2:35]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD2_paan, ydis= distGD2_paan)
mantel(xdis= FraccionalD2_paan, ydis= yearGD2_paan)
mantel(xdis= distGD2_paan, ydis= yearGD2_paan)
#----------------------------

## GENOMA D3 VS GEOGRAFICA VS TIEMPO (PAIS Y AÑOS)

# distancia de kmer
FraccionalD3_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV3_paan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD3_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D3.paan.csv")
distGD3_paan$X <- colnames(distGD3_paan[2:12])
rownames(distGD3_paan) <- distGD3_paan$X
distGD3_paan <- distGD3_paan[2:12]

#dist temporal
yearGD3_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD3_paan.csv")
yearGD3_paan$X <- colnames(yearGD3_paan[2:12])
rownames(yearGD3_paan) <- yearGD3_paan$X
yearGD3_paan <- yearGD3_paan[2:12]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD3_paan, ydis= distGD3_paan)
mantel(xdis= FraccionalD3_paan, ydis= yearGD3_paan)
mantel(xdis= distGD3_paan, ydis= yearGD3_paan)
#-------------------

## GENOMA D4 VS GEOGRAFICA VS TIEMPO (PAIS Y AÑOS)

# distancia de kmer
FraccionalD4_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/Fraccional_DENV4_paan.csv", header = T, row.names = 1)

# distancia geogrfica
distGD4_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_geograficas/dist.D4.paan.csv")
distGD4_paan$X <- colnames(distGD4_paan[2:11])
rownames(distGD4_paan) <- distGD4_paan$X
distGD4_paan <- distGD4_paan[2:11]

#dist temporal
yearGD4_paan <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/Matrices_distancias/matrices_genoma/matrices_temporales/distD4_paan.csv")
yearGD4_paan$X <- colnames(yearGD4_paan[2:11])
rownames(yearGD4_paan) <- yearGD4_paan$X
yearGD4_paan <- yearGD4_paan[2:11]

####################
## Test de Mantel###
####################

library(vegan)

mantel(xdis= FraccionalD4_paan, ydis= distGD4_paan)
mantel(xdis= FraccionalD4_paan, ydis= yearGD4_paan)
mantel(xdis= distGD4_paan, ydis= yearGD4_paan)
