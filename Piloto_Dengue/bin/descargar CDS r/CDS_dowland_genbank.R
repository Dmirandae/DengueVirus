setwd("/home/andrea/LSB//Piloto_Dengue/bin/descargar CDS r")

library(ape)
library(seqinr)

source('downloadCDSgb.R')

ID <- c("JX649147", "HM181978", "HM181977", "HM181976", "HM181975", "HM181974", "HM181973", "HM181972", "HM181971",
         "HM181970", "HM181969", "HM181968", "HM181967", "HM181966", "HM181965", "HM181964", "HM181963", "HM181962",
         "HM181961", "HM181960", "HM181959", "HM181958", "HM181957", "HM181956", "HM181955", "HM181954", "M93130",
         "M14931", "M84727", "M84728", "M19197", "M20558", "M29095")
# Los ID son especificados en el script Datos_a_descargar.R

downloadCDSgb(No.Accesion = ID,save.fasta = 'Dengue_1')
