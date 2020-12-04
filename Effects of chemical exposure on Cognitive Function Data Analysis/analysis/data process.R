#Data Management
merger3data <- readRDS("C:/Users/yiche/Desktop/summer project/data/merger3.rds")
str(merger3data)
attach(merger3data)
summary(cfdcst1)
install.packages("Hmisc")
library(Hmisc)

#Score Trials
describe(cfdcst1)
hist(cfdcst1)
sd(cfdcst1)

summary(cfdcst2)
describe(cfdcst2)
describe(cfdcst3)
hist(cfdcst2)
hist(cfdcst3)

merger3data$avgcst <- (merger3data$cfdcst1 + merger3data$cfdcst2 + merger3data$cfdcst3)/3
describe(merger3data$avgcst)
hist(merger3data$avgcst)

#Score Delayed Recall
describe(cfdcsr)
hist(cfdcsr)

#Animal Fluency
describe(cfdast)
hist(cfdast)

#Digital Symbol
describe(cfdds)
hist(cfdds)

#Weight
describe(merger3data$wtsa2yr)
merger3data$halfWeight <- merger3data$wtsa2yr/2
describe(merger3data$halfWeight)

#PFOA
describe(lbxpfoa)
bwplot(lbxpfoa)
hist(lbxpfoa)
merger3data$logpfoa <- log(merger3data$lbxpfoa)
describe(merger3data$logpfoa)
hist(merger3data$logpfoa)
bwplot(merger3data$logpfoa)

#PFOS
describe(lbxpfos)
bwplot(lbxpfos)
hist(lbxpfos)
merger3data$logpfos <- log(merger3data$lbxpfos)
describe(merger3data$logpfos)
hist(merger3data$logpfos)
bwplot(merger3data$logpfos)

#PFHS
describe(lbxpfhs)
bwplot(lbxpfhs)
hist(lbxpfhs)
merger3data$logpfhs <- log(merger3data$lbxpfhs)
describe(merger3data$logpfhs)
hist(merger3data$logpfhs)
bwplot(merger3data$logpfhs)

#PFNA
describe(lbxpfna)
bwplot(lbxpfna)
hist(lbxpfna)
merger3data$logpfna <- log(merger3data$lbxpfna)
describe(merger3data$logpfna)
hist(merger3data$logpfna)
bwplot(merger3data$logpfna)

#Data release cycle
table(sddsrvyr)
describe(sddsrvyr)

#Gender
describe(riagendr)

#Age
describe(ridageyr)

#Race
describe(ridreth3)
merger3data <- within(merger3data, {
    race <- NA
    race[ridreth3 <= 2] <- 1
    race[ridreth3 == 3] <- 2
    race[ridreth3 == 4] <- 3
    race[ridreth3 >= 6] <- 4
})
describe(merger3data$race)
#1 = Hispanic
#2 = non-Hispanic white
#3 = non-Hispanic black
#4 Other races
describe(dmdeduc2)
merger3data <- within(merger3data, {
  education <- NA
  education[dmdeduc2 == 1 | dmdeduc2 == 2] <- 1 #Less than a High-School Diploma
  education[dmdeduc2 == 3] <- 2 #High-School Diploma
  education[dmdeduc2 == 4] <- 3 #Some College
  education[dmdeduc2 == 5] <- 4 #Bachelor's Degree or above
})
describe(merger3data$education)

#Marital Status
describe(dmdmartl)
merger3data <- within(merger3data, {
  marry <- NA
  marry[dmdmartl == 1 | dmdmartl == 6] <- 1 #Living together
  marry[dmdmartl == 2] <- 2 #Widowed
  marry[dmdmartl == 3 | dmdmartl == 4 | dmdmartl == 5] <- 3 #Living Alone
})
describe(merger3data$marry)

#Poverty-Income Ratio
describe(indfmpir)
hist(indfmpir)
merger3data <- within(merger3data, {
  PIR <- NA
  PIR[indfmpir < 2] <- 1
  PIR[indfmpir >= 2 & indfmpir < 4] <- 2
  PIR[indfmpir >= 4] <- 3
  PIR[is.na(indfmpir)] <- 4
})
describe(merger3data$PIR)

#Alcohol
describe(alq101)
merger3data <- within(merger3data, {
  alq101[alq101 == 9] <- NA
})
describe(merger3data$alq101)
describe(alq110)
describe(alq120q)
describe(alq120u)

#Smoke
describe(smq020)
describe(smq040)
table(smq020, smq040, exclude = NULL)
merger3data <- within(merger3data, {
  smoke <- NA
  smoke[smq020 == 1 & (smq040 == 1 | smq040 == 2)] <- 1 #Current smoker
  smoke[smq020 == 1 & smq040 == 3] <- 2 #Former Smoker
  smoke[smq020 == 2] <- 3 #Non-smoker
})
describe(merger3data$smoke)

