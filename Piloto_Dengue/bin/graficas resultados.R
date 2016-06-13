###########################
# GRAFICA ADN VS TIEMPO###
##########################
library("ggplot2")
install.packages("RColorBrewer")
library("RColorBrewer")
#"#993333", "#CC3333", "#FF6666" rojos
#"#FF3333", "#CC3333", "#FF6666" ROJOS
#"#330000", "#660000","#990000" rojos
#"#006600", "#339900", "#66CC00" verdes
#"#003300", "#66FF33", "#99FF66" VERDES
#"#006600","#339900", "#33CC00" VERDES
MyData <- read.table("adn_aa.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Partición)
MyData$Partición <- factor(MyData$Partición, levels = MyData$Partición)
p <- ggplot()+
     geom_bar(aes(x=1:length(MyData$Secuencia), y=MyData$Test_de_Mantel_.R2., fill=MyData$Partición),stat="identity", position=position_dodge()) +
  #scale_fill_brewer(palette="Greens")
  scale_fill_manual(values=c("#CC3333","#3366FF","#6633CC"))
p <- p + labs(x = "ADN", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.5))) # tamaño numeros ejes
p<- p + theme(axis.text.x = element_blank()) #Eliminar datos de eje x
p <- p + theme(axis.ticks = element_blank())
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2.5)), legend.title=element_text(size= rel(2.5)))
p <- p + scale_x_discrete(expand =c(0.3,0) ) + scale_y_continuous(expand =c(0,0))
p <- p + theme(legend.position=c(0.8,0.8))
p
"#003300","#006600","#009900","#33CC33","#00FF33","#00FF66","#66FF99"

#######################################################################################3
######################################################################################3
###########################
# GRAFICA AA VS TIEMPO###
##########################
#"#003366","#0066CC", "#336699"
#"#003366","#333399","#0066CC"
MyData <- read.table("aa.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Partición)
MyData$Partición <- factor(MyData$Partición, levels = MyData$Partición)
p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Secuencia), y=MyData$Test_de_Mantel_.R2., fill=MyData$Partición),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#009999","#009900", "#FF9966"))

p <- p + labs(x = "a.a", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.5))) # tamaño numeros ejes
p<- p + theme(axis.text.x = element_blank()) #Eliminar datos de eje x
p <- p + theme(axis.ticks = element_blank())
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2.5)), legend.title=element_text(size= rel(2.5)))
p <- p + scale_x_discrete(expand =c(0.3,0) ) + scale_y_continuous(expand =c(0,0))
p <- p + theme(legend.position=c(0.8,0.8)) 
p
#########################################################################################################
#############################################################################################################
########################################
# GRAFICA ADN VS TIEMPO POR GENOTIPOS###
########################################
MyData <- read.table("co_adn.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Particion)
MyData$Particion <- factor(MyData$Particion, levels = MyData$Particion[1:3])
p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Genotipo), y=MyData$Test_de_Mantel_.R2., fill=MyData$Particion),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#CC3333","#3366FF","#6633CC"))

p <- p + labs(x = "ADN", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.8))) # tamaño numeros ejes
p <- p + theme(axis.ticks.y = element_blank())
p <- p + scale_x_continuous(breaks=c(2,5,8,11), labels=c("Am", "Am_As", "As_AS", "Co"))
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2.5)), legend.title=element_text(size= rel(2.5)))
p <- p + theme(legend.position=c(0.85,0.8)) 
p

#########################################################################################################
#############################################################################################################
########################################
# GRAFICA AA VS TIEMPO POR GENOTIPOS###
########################################

MyData <- read.table("co_aa.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Particion)
MyData$Particion <- factor(MyData$Particion, levels = MyData$Particion[1:3])
p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Genotipo), y=MyData$Test_de_Mantel_.R2., fill=MyData$Particion),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#009999","#009900", "#FF9966"))

p <- p + labs(x = "a.a", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.8))) # tamaño numeros ejes
p <- p + theme(axis.ticks.y = element_blank())
p <- p + scale_x_continuous(breaks=c(2,5,8,11), labels=c("Am", "Am_As", "As_AS", "Co"))
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2.5)), legend.title=element_text(size= rel(2.5)))
p <- p + theme(legend.position=c(0.85,0.8)) 
p

