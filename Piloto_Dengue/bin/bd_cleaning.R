install.packages("rworldmap")
require(rworldmap)
data("countryExData")
paises1 <- countryExData[,2]
paises2 <- c("Brazil", 
            "India", 
            "Puerto Rico", 
            "Peru", 
            "China", 
            "Singapore", 
            "Philippines",
            "Colombia", 
            "Taiwan",
            "Thailand",
            "Papua New Guinea",
            "hawai",
            "Pakistan",
            "Malaysia",
            "Laos",
            "Paraguay",
            "Indonesia",
            "Japan", 
            "Nicaragua",
            "Mexico",
            "Argentina",
            "Pakistan",
            "New Caledonia",
            "Texas",
            "Cambodia",
            "Angola",
            "Fiji",
            "Yemen",
            "Germany",
            "Saudi Arabia",
            "Myanmar",
            "Viet Nam",
            "Tuvalu",
            "Bhutan",
            "Guayana",
            "Bolivia",
            "Cuba",
            "Guadeloupe",
            "French Guiana",
            "Martinique",
            "Suriname",
            "Trinidad and Tobago",
            "Virgin Islands",
            "micronesia",
            "Dominican Republic",
            "Ecuador",
            "Venezuela",
            "Samoa",
            "Cook Islands",
            "Barbados",
            "Costa Rica",
            "Guam",
            "Maldives",
            "Guatemala",
            "Honduras",
            "Sri Lanka",
            "Senegal",
            "Cameroon",
            "Djibouti",
            "Guayana",
            "Haiti",
            "El Salvador",
            "Madagascar",
            "Cote d'Ivoire",
            "Russia",
            "France",
            "Tanzania",
            "Nepal",
            "Iran",
            "South Korea",
            "Guyana",
            "Timor")
paises <-c(paises1, paises2)

datos <- read.csv(file="/home/andrea/LSB/Piloto_Dengue/data/compendio_datos.csv", sep = "," , header = T)
columna <- read.csv(file="/home/andrea/LSB/Piloto_Dengue/data/columna_6.csv", sep=",")
columna6 <- datos$V6
columna6 <- as.data.frame(columna6)

col_1 <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/columna6_1.csv", header = T)
col_2 <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/columna6_2.csv")


class(col_1)


write.csv(col_1,file = "/home/andrea/LSB/Piloto_Dengue/data/col_1.csv")
write.csv(col_2,file = "/home/andrea/LSB/Piloto_Dengue/data/col_2.csv")

write.csv(columna6, file="/home/andrea/LSB/Piloto_Dengue/data/columna6_bruto.csv")

subname <- data.frame()
for(i in 1:length(columna)){
  result <- vector()
  for(j in paises){
    result[j] <- grepl(j,columna[i])
    if(any(result==T)==F){
      subname[i,1] <- NA
    }
    if(grepl(j,columna[i])==TRUE){
      subname[i,1]<-j 
    } 
  }
}
 
length(which(is.na(subname)==T)) 

write.table(subname, file="/home/andrea/LSB/Piloto_Dengue/data/columna_paises.csv", sep = ",")

###########################
## Columna de genotipos ##
###########################

genotipos <- c("I",
               "II",
               "III",
               "V",
               "IV",
               "Cosmopolitan",
               "American",
               "Asian",
               "American African",
               "American/Asian",
               "American-Asian",
               "Asian/American",
               "Asian I",
               "Asian II",
               "Genotype I",
               "Genotype II",
               "Genotype III",
               "Genotype V",
               "Genotype IV",
               "type 1",
               "1",
               "2",
               "3",
               "4",
               "5"
               )
class(genotipos)
genotipos <- as.data.frame(genotipos)

genoty <- data.frame()

salida <- data.frame()
for(averi in 1:length(col[,1])){
  for(i in 1:length(genotipos[,1])){
    result <- match(genotipos[i,1], col[averi,1])
    if(is.na(result)==F){
      salida[averi,1] <- genotipos[i,1]
    }
  }
}

length(which(is.na(salida)==F))

write.table(salida, file = "/home/andrea/LSB/Piloto_Dengue/data/columna_genotipos.csv")