#High blood pressure
describe(bpq020)
merger3data <- within(merger3data, {
  bpq020[bpq020 == 9] <- NA
})
describe(merger3data$bpq020)

#High cholesterol level
describe(bpq080)
merger3data <- within(merger3data, {
  bpq080[bpq080 == 9] <- NA
})
describe(merger3data$bpq080)

#Diabetes
describe(diq010)

#Heart Disease
describe(mcq160c)
merger3data <- within(merger3data, {
  mcq160c[mcq160c == 9] <- NA
})
describe(merger3data$mcq160c)

#Stroke
describe(mcq160f)
merger3data <- within(merger3data, {
  mcq160f[mcq160f == 9] <- NA
})
describe(merger3data$mcq160f)

#BMI
describe(whd010)
merger3data <- within(merger3data, {
  whd010[whd010 >= 9999] <- NA
})
describe(merger3data$whd010)
describe(whd020)
merger3data <- within(merger3data, {
  whd020[whd020 >= 9999] <- NA
})
describe(merger3data$whd020)
merger3data$BMI <- (merger3data$whd020/(merger3data$whd010^2)) * 703
describe(merger3data$BMI)
merger3data <- within(merger3data, {
  bmigroup <- NA
  bmigroup[BMI < 25] <- 1
  bmigroup[BMI >= 25 & BMI < 30] <- 2
  bmigroup[BMI >= 30] <- 3
})
describe(merger3data$bmigroup)



#Scatter Plots

#Exposure
#logpfos, logpfoa, logpfhs, logpfna
#Outcome: avgcst, cfdcsr, cfdast, cfdds

#Covariates
#A priori: riagendr, ridageyr, race, education, marry, PIR, alq101, smoke, bmigroup
#Potential: bpq020, bpq080, diq010, mcq160c, mcq160f


############# PFOS #############
plot(logpfos, avgcst)
plot(logpfos, cfdcsr)
plot(logpfos, cfdast)
plot(logpfos, cfdds)

#Score Trial Recall
scatterplot(logpfos, avgcst)
fit1 <- lm(avgcst ~ logpfos, data = merger3data) #Unadjusted analysis
summary(fit1)
confint(fit1)
fit1a <- lm(avgcst ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
           + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit1a)
confint(fit1a)
scatterplot(logpfos, avgcst)
par(mfrow=c(1,1))
plot(fit1a)
install.packages("car")
library(car)
vif(fit1)
fit1b <- lm(avgcst ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit1b)
scatterplot(fit1b)
plot(fit1b)
vif(fit1b)

#Delayed Recall
scatterplot(logpfos, cfdcsr)
fit2 <- lm(cfdcsr ~ logpfos, data = merger3data) #Unadjusted analysis
summary(fit2)
confint(fit2)
fit2a <- lm(cfdcsr ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
           + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit2a)
plot(fit2a)
confint(fit2a)
fit2b <- lm(cfdcsr ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit2b)
plot(fit2b)
confint(fit2b)

#Animal Fluency Test
scatterplot(logpfos, cfdast)
fit3 <- lm(cfdast ~ logpfos, data = merger3data) #Unadjusted analysis
summary(fit3)
confint(fit3)
fit3a <- lm(cfdast ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
           + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit3a)
plot(fit3a)
confint(fit3a)
fit3b <- lm(cfdast ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit3b)
plot(fit3b)
confint(fit3b)

#Digital Symbol
scatterplot(logpfos, cfdds)
fit4 <- lm(cfdds ~ logpfos, data = merger3data) #Unadjusted analysis
summary(fit4)
confint(fit4)
fit4a <- lm(cfdds ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
           + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit4a)
confint(fit4a)
plot(fit4a)
fit4b <- lm(cfdds ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit4b)
confint(fit4b)
plot(fit4b)

############# PFOA #############
plot(logpfoa, avgcst)
plot(logpfoa, cfdcsr)
plot(logpfoa, cfdast)
plot(logpfoa, cfdds)

#Score Trial Recall
scatterplot(logpfoa, avgcst)
fit5 <- lm(avgcst ~ logpfoa, data = merger3data) #Unadjusted analysis
summary(fit5)
confint(fit5)
fit5a <- lm(avgcst ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit5a)
confint(fit5a)
scatterplot(logpfoa, avgcst)
plot(fit5a)
fit5b <- lm(avgcst ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit5b)
plot(fit5b)

#Delayed Recall
scatterplot(logpfoa, cfdcsr)
fit6 <- lm(cfdcsr ~ logpfoa, data = merger3data) #Unadjusted analysis
summary(fit6)
confint(fit6)
fit6a <- lm(cfdcsr ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit6a)
plot(fit6a)
confint(fit6a)
fit6b <- lm(cfdcsr ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit6b)
plot(fit6b)
confint(fit6b)

