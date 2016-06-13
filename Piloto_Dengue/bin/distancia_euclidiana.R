#leo los datos
dat_br<-read.table("Br_saopaulo.txt", header = T, sep=":")
dat_co<-read.table("Co_santander.txt", header = T, sep=":")
dat_cn<-read.table("Cn_1985.txt", header = T, sep=":")
dat_pr<-read.table("Pr_1989.txt", header = T, sep=":")
dat_vn<-read.table("Vn_1988.txt", header = T, sep=":")
dat_gt<-read.table("Gt_2009.txt", header = T, sep=":")
dat_kh<-read.table("Kh_2002.txt", header = T, sep=":")
dat_Mx<-read.table("Mx_2004.txt", header = T, sep=":")
dat_Ni<-read.table("Ni_2007.txt", header = T, sep=":")

# los reviso
dat_br
dat_co
dat_cn
dat_pr
dat_vn
dat_gt
dat_kh
dat_Mx
dat_Ni

# Ordenar columnas

index<-with(dat_br, order(seq, n))
dat_br<-dat_br[index,]

index<-with(dat_co, order(seq, n))
dat_co<-dat_co[index,]

index<-with(dat_cn, order(seq, n))
dat_cn<-dat_cn[index,]

index<-with(dat_pr, order(seq, n))
dat_pr<-dat_pr[index,]

index<-with(dat_vn, order(seq, n))
dat_vn<-dat_vn[index,]

index<-with(dat_gt, order(seq, n))
dat_gt<-dat_gt[index,]

index<-with(dat_kh, order(seq, n))
dat_kh<-dat_kh[index,]

index<-with(dat_Mx, order(seq, n))
dat_Mx<-dat_Mx[index,]

index<-with(dat_Ni, order(seq, n))
dat_Ni<-dat_Ni[index,]

dat_kh$seq==dat_vn$seq

#extraigo la variable n
ps_br<-dat_br$n
ps_br
length(ps_br)

ps_co<-dat_co$n
ps_co
length(ps_co)

ps_cn<-dat_cn$n
ps_cn
length(ps_cn)

ps_pr<-dat_pr$n
ps_pr
length(ps_pr)

ps_vn<-dat_vn$n
ps_vn
length(ps_vn)

ps_gt<-dat_gt$n
ps_gt
length(ps_gt)

ps_kh<-dat_kh$n
ps_kh
length(ps_kh)

ps_mx<-dat_Mx$n
ps_mx
length(ps_mx)

ps_ni<-dat_Ni$n
ps_ni
length(ps_ni)

#sumatoria de los ps
a<-ps_co[1:5] #prueba
b<-ps_br[1:5] #prueba
sum((a-b)^2) #prueba
sum((a-a)^2) #prueba yo con yo

?sum
# reuniendo la ecuacion
# br contra todos

br_co<-sum((ps_br-ps_co)^2)
br_co

br_cn<-sum((ps_br-ps_cn)^2)
br_cn

br_pr<-sum((ps_br-ps_pr)^2)
br_pr

br_vn<-sum((ps_br-ps_vn)^2)
br_vn

br_gt<-sum((ps_br-ps_gt)^2)
br_gt

br_kh<-sum((ps_br-ps_kh)^2)
br_kh

br_mx<-sum((ps_br-ps_mx)^2)
br_mx

br_ni<-sum((ps_br-ps_ni)^2)
br_ni

#co contra todos
co_cn<-sum((ps_co-ps_cn)^2)
co_cn

co_pr<-sum((ps_co-ps_pr)^2)
co_pr

co_vn<-sum((ps_co-ps_vn)^2)
co_vn

co_gt<-sum((ps_co-ps_gt)^2)
co_gt

co_kh<-sum((ps_co-ps_kh)^2)
co_kh

co_mx<-sum((ps_co-ps_mx)^2)
co_mx

co_ni<-sum((ps_co-ps_ni)^2)
co_ni

#cn contra todos
cn_pr<-sum((ps_cn-ps_pr)^2)
cn_pr

cn_vn<-sum((ps_cn-ps_vn)^2)
cn_vn

cn_gt<-sum((ps_cn-ps_gt)^2)
cn_gt

cn_kh<-sum((ps_cn-ps_kh)^2)
cn_kh

cn_mx<-sum((ps_cn-ps_mx)^2)
cn_mx

cn_ni<-sum((ps_cn-ps_ni)^2)
cn_ni

#pr contra todos
pr_vn<-sum((ps_pr-ps_vn)^2)
pr_vn

pr_gt<-sum((ps_pr-ps_gt)^2)
pr_gt

pr_kh<-sum((ps_pr-ps_kh)^2)
pr_kh


pr_mx<-sum((ps_pr-ps_mx)^2)
pr_mx

pr_ni<-sum((ps_pr-ps_ni)^2)
pr_ni

#gt contra todos
gt_kh<-sum((ps_gt-ps_kh)^2)
gt_kh

gt_mx<-sum((ps_gt-ps_mx)^2)
gt_mx

gt_ni<-sum((ps_gt-ps_ni)^2)
gt_ni

# vn
vn_gt<-sum((ps_vn-ps_gt)^2)
vn_gt

vn_ni<-sum((ps_vn-ps_ni)^2)
vn_ni

vn_mx<-sum((ps_vn-ps_mx)^2)
vn_mx

vn_kh<-sum((ps_vn-ps_kh)^2)
vn_kh

#ni
ni_mx<-sum((ps_ni-ps_mx)^2)
ni_mx

ni_kh<-sum((ps_ni-ps_kh)^2)
ni_kh

#kh
kh_mx<-sum((ps_kh-ps_mx)^2)
kh_mx


####################
## Test de Mantel###
####################
library(vegan)

dat_dist <- read.csv("matriz_distee.csv", header = T)
dat_tim<- read.csv("matriz_tiempo.csv", header = T)
?mantel

#toda la matriz
colnames(dat_dist)<-NULL
real_dist <- as.array(dat_dist[,-1])

colnames(dat_tim)<-NULL
real_tim <- as.array(dat_tim[,-1])

#paises tropicales
trop_dat<-dat_dist[1:5, 1:6]
trop_tim<-dat_tim[1:5, 1:6]

#colnames(trop_dat)<-NULL
#colnames(trop_tim)<-NULL

dtrop<-as.array(trop_dat[,-1])
ttrop<-as.array(trop_tim[,-1])

#paises asiaticos
asi_dat <- dat_dist[6:9, 7:10]
#asi_dat <- asi_dat[-3,-3]

asi_tim <- dat_tim[6:9,6:9]
#asi_tim <- asi_tim[-3,-3]

dasi <- as.array(asi_dat)
tasi <- as.array(asi_tim)

#mantel para toda la matriz

mantel(xdis= real_dist, ydis= real_tim)

#mantel para la misma matiz, yo con yo
mantel(xdis= real_dist, ydis= real_dist)

#mantel para paises tropicales
mantel(xdis= dtrop, ydis= ttrop)

#mantel para paises asiaticos
mantel(xdis= dasi, ydis= tasi)