#########################################################################################################
#############################################################################################################
########################################
# GRAFICA ADN ESTRUCTURALES  VS TIEMPO ##
########################################
MyData <- read.table("est_adnaa.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Particion)
MyData$Particion <- factor(MyData$Particion, levels = MyData$Particion)
p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Secuencia), y=MyData$Test_de_Mantel_.R2., fill=MyData$Particion),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#003399", "#3366CC", "#6699FF"))

p <- p + labs(x = "Genes Estructurales", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.5))) # tamaño numeros ejes
p<- p + theme(axis.text.x = element_blank()) #Eliminar datos de eje x
p <- p + theme(axis.ticks = element_blank())
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2)), legend.title=element_text(size= rel(2.5)))
p <- p + scale_x_discrete(expand =c(0.3,0) ) + scale_y_continuous(expand =c(0,0))
p <- p + theme(legend.position=c(0.7,0.8)) 
p

#########################################################################################################
#############################################################################################################
########################################
# GRAFICA AA ESTRUCTURALES  VS TIEMPO ##
########################################
MyData <- read.table("aaest.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Particion)
MyData$Particion <- factor(MyData$Particion, levels = MyData$Particion)
p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Secuencia), y=MyData$Test_de_Mantel_.R2., fill=MyData$Particion),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#003300", "#006600", "#009900"))

p <- p + labs(x = "Proteínas Estructurales", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.5))) # tamaño numeros ejes
p<- p + theme(axis.text.x = element_blank()) #Eliminar datos de eje x
p <- p + theme(axis.ticks = element_blank())
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2)), legend.title=element_text(size= rel(2.5)))
p <- p + scale_x_discrete(expand =c(0.3,0) ) + scale_y_discrete(expand =c(0,0))
p <- p + theme(legend.position=c(0.7,0.8)) 
p

#########################################################################################################
#############################################################################################################
######################################################
# GRAFICA ADN ESTRUCTURALES VS TIEMPO POR GENOTIPOS###
######################################################

MyData <- read.table("est_adn.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Particion)
MyData$Particion <- factor(MyData$Particion, levels = MyData$Particion[1:3])
p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Genotipo), y=MyData$Test_de_Mantel_.R2., fill=MyData$Particion),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#003399", "#3366CC", "#6699FF"))

p <- p + labs(x = "Genes Estructurales", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.8))) # tamaño numeros ejes
p <- p + theme(axis.ticks.y = element_blank())
p <- p + scale_x_continuous(breaks=c(2,5,8,11), labels=c("Am", "Am_As", "As_AS", "Co"))
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2.5)), legend.title=element_text(size= rel(2.5)))
p <- p + theme(legend.position=c(0.8,0.8)) 
p


#########################################################################################################
#############################################################################################################
######################################################
# GRAFICA AA ESTRUCTURALES VS TIEMPO POR GENOTIPOS###
######################################################

MyData <- read.table("est_aa.csv",header=TRUE, sep=" ", dec = ",")
levels(MyData$Particion)
MyData$Particion <- factor(MyData$Particion, levels = MyData$Particion[1:3])



p <- ggplot()+
  geom_bar(aes(x=1:length(MyData$Genotipo), y=MyData$Test_de_Mantel_.R2., fill=MyData$Particion),stat="identity", position=position_dodge())+
  scale_fill_manual(values=c("#003300", "#006600", "#009900"))

p <- p + labs(x = "Proteínas Estructurales", y = "(R2) Test de Mantel", fill = "Particiones" ) 
p<- p + theme(axis.title.y = element_text(size = rel(2.5), angle = 90)) + theme(axis.title.x = element_text(size = rel(2.5))) #tamaño nombre de los ejes
p<- p + theme(axis.text = element_text(colour = "black", size= rel (1.8))) # tamaño numeros ejes
p <- p + theme(axis.ticks.y = element_blank())
p <- p + scale_x_continuous(breaks=c(2,5,8,11), labels=c("Am", "Am_As", "As_As", "Co"), expand =c(0,0))
p <- p + theme(panel.background = element_blank())
p <- p + theme(panel.border= element_blank())+ theme(legend.text=element_text(size = rel(2.5)), legend.title=element_text(size= rel(2.5)))
p <- p + scale_y_discrete(breaks=c(0,0.0039,0.0411,0.147), labels=c(0,0.004, 0.04,0.1), expand =c(0,0))#(expand =c(0,1))
p <- p + theme(legend.position=c(0.88,0.8)) 
p