#Animal Fluency Test
scatterplot(logpfoa, cfdast)
fit7 <- lm(cfdast ~ logpfoa, data = merger3data) #Unadjusted analysis
summary(fit7)
confint(fit7)
fit7a <- lm(cfdast ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit7a)
plot(fit7a)
confint(fit7a)
fit7b <- lm(cfdast ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit7b)
plot(fit7b)
confint(fit7b)

#Digital Symbol
scatterplot(logpfoa, cfdds)
fit8 <- lm(cfdds ~ logpfoa, data = merger3data) #Unadjusted analysis
summary(fit8)
confint(fit8)
fit8a <- lm(cfdds ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit8a)
confint(fit8a)
plot(fit8a)
fit8b <- lm(cfdds ~ logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit8b)
confint(fit8b)
plot(fit8b)

############# PFHS #############
plot(logpfhs, avgcst)
plot(logpfhs, cfdcsr)
plot(logpfhs, cfdast)
plot(logpfhs, cfdds)

#Score Trial Recall
scatterplot(logpfhs, avgcst)
fit9 <- lm(avgcst ~ logpfhs, data = merger3data) #Unadjusted analysis
summary(fit9)
confint(fit9)
fit9a <- lm(avgcst ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit9a)
confint(fit9a)
plot(fit9a)
fit9b <- lm(avgcst ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit9b)
plot(fit9b)

#Delayed Recall
scatterplot(logpfhs, cfdcsr)
fit10 <- lm(cfdcsr ~ logpfhs, data = merger3data) #Unadjusted analysis
summary(fit10)
confint(fit10)
fit10a <- lm(cfdcsr ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit10a)
confint(fit10a)
plot(fit10a)
fit10b <- lm(cfdcsr ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit10b)
confint(fit10b)
plot(fit10b)

#Animal Fluency Test
scatterplot(logpfhs, cfdast)
fit11 <- lm(cfdast ~ logpfhs, data = merger3data) #Unadjusted analysis
summary(fit11)
confint(fit11)
fit11a <- lm(cfdast ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit11a)
confint(fit11a)
plot(fit11a)
fit11b <- lm(cfdast ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit11b)
confint(fit11b)
plot(fit11b)

#Digital Symbol
scatterplot(logpfhs, cfdds)
fit12 <- lm(cfdds ~ logpfhs, data = merger3data) #Unadjusted analysis
summary(fit12)
confint(fit12)
fit12a <- lm(cfdds ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit12a)
confint(fit12a)
plot(fit12a)
fit12b <- lm(cfdds ~ logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit12b)
confint(fit12b)
plot(fit12b)

############# PFNA #############
plot(logpfna, avgcst)
plot(logpfna, cfdcsr)
plot(logpfna, cfdast)
plot(logpfna, cfdds)

#Score Trial Recall
scatterplot(logpfna, avgcst)
fit13 <- lm(avgcst ~ logpfna, data = merger3data) #Unadjusted analysis
summary(fit13)
confint(fit13)
fit13a <- lm(avgcst ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit13a)
confint(fit13a)
plot(fit13a)
fit13b <- lm(avgcst ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit13b)
plot(fit13b)

#Delayed Recall
scatterplot(logpfna, cfdcsr)
fit14 <- lm(cfdcsr ~ logpfna, data = merger3data) #Unadjusted analysis
summary(fit14)
confint(fit14)
fit14a <- lm(cfdcsr ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit14a)
confint(fit14a)
plot(fit14a)
fit14b <- lm(cfdcsr ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
             + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit14b)
confint(fit14b)
plot(fit14b)

#Animal Fluency Test
scatterplot(logpfna, cfdast)
fit15 <- lm(cfdast ~ logpfna, data = merger3data) #Unadjusted analysis
summary(fit15)
confint(fit15)
fit15a <- lm(cfdast ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit15a)
confint(fit15a)
plot(fit15a)
fit15b <- lm(cfdast ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
             + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit15b)
confint(fit15b)
plot(fit15b)

#Digital Symbol
scatterplot(logpfna, cfdds)
fit16 <- lm(cfdds ~ logpfna, data = merger3data) #Unadjusted analysis
summary(fit16)
confint(fit16)
fit16a <- lm(cfdds ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), data = merger3data)
summary(fit16a)
confint(fit16a)
plot(fit16a)
fit16b <- lm(cfdds ~ logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
             + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), data = merger3data)
summary(fit16b)
confint(fit16b)
plot(fit16b)
qqPlot(fit16b)
durbinWatsonTest(fit16b)
crPlots(fit16b)
ncvTest(fit16b)
spreadLevelPlot(fit16b)
outlierTest(fit16b)
avPlots(fit16b)
influencePlot(fit16b)
