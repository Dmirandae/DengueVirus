setwd("~/Piloto_Dengue/bin/descargar CDS r")
#'U87411',  
#'AF169678', 
#'GQ868543', 
#'FJ410288', 
#'FJ432726', 
#'JF730045', 
#'HQ891023', 
#'EU482784',
library(ape)
library(seqinr)

source('downloadCDSgb.R')

ID<-c('FJ639828', 
      'GQ398263', 
      'GQ398259', 
      'EU056810', 
      'FJ882602', 
      'AB189122', 
      'AF359579', 
      'EF051521', 
      'DQ448231', 
      'GQ252676', 
      'EU081177', 
      'EU179859', 
      'EU482672', 
      'GQ398267', 
      'JF327392', 
      'JX470186', 
      'GQ868600', 
      'AY744147', 
      'GQ398257', 
      'FJ898449', 
      'GQ868592', 
      'GQ868590', 
      'AF100467' 
) 
length(ID)


downloadCDSgb(No.Accesion = ID,save.fasta = 'Dengue')
