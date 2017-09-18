#' @title Download CDS from GenBank

#' @description This function download a cds sequence and write
#'  on output file 'Fasta format'. 

#'  @param No.Accesion Character. An accesion number or a list from them. Please... no version accesion number!.

#'  @param save.fasta Character. Name to save file.

#'  @example
#' ID<-c('AY858048','KJ622192')
#'  downloadCDSgb(No.Accesion = ID,save.fasta = 'fastaaa')

#'  @author Viviana Romero-Alarcon
#'  
#'  @seealso {\link{choosebank}}
#'  @seealso {\link{query}}
#'  @seealso {\link{read.GenBank}}
#'  
#'  
#'  @note
#'  Laboratorio de sistemática y biogeografía
#'  Universidad Industrial de Santander Colombia
#'    
#'    
#'      
 

downloadCDSgb<-function(No.Accesion= NULL,save.fasta=NULL ){
  require("seqinr")
  require('ape')
  out<-file(save.fasta,open = 'w')
  for (i in 1:length(No.Accesion)){
    choosebank("genbank")
    gb <- query("gb", paste('N=',No.Accesion[i],sep=''))
    annotations <- getAnnot(gb$req[[1]])
      cds<-grep(pattern ='CDS',annotations )
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
      names(seque)<-paste(name.sp,name.id,sep='_')
      cat.seque<-paste(seque[[1]],collapse ='' )
      writeLines(paste('>',names(seque),sep=''),out,sep='\n')
      writeLines(cat.seque,out,sep='\n')
  }
  close(out) 
}
  
