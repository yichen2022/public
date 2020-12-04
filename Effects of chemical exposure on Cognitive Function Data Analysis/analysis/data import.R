install.packages("Hmisc")
library (Hmisc)

#2011-2012 data
pfas1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/PFC_G.XPT")
cfq1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/CFQ_G.XPT")
demo1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/DEMO_G.XPT")
smk1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/SMQ_G.XPT")
alc1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/ALQ_G.XPT")
dm1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/DIQ_G.XPT")
bp1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/BPQ_G.XPT")
stroke1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/MCQ_G.XPT")
bmi1112<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1112/WHQ_G.XPT")

demo1112a<-subset(demo1112, select=c(seqn, ridreth3, sddsrvyr, riagendr, ridageyr, dmdeduc2, dmdmartl, wtint2yr, 
                                     wtmec2yr, sdmvpsu, sdmvstra, indfmpir))

smk1112a<-subset(smk1112, select=c(seqn, smq020, smq040))
alc1112a<-subset(alc1112, select=c(seqn, alq101, alq120q, alq120u, alq130))
dm1112a<-subset(dm1112, select=c(seqn, diq010))
bp1112a<-subset(bp1112, select=c(seqn, bpq020, bpq080))
stroke1112a<-subset(stroke1112, select=c(seqn, mcq160c, mcq160f))
bmi1112a<-subset(bmi1112, select=c(seqn, whd010, whd020))

install.packages("tidyverse")
library(tidyverse)
sapply(demo1112, class)
sapply(pfas1112, class)
merger1112<-list(demo1112, pfas1112, cfq1112, smk1112, alc1112, dm1112, bp1112, stroke1112, 
                 bmi1112) %>% reduce(full_join, by="seqn")

#2013-2014 data
pfas1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/PFAS_H.XPT")
sspfas1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/SSPFAS_H.XPT")
cfq1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/CFQ_H.XPT")
demo1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/DEMO_H.XPT")
smk1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/SMQ_H.XPT")
alc1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/ALQ_H.XPT")
dm1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/DIQ_H.XPT")
bp1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/BPQ_H.XPT")
stroke1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/MCQ_H.XPT")
bmi1314<-sasxport.get("C:/Users/Aimin Chen/Desktop/mobile/summer project/data/1314/WHQ_H.XPT")

merger1314<-list(demo1314, pfas1314, sspfas1314, cfq1314, smk1314, alc1314, dm1314, bp1314, stroke1314,
                 bmi1314) %>% reduce(full_join, by="seqn")

#adding linear and branched PFOA in 2013-2014 data
#adding linear and branched PFOS in 2013-2014 data
attach(merger1314)
merger1314$lbxpfoa=ssnpfoa+ssbpfoa
merger1314$lbxpfos=ssnpfos+ssmpfos
merger1314$wtsa2yr=wtsb2yr.x
detach(merger1314)
#str(merger1314)


#keep labels when subsetting
install.packages("sjlabelled")
library(sjlabelled)
#combine the 2011-2014 four year data
merger1112a<-subset(merger1112, select=c(seqn, ridreth3, sddsrvyr, riagendr, ridageyr, dmdeduc2, dmdmartl, 
                                         wtint2yr, wtmec2yr, sdmvpsu, sdmvstra, indfmpir, wtsa2yr, lbxpfoa,
                                         lbxpfos, lbxpfhs, lbxpfna, cfastat, cfalang, cfdccs, cfdcrnc, 
                                         cfdcst1, cfdcst2, cfdcst3, cfdcsr, cfdcit1, cfdcit2, cfdcit3, cfdcir,
                                         cfdapp, cfdarnc, cfdast, cfddpp, cfddrnc, cfdds, smq020, smq040,
                                         alq101, alq120q, alq120u, alq130, diq010, bpq020, bpq080,
                                         mcq160c, mcq160f, whd010, whd020))

merger1112a<-copy_labels(merger1112a, merger1112)

merger1314a<-subset(merger1314, select=c(seqn, ridreth3, sddsrvyr, riagendr, ridageyr, dmdeduc2, dmdmartl, 
                                         wtint2yr, wtmec2yr, sdmvpsu, sdmvstra, indfmpir, wtsa2yr, lbxpfoa,
                                         lbxpfos, lbxpfhs, lbxpfna, cfastat, cfalang, cfdccs, cfdcrnc, 
                                         cfdcst1, cfdcst2, cfdcst3, cfdcsr, cfdcit1, cfdcit2, cfdcit3, cfdcir,
                                         cfdapp, cfdarnc, cfdast, cfddpp, cfddrnc, cfdds, smq020, smq040,
                                         alq101, alq120q, alq120u, alq130, diq010, bpq020, bpq080,
                                         mcq160c, mcq160f, whd010, whd020))

merger1314a<-copy_labels(merger1314a, merger1314)

merger<-rbind(merger1112a, merger1314a)
#n=19931
str(merger)
merger1<-subset(merger, ridageyr>=60)
merger2<-subset(merger1, cfastat<=3 & cfdccs==1 & cfdast!="NA" & cfdds!="NA")
merger3<-subset(merger2, lbxpfoa!="NA" & lbxpfos!="NA" & lbxpfhs!="NA" & lbxpfna!="NA")
str(merger3)
saveRDS(merger3, file="merger3.rds")