gen <- cbind(genoty,columna)

####################################################
# Columna Fecha
##############################################

# Creo vector de meses y vector de años

meses <- data.frame()
month <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
           "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
meses[1:12,1] <- month


anos_frame <- data.frame()
anos <- 1600:2016
long_anos <- 1:417
anos_frame[long_anos,1] <- anos

# Unir vector meses con años
#month_date <- data.frame()
#for (i in anos){
#  for(j in month){
#  month_date[paste(j,i, sep="-"), 1] <- paste(j,i,sep="-")  
#  }
#}
#rownames(month_date) <-1:5004


# Hacer la busqueda de meses y años en la columna 6 
fechas <- data.frame()

for(i in 1:length(columna)){
  result <- vector()
  for(j in 1:length(anos_frame[,1])){
    result[j] <- grepl(anos_frame[j,1],columna[i])
    if(any(result==T)==F){
      fechas[i,1] <- NA
    }
    if(grepl(anos_frame[j,1],columna[i])==TRUE){
      fechas[i,1]<-anos_frame[j,1] 
    } 
  }
}

#Guardar la columna de años
write.table(fechas, file="/home/andrea/LSB/Piloto_Dengue/data/fecha_anos.csv")

fecha_meses <- data.frame()

for(i in 1:length(columna)){
  result <- vector()
  for(j in 1:length(meses[,1])){
    result[j] <- grepl(meses[j,1],columna[i])
    if(any(result==T)==F){
      fecha_meses[i,1] <- NA
    }
    if(grepl(meses[j,1],columna[i])==TRUE){
      fecha_meses[i,1]<-meses[j,1] 
    } 
  }
}

write.table(fecha_meses, file="/home/andrea/LSB/Piloto_Dengue/data/fecha_meses.csv")


co_pa <- read.csv(file="columna_paises.csv", sep = "," , header = T)
fe_an <- read.csv(file="fecha_anos.csv", sep = " " , header = T)
fe_me <- read.csv(file="fecha_meses.csv", sep = " " , header = T)

datos_2 <- cbind(datos,co_pa,fe_an,fe_me)

