#leo los datos
dat_br<-read.table("Br_saopaulo.txt", header = T)
dat_co<-read.table("Co_santander.txt", header = T)
dat_cn<-read.table("Cn_1985.txt", header = T)
dat_pr<-read.table("Pr_1989.txt", header = T)
dat_vn<-read.table("Vn_1988.txt", header = T)
dat_gt<-read.table("Gt_2009.txt", header = T)
dat_kh<-read.table("Kh_2002.txt", header = T)
dat_Mx<-read.table("Mx_2004.txt", header = T)
dat_Ni<-read.table("Ni_2007.txt", header = T)

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

#sumatoria de los ps

sum_psbr<-sum(ps_br)
sum_psbr

sum_psco<-sum(ps_co)
sum_psco

sum_pscn<-sum(ps_cn)
sum_pscn

sum_pspr<-sum(ps_pr)
sum_pspr

sum_psvn<-sum(ps_vn)
sum_psvn

sum_psgt<-sum(ps_gt)
sum_psgt

sum_pskh<-sum(ps_kh)
sum_pskh

sum_psmx<-sum(ps_mx)
sum_psmx

sum_psni<-sum(ps_ni)
sum_psni



#calcular la desviacion estandar
?sd
sd_br<-sd(ps_br)

sd_co<-sd(ps_co)

sd_cn<-sd(ps_cn)

sd_pr<-sd(ps_pr)

sd_vn<-sd(ps_vn)

sd_gt<-sd(ps_gt)

sd_kh<-sd(ps_kh)

sd_mx<-sd(ps_mx)

sd_ni<-sd(ps_ni)


# reuniendo la ecuacion
# br contra todos

br_co<-((sum_psbr/sd_br)-(sum_psco/sd_co))^2
br_co

br_cn<-((sum_psbr/sd_br)-(sum_pscn/sd_cn))^2
br_cn

br_pr<-((sum_psbr/sd_br)-(sum_pspr/sd_pr))^2
br_pr

br_vn<-((sum_psbr/sd_br)-(sum_psvn/sd_vn))^2
br_vn

br_gt<-((sum_psbr/sd_br)-(sum_psgt/sd_gt))^2
br_gt

br_kh<-((sum_psbr/sd_br)-(sum_pskh/sd_kh))^2
br_kh

br_mx<-((sum_psbr/sd_br)-(sum_psmx/sd_mx))^2
br_mx

br_ni<-((sum_psbr/sd_br)-(sum_psni/sd_ni))^2
br_ni

#co contra todos

co_cn<-((sum_psco/sd_co)-(sum_pscn/sd_cn))^2
co_cn

co_pr<-((sum_psco/sd_co)-(sum_pspr/sd_pr))^2
co_pr

co_vn<-((sum_psco/sd_co)-(sum_psvn/sd_vn))^2
co_vn

co_gt<-((sum_psco/sd_co)-(sum_psgt/sd_gt))^2
co_gt

co_kh<-((sum_psco/sd_co)-(sum_pskh/sd_kh))^2
co_kh

co_mx<-((sum_psco/sd_co)-(sum_psmx/sd_mx))^2
co_mx

co_ni<-((sum_psco/sd_co)-(sum_psni/sd_ni))^2
co_ni

#cn contra todos

cn_pr<-((sum_pscn/sd_cn)-(sum_pspr/sd_pr))^2
cn_pr

cn_vn<-((sum_pscn/sd_cn)-(sum_psvn/sd_vn))^2
cn_vn

cn_gt<-((sum_pscn/sd_cn)-(sum_psgt/sd_gt))^2
cn_gt

cn_kh<-((sum_pscn/sd_cn)-(sum_pskh/sd_kh))^2
cn_kh

cn_mx<-((sum_pscn/sd_cn)-(sum_psmx/sd_mx))^2
cn_mx

cn_ni<-((sum_pscn/sd_cn)-(sum_psni/sd_ni))^2
cn_ni

#pr contra todos

pr_vn<-((sum_pspr/sd_pr)-(sum_psvn/sd_vn))^2
pr_vn

pr_gt<-((sum_pspr/sd_pr)-(sum_psgt/sd_gt))^2
pr_gt

pr_kh<-((sum_pspr/sd_pr)-(sum_pskh/sd_kh))^2
pr_kh

pr_mx<-((sum_pspr/sd_pr)-(sum_psmx/sd_mx))^2
pr_mx

pr_ni<-((sum_pspr/sd_pr)-(sum_psni/sd_ni))^2
pr_ni

#gt contra todos

gt_kh<-((sum_psgt/sd_gt)-(sum_pskh/sd_kh))^2
gt_kh

gt_mx<-((sum_psgt/sd_gt)-(sum_psmx/sd_mx))^2
gt_mx

gt_ni<-((sum_psgt/sd_gt)-(sum_psni/sd_ni))^2
gt_ni

# vn

vn_gt<-((sum_psvn/sd_vn)-(sum_psgt/sd_gt))^2
vn_gt

vn_ni<-((sum_psvn/sd_vn)-(sum_psni/sd_ni))^2
vn_ni

vn_mx<-((sum_psvn/sd_vn)-(sum_psmx/sd_mx))^2
vn_mx

vn_kh<-((sum_psvn/sd_vn)-(sum_pskh/sd_kh))^2
vn_kh

#ni

ni_mx<-((sum_psni/sd_ni)-(sum_psmx/sd_mx))^2
ni_mx

ni_kh<-((sum_psni/sd_ni)-(sum_pskh/sd_kh))^2
ni_kh

#kh

kh_mx<-((sum_pskh/sd_kh)-(sum_psmx/sd_mx))^2
kh_mx

kh_kh<-((sum_pskh/sd_kh)-(sum_pskh/sd_kh))^2
kh_kh

################################

a <- as.matrix(cbind(ps_ni,
      ps_mx,
      ps_kh,
      ps_gt,
      ps_vn,
      ps_pr,
      ps_cn,
      ps_co,
      ps_br))
tail(a,2L)
install.packages("vegan")
library(vegan)

length(ps_ni)==length((ps_gt))

#################################
mantelhaen.test

dat_dist<-read.csv("matriz_distt.csv", header=T)
dat_tim<-read.csv("matriz_tiempo.csv", header = T)

colnames(dat_dist) <- NULL

real_dist<-as.array(dat_dist[,-1])

d1 <- as.dist(dat_tim)
d2 <- as.dist(dat_dist)

dd <- array(dat_dist, dat_tim)

mantelhaen.test(x= real_dist, y= real_dist, z= NULL)
mantelhaen.test()

library(vegan)

