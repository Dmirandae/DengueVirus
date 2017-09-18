setwd("/home/andrea/LSB//Piloto_Dengue/bin/descargar CDS r")

library(ape)
library(seqinr)

source('downloadCDSgb.R')

No.Accesion <- c("JX649147", "M84727", "EU920839", "HM181978", "HM181977", "HM181976", "HM181975", "HM181974", "HM181973", "HM181972", "HM181971",
         "HM181970", "HM181969", "HM181968", "HM181967", "HM181966", "HM181965", "HM181964", "HM181963", "HM181962",
         "HM181961", "HM181960", "HM181959", "HM181958", "HM181957", "HM181956", "HM181955", "HM181954", "M93130",
         "M14931", "M84728", "M19197", "M20558", "M29095")
# Los ID son especificados en el script Datos_a_descargar.R
ID <- "M93130"
No.Accesion <- "EU920839"
No.Accesion <- "JX649147"

for(i in 1:length(ID)){
  if(nchar(ID[i])!=8){
    write(paste("Access number not avaible"), file = paste(ID[i],".fasta", sep = ""))
    print(paste("access code:",i, ID[i], "not avaible", sep = " "))
  }else{
    downloadCDSgb(No.Accesion = ID[i],save.fasta = paste(ID[i],".fasta", sep = ""))
    print(paste("access code:",i, ID[i], "dowloaded", sep = " "))
    Sys.sleep(1)
  }
}

for (i in 1:length(No.Accesion)){
  if(nchar(No.Accesion[i])!=8){
    write(paste("Access number not avaible"), file = paste(No.Accesion[i],".fasta", sep = ""))
    print(paste("access code:",i, No.Accesion[i], "not avaible", sep = " "))
  }else{
    choosebank("genbank")
    gb <- query("gb", paste('N=',No.Accesion[i],sep=''))
    annotations <- getAnnot(gb$req[[1]])
    cds<-grep(pattern ='CDS',annotations )
    if(length(cds)==0){
      write(paste("cds not avaible"), file = paste(No.Accesion[i],".fasta", sep = ""))
      print(paste("access code:",i, No.Accesion[i], "cds not avaible", sep = " "))
    }else{
      cds<-sub(pattern ='*CDS. *',replacement = '',annotations[cds])
      cds<-gsub("[[:space:]]",'',cds)
      initial<-strsplit(gsub("[..]",' ',cds),split =' ')[[1]][1]
      final<-strsplit(gsub("[..]",' ',cds),split =' ')[[1]][3]
      closebank()
      seque<-read.GenBank(access.nb = No.Accesion[i],
                          species.names = T,gene.names = F,
                          as.character = T)
      seque[[1]]<-seque[[1]][initial:final]
      name.sp<-as.character(attr(seque,'species'))
      name.id<-as.character(names(seque))
      names(seque)<-paste('>',name.sp,name.id,sep='_')
      cat.seque<-paste(seque[[1]],collapse ='' )
      write(paste(names(seque),cat.seque,sep='\n'),file = paste(No.Accesion[i],".fasta", sep = ""))
      print(paste("access code:",i, No.Accesion[i], "dowloaded", sep = " "))
    }
    
  }
}

downloadCDSgb(No.Accesion = ID,save.fasta = 'Dengue_20')