#########################################
## Columna localidades
#########################################
unicos <- unique(col_2)
serum <- c("serum", "blood",
           "human serum", 
           "patient's serum",
           "serum of patient",
           "Vero cells",
           "plasma",
           "IV",
           "dengue patient",
           "urine sample",
           "synonym",
           "serum from fatal case of dengue fever",
           "cell supernatant",
           "human blood serum",
           "whole blood",
           "serum from concurrent infection",
           "C6/36 cells",
           "Dengue patients",
           "Aedes albopictus C636 cells",
           "viremic patient",
           "serum; cell line C6/36",
           "positive; diagnosis",
           "Patient serum",
           "CprM",
           "560 m",
           "549 m",
           "serum from concurrent infection",
           "host serum",
           "envelope protein (E) and nonstructural protein 1(NS1) ",
           "mosquito pool",
           "Aedes aegypti",
           "serum from SST",
           "1st pass. AP 61 cells",
           "clinical material",
           "male pool",
           "female pool",
           "C6/36",
           "Vero cell supernatant",
           "c6/36",
           "NL serum",
           "serum of infected patient",
           "DF patient",
           "DHF II patient",
           "isolated in 2002",
           "isolated in 2001",
           "recombinant clone",
           "SL714",
           "L235",
           "TRIN-53",
           "SL629",
           "SL206",
           "SEY-52",
           "SEY-42",
           "PR159",
           "serum; cultured in mosquito cell line C6/36",
           "passaged in C6/36",
           "1",
           "24.41 S 54.11 W",
           "23.03 S 52.56 W",
           "25.32 S 54.35 W",
           "cosmopolitan",
           "Asian",
           "American/African",
           "Positive, Serotype",
           "isolated from serum; cultured in mosquito cell line C6/36",
           "larval pool",
           "Homo sapiens",
           "Imported case from Cote d'Ivoire",
           "propagated in C6/36 Aedes albopictus cell line",
           "patient serum sample",
           "from the 2000 epidemic",
           "from the 1991 epidemic",
           "from the 1999 epidemic",
           "canine PDK cells",
           "dengue fever patient with primary infection in 1987",
           "DHF grade III patient in Bangkok in 1987",
           "isolated during 1998 outbreak; virulent genotype",
           "Aedes luteocephalus",
           "Aedes africanus",
           "Aedes taylori",
           "sentinel monkey",
           "patient's blood collected during acute Dengue illness",
           "plasma from dengue patient",
           "serum from infected patients; one passage through AP 61 cell line",
           "isolated from serum of a DF patient, 1986",
           "isolated from spleen of a DHF/DSS fatal case",
           "isolated from serum of a DHF patient",
           "isolated from serum of a DF patient",
           "mosquito (Aedes albopictus)",
           "Aedes albopictus clone C6/36 cell line",
           "year collected",
           "isolated during an outbreak in 1998",
           "year of isolation",
           "hospitalized patient in St. Luke's Medical Centre",
           "serum from acute DF patient",
           "C6/36 cell line",
           "Asian/American",
           "brain tissue lysate",
           "patient",
           "infected patient",
           "blood from infected patient",
           "serum of patient having DHF",
           "human patient",
           "supernatants of C6/36 cell cultures",
           "infected patient plasma",
           "serum from patient who visited successively Senegal,",
           "dengue fever patient",
           "isolated in 1993",
           "C6/36 2; isolated in 1983",
           "C6/36 1; isolated from mosquito 2; isolated in 1981",
           "plasma from patient DF",
           "DHF III patient",
           "isoled",
           "isolated after one passage of cell culture",
           "provided by Instituto Evandro Chagas, Para, Brazil",
           "serum of infected patients",
           "The patient come back from Kingston, Jamaica.",
           "Dengue virus type 3",
           "DHF patient",
           "DF imported case",
           "Dengue virus type 1",
           "Dengue virus type 2",
           "isolated in C636 cells; 4th passage",
           "Serum",
           "spleen",
           "serum of patient",
           "female mosquitoes",
           "serum from female",
           "serum from male",
           "dry serum spot",
           "9.35 N 75.97 W",
           "Suspected country",
           "patient serum",
           "serum of dengue patient",
           "23.2 N 113.2 E",
           "human serum",
           "female",
           "male",
           "cerebrospinal fluid",
           "Dengue Fever Patient",
           "passage history",
           "dengue hemorrhagic fever patient",
           "dengue fever patient",
           "Dengue virus type 2",
           "serum of patient with dengue",
           "serum from fatal case of dengue fever",
           "male mosquitoes",
           "Patient serum",
           "Aedes albopictus Cell supernatant",
           "Clone of African green monkey kidney cells Cell supernatant",
           "Aedes albopictus C636 cell supernatant",
           "viremic patient",
           "patient ID",
           "DHF, days post disease onset",
           "lymphocytes of a patient with a fever",
           "cohort population",
           "C6/36 cell culture from Aedes albopictus",
           "Passage history",
           "female mosquito",
           "female pool",
           "passaged in C6/36 mosquito cells",
           "Aedes albopictus cell line C636; cell supernatant",
           "cerebro-spinal fluid from a patient with severe dengue",
           "serum from a patient with severe dengue",
           "serum from patient with severe dengue",
           "whole blood dried on filter paper",
           "one passage C6/36",
           "B K Kori",
           "one passage C6/36",
           "serum dried on filter paper",
           "whole blood",
           "imported case from Marshall Islands",
           "imported case from India",
           "Aedes albopictus C6/36 cell supernatant",
           "8.48 N 76.98 E",
           "Imported case from Benin",
           "male mosquito",
           "Ribeirao Preto",
           "northeast",
           "DEN-3/DEN-4 co-infection",
           "first passge of whole C6/36 cell lysate infected with pat",
           "C6/36 cells infected with human serum from a patie",
           "serum samples of dengue fever patients",
           "isolated from Zhejiang in China, 2004 (imported case)",
           "isolated from Zhejiang in China, 2004",
           "isolated in 2002",
           "Library D2-ThNH",
           "serum; cultured in mosquito cell line C6/36",
           "DR patient serum",
           "Patient ID",
           "DENV-2, Diagnosis",
           "plasma of patient with dengue virus type 1 infection",
           "pool of the cephalothoraxes from 10 females",
           "cell culture from Aedes albopictus cell line (C6/36)",
           "cell culture from suckling mouse brain (SMB)",
           "isolate PhMH-J1-97 (AY496879) that has gone through",
           "blood sample from dengue patient",
           "Dengue virus type 1",
           "Dengue virus type 3",
           "Santos, SP",
           "isolated during 1974 Dengue epidemic in",
           "human patient in 1994",
           "culture supernatant",
           "liver",
           "45AZ5-PDK27 derived from clone 45AZ5, (see GenBank Accession Number U88536); serially passed 27 times in PDK cells",
           "field Aedes albopitus",
           "human serum infected with dengue virus types 1 and 2",
           "isolated from human in 1989",
           "serum from patient with dengue fever",
           "one passage in C636 cell line",
           "primary cell culture from Aedes albopictus C6/36 (Ts-1)",
           "human patient sera",
           "sylvatic",
           "dengue patient",
           "first large epidemic of dengue during Jul-Dec 2003",
           "envelope gene sequences from this isolate deposited in",
           "passage 2",
           "passage 1",
           "isolated from DF patient",
           "strain name code",
           "patients with non-hemorrhagic dengue fever",
           "year of isolation",
           "DF patient serum",
           "traveller returning from west Africa (Cote d'Ivoire)",
           "serum from patient with non-hemorrhagic dengue fever",
           "passaged in albopictus C6/36 cells",
           "infected cells",
           "patient with Dengue fever",
           "sera from acute-phase patient",
           "isolated directly from human plasma",
           "isolated from dengue haemorrhagic fever patient",
           "single passage in mosquito AP61 cells and subsequen",
           "DEN2JAM",
           "sylvatic lineage",
           "Dengue virus type 4",
           "This sequence would be complete genome with N sequences. N sequences correspond to primer region and were impossible to be determined.~synonym",
           "a patient of DSS",
           "a patient of DF",
           "a patient of DHF",
           "pooled serum from 6 patients; mouse adapted",
           "17-nucleotide deletion in the 3' non-coding region~synonym",
           "Vero cell inoculated with blood samples of dengue fever patient",
           "blood sample from dengue fever patient",
           "viral RNA extracted from infected Aedes albopictus (C6/36) cells",
           "infected Aedes alobopictus (C6/36) cells",
           "patient's serum",
           "D2-ThNH"
           )

localidades <- data.frame()

patron <- c(anos,month,paises,serum)

for(i in 1:length(col_2$X2)){
  result <- vector()
  for(j in 1:length(patron)){
    result[j] <- grepl(patron[j],as.character(col_2[i,2]))
  }
  if(any(result==T)==T){
    localidades[i,1]<-NA
  }else{
    localidades[i,1] <- as.character(col_2[i,2])
  }
}

write.csv(localidades, file ="/home/andrea/LSB/Piloto_Dengue/data/columna_localidades_2.csv")

dan <- unique(localidades)
localidades_1 <- read.csv(file="/home/andrea/LSB/Piloto_Dengue/data/columna_localidades.csv")
gen <- cbind(localidades,col_2$X2)
#############################
datos <- read.csv(file="/home/andrea/LSB/Piloto_Dengue/data/compendio_datos.csv", sep = "," , header = T)
co_geno <- read.csv(file="/home/andrea/LSB/Piloto_Dengue/data/columna_genotipos.csv", sep=" ")
co_pais <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/columna_paises.csv")
co_loc <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/columna_localidades_1.csv")
co_ans <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/fecha_anos.csv")
co_mes <- read.csv(file = "/home/andrea/LSB/Piloto_Dengue/data/fecha_meses.csv")
datt <- cbind(datos,co_geno,co_pais,co_loc,co_ans,co_mes)

write.csv(datt,file = "/home/andrea/LSB/Piloto_Dengue/data/Compendio_datos_total.csv")
