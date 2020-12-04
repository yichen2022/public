#Data Management
merger3data <- readRDS("C:/Users/yiche/Documents/summer project/data/merger3.rds")
str(merger3data)
attach(merger3data) #Run this every time
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
merger3data <- within(merger3data, {
  lowcst <- NA
  lowcst[avgcst < 5.3] <- 1
  lowcst[avgcst >= 5.3] <- 0
})
table(merger3data$lowcst)

#Score Delayed Recall
describe(cfdcsr)
hist(cfdcsr)
merger3data <- within(merger3data, {
  lowcsr <- NA
  lowcsr[cfdcsr < 5] <- 1
  lowcsr[cfdcsr >= 5] <- 0
})
table(merger3data$lowcsr)

#Animal Fluency
describe(cfdast)
hist(cfdast)
merger3data <- within(merger3data, {
  lowast <- NA
  lowast[cfdast < 13] <- 1
  lowast[cfdast >= 13] <- 0
})
table(merger3data$lowast)

#Digital Symbol
describe(cfdds)
hist(cfdds)
merger3data <- within(merger3data, {
  lowds <- NA
  lowds[cfdds < 34] <- 1
  lowds[cfdds >= 34] <- 0
})
table(merger3data$lowds)

#Weight
describe(merger3data$wtsa2yr)
merger3data$halfWeight <- merger3data$wtsa2yr/2
describe(merger3data$halfWeight)

#PFOA
describe(lbxpfoa)
mean(lbxpfoa)
sd(lbxpfoa)
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
describe(merger3data$alq110)
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

#Binary outcomes
library(gmodels)
CrossTable(smoke, lowcst)
CrossTable(riagendr, lowcst)

glmfit1a <- glm(lowcst ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
             + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), family = binomial(link = "logit"), data = merger3data)
summary(glmfit1a)
exp(cbind(OR = coef(glmfit1a), confint(glmfit1a)))

glmfit1b <- glm(lowcst ~ logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
            + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
            + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(link = "logit"), data = merger3data)
summary(glmfit1b)
exp(cbind(OR = coef(glmfit1b), confint(glmfit1b)))

apply(merger3data[, c("logpfos", "logpfoa")], 2, function(ind) {
  cstfit1 <- glm(lowcst ~ ind + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
              + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), family = binomial(link = "logit"), data = merger3data)
  summary(cstfit1)
  exp(cbind(OR = coef(cstfit1), confint(cstfit1)))
 }) 


  cstfit2 <- glm(lowcst ~ ind + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                 + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                 + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(link = "logit"), data = merger3data)
  summary(cstfit2)
  exp(cbind(OR = coef(cstfit2), confint(cstfit2)))
  
aggregate(x = merger3data$cfdds, by = list(merger3data$smoke), FUN = mean)
CrossTable(smoke, lowcst)

#NHANES weighted sample
install.packages("survey")
library(survey) #Run this every time
data(merger3data)
dclus1 <- svydesign(id = ~sdmvpsu, strata = ~sdmvstra, weights = ~halfWeight, nest = TRUE, variables = NULL, data = merger3data)
summary(dclus1)
svymean(~avgcst, dclus1)
mean(avgcst)
svyquantile(~avgcst, dclus1, quantile = c(0.25, 0.5, 0.75), ci = TRUE)
svytotal(~riagendr, dclus1)
svyby(~avgcst + cfdcsr + cfdast + cfdds, ~riagendr, design = dclus1, svymean)
svyby(~logpfos + logpfoa + logpfhs + logpfna, ~riagendr, design = dclus1, svymean)
svytable(~riagendr, dclus1)
svymean(~ridageyr, dclus1)
svymean(~factor(sddsrvyr), dclus1)
svymean(~factor(race), dclus1)
svymean(~factor(education), dclus1, na.rm = TRUE)
svymean(~factor(riagendr), dclus1)
svymean(~factor(marry), dclus1, na.rm = TRUE)
svymean(~factor(PIR), dclus1, na.rm = TRUE)
svymean(~factor(alq101), dclus1, na.rm = TRUE)
svymean(~factor(smoke), dclus1, na.rm = TRUE) #Doesn't work if there is a missing
svymean(~factor(bpq020), dclus1, na.rm = TRUE)
svymean(~factor(bpq080), dclus1, na.rm = TRUE)
svymean(~factor(diq010), dclus1, na.rm = TRUE)
svymean(~factor(mcq160c), dclus1, na.rm = TRUE)
svymean(~factor(mcq160f), dclus1, na.rm = TRUE)
svymean(~factor(bmigroup), dclus1, na.rm = TRUE)
svymean(~interaction(riagendr, smoke), dclus1, na.rm = TRUE)
svytotal(~interaction(riagendr, smoke), dclus1, na.rm = TRUE)
svytotal(~riagendr, dclus1)
svytotal(~smoke, dclus1, na.rm = TRUE)
svymean(~factor(smoke), dclus1)
table(smoke)
tb1 <- svytable(~riagendr + smoke, dclus1)
summary(tb1, statistic = "Chisq")

exp(svymean(~logpfoa, dclus1))
svyquantile(~lbxpfoa, dclus1, quantile=c(0.25, 0.5, 0.75), ci = TRUE)
svyquantile(~lbxpfos, dclus1, quantile=c(0.25, 0.5, 0.75), ci = TRUE)
svyquantile(~lbxpfhs, dclus1, quantile=c(0.25, 0.5, 0.75), ci = TRUE)
svyquantile(~lbxpfna, dclus1, quantile=c(0.25, 0.5, 0.75), ci = TRUE)
svymean(~avgcst, dclus1)
svymean(~cfdcsr, dclus1)
svymean(~cfdast, dclus1)
svymean(~cfdds, dclus1)


a25 <- svysmooth(avgcst~logpfoa, method = "quantreg", design = dclus1, quantile = 0.25, df = 3)
a50 <- svysmooth(avgcst~logpfoa, method = "quantreg", design = dclus1, quantile = 0.5, df = 3)
a75 <- svysmooth(avgcst~logpfoa, method = "quantreg", design = dclus1, quantile = 0.75, df = 3)
a10 <- svysmooth(avgcst~logpfoa, method = "quantreg", design = dclus1, quantile = 0.1, df = 3)
a90 <- svysmooth(avgcst~logpfoa, method = "quantreg", design = dclus1, quantile = 0.9, df = 3)

svyplot(avgcst~logpfoa, design = dclus1)
lines (a50,lwd=3)
lines(a25,lwd=1)
lines (a75,lwd=1)
lines (a10,lty=3)
lines (a90,lty=3)

?svysmooth
## Score Recall ##
#PFOS
svyfit1 <- svyglm(avgcst~logpfos, design = dclus1, data = merger3data)
summary(svyfit1)
paramfit1 <- cbind(est = coef(svyfit1), confint(svyfit1))
pfosfit1 <- paramfit1[2, ]
pfosfit1

plot(svyfit1)
svyfit1a <- svyglm(avgcst~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit1a)
paramfit1a <- cbind(est = coef(svyfit1a), confint(svyfit1a))
pfosfit1a <- paramfit1a[2, ]
pfosfit1a

svyfit1b <- svyglm(avgcst~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit1b)
paramfit1b <- cbind(est = coef(svyfit1b), confint(svyfit1b))
pfosfit1b <- paramfit1b[2, ]
pfosfit1b

#PFOA
svyfit2 <- svyglm(avgcst~logpfoa, design = dclus1, data = merger3data)
summary(svyfit2)
paramfit2 <- cbind(est = coef(svyfit2), confint(svyfit2))
pfoafit2 <- paramfit2[2, ]
pfoafit2

plot(svyfit2)
svyfit2a <- svyglm(avgcst~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit2a)
paramfit2a <- cbind(est = coef(svyfit2a), confint(svyfit2a))
pfoafit2a <- paramfit2a[2, ]
pfoafit2a

svyfit2b <- svyglm(avgcst~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit2b)
paramfit2b <- cbind(est = coef(svyfit2b), confint(svyfit2b))
pfoafit2b <- paramfit2b[2, ]
pfoafit2b

#PFHS
svyfit3 <- svyglm(avgcst~logpfhs, design = dclus1, data = merger3data)
summary(svyfit3)
paramfit3 <- cbind(est = coef(svyfit3), confint(svyfit3))
pfhsfit3 <- paramfit3[2, ]
pfhsfit3

plot(svyfit3)
svyfit3a <- svyglm(avgcst~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit3a)
paramfit3a <- cbind(est = coef(svyfit3a), confint(svyfit3a))
pfhsfit3a <- paramfit3a[2, ]
pfhsfit3a

svyfit3b <- svyglm(avgcst~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit3b)
paramfit3b <- cbind(est = coef(svyfit3b), confint(svyfit3b))
pfhsfit3b <- paramfit3b[2, ]
pfhsfit3b

#PFNA
svyfit4 <- svyglm(avgcst~logpfna, design = dclus1, data = merger3data)
summary(svyfit4)
paramfit4 <- cbind(est = coef(svyfit4), confint(svyfit4))
pfnafit4 <- paramfit4[2, ]
pfnafit4

plot(svyfit4)
svyfit4a <- svyglm(avgcst~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit4a)
paramfit4a <- cbind(est = coef(svyfit4a), confint(svyfit4a))
pfnafit4a <- paramfit4a[2, ]
pfnafit4a

svyfit4b <- svyglm(avgcst~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit4b)
paramfit4b <- cbind(est = coef(svyfit4b), confint(svyfit4b))
pfnafit4b <- paramfit4b[2, ]
pfnafit4b

## Score Delayed Recall ##
#PFOS
svyfit5 <- svyglm(cfdcsr~logpfos, design = dclus1, data = merger3data)
summary(svyfit5)
paramfit5 <- cbind(est = coef(svyfit5), confint(svyfit5))
pfosfit5 <- paramfit5[2, ]
pfosfit5

plot(svyfit5)
svyfit5a <- svyglm(cfdcsr~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit5a)
paramfit5a <- cbind(est = coef(svyfit5a), confint(svyfit5a))
pfosfit5a <- paramfit5a[2, ]
pfosfit5a

svyfit5b <- svyglm(cfdcsr~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit5b)
paramfit5b <- cbind(est = coef(svyfit5b), confint(svyfit5b))
pfosfit5b <- paramfit5b[2, ]
pfosfit5b

#PFOA
svyfit6 <- svyglm(cfdcsr~logpfoa, design = dclus1, data = merger3data)
summary(svyfit6)
paramfit6 <- cbind(est = coef(svyfit6), confint(svyfit6))
pfoafit6 <- paramfit6[2, ]
pfoafit6

plot(svyfit6)
svyfit6a <- svyglm(cfdcsr~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit6a)
paramfit6a <- cbind(est = coef(svyfit6a), confint(svyfit6a))
pfoafit6a <- paramfit6a[2, ]
pfoafit6a

svyfit6b <- svyglm(cfdcsr~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit6b)
paramfit6b <- cbind(est = coef(svyfit6b), confint(svyfit6b))
pfoafit6b <- paramfit6b[2, ]
pfoafit6b

#PFHS
svyfit7 <- svyglm(cfdcsr~logpfhs, design = dclus1, data = merger3data)
summary(svyfit7)
paramfit7 <- cbind(est = coef(svyfit7), confint(svyfit7))
pfhsfit7 <- paramfit7[2, ]
pfhsfit7

plot(svyfit7)
svyfit7a <- svyglm(cfdcsr~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit7a)
paramfit7a <- cbind(est = coef(svyfit7a), confint(svyfit7a))
pfhsfit7a <- paramfit7a[2, ]
pfhsfit7a

svyfit7b <- svyglm(cfdcsr~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit7b)
paramfit7b <- cbind(est = coef(svyfit7b), confint(svyfit7b))
pfhsfit7b <- paramfit7b[2, ]
pfhsfit7b

#PFNA
svyfit8 <- svyglm(cfdcsr~logpfna, design = dclus1, data = merger3data)
summary(svyfit8)
paramfit8 <- cbind(est = coef(svyfit8), confint(svyfit8))
pfnafit8 <- paramfit8[2, ]
pfnafit8

plot(svyfit8)
svyfit8a <- svyglm(cfdcsr~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit8a)
paramfit8a <- cbind(est = coef(svyfit8a), confint(svyfit8a))
pfnafit8a <- paramfit8a[2, ]
pfnafit8a

svyfit8b <- svyglm(cfdcsr~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit8b)
paramfit8b <- cbind(est = coef(svyfit8b), confint(svyfit8b))
pfnafit8b <- paramfit8b[2, ]
pfnafit8b

##Animal Fluency##
#PFOS
svyfit9 <- svyglm(cfdast~logpfos, design = dclus1, data = merger3data)
summary(svyfit9)
paramfit9 <- cbind(est = coef(svyfit9), confint(svyfit9))
pfosfit9 <- paramfit9[2, ]
pfosfit9

plot(svyfit9)
svyfit9a <- svyglm(cfdast~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit9a)
paramfit9a <- cbind(est = coef(svyfit9a), confint(svyfit9a))
pfosfit9a <- paramfit9a[2, ]
pfosfit9a

svyfit9b <- svyglm(cfdast~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit9b)
paramfit9b <- cbind(est = coef(svyfit9b), confint(svyfit9b))
pfosfit9b <- paramfit9b[2, ]
pfosfit9b

#PFOA
svyfit10 <- svyglm(cfdast~logpfoa, design = dclus1, data = merger3data)
summary(svyfit10)
paramfit10 <- cbind(est = coef(svyfit10), confint(svyfit10))
pfoafit10 <- paramfit10[2, ]
pfoafit10

plot(svyfit10)
svyfit10a <- svyglm(cfdast~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit10a)
paramfit10a <- cbind(est = coef(svyfit10a), confint(svyfit10a))
pfoafit10a <- paramfit10a[2, ]
pfoafit10a

svyfit10b <- svyglm(cfdast~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit10b)
paramfit10b <- cbind(est = coef(svyfit10b), confint(svyfit10b))
pfoafit10b <- paramfit10b[2, ]
pfoafit10b

#PFHS
svyfit11 <- svyglm(cfdast~logpfhs, design = dclus1, data = merger3data)
summary(svyfit11)
paramfit11 <- cbind(est = coef(svyfit11), confint(svyfit11))
pfhsfit11 <- paramfit11[2, ]
pfhsfit11

plot(svyfit11)
svyfit11a <- svyglm(cfdast~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit11a)
paramfit11a <- cbind(est = coef(svyfit11a), confint(svyfit11a))
pfhsfit11a <- paramfit11a[2, ]
pfhsfit11a

svyfit11b <- svyglm(cfdast~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit11b)
paramfit11b <- cbind(est = coef(svyfit11b), confint(svyfit11b))
pfhsfit11b <- paramfit11b[2, ]
pfhsfit11b

#PFNA
svyfit12 <- svyglm(cfdast~logpfna, design = dclus1, data = merger3data)
summary(svyfit12)
paramfit12 <- cbind(est = coef(svyfit12), confint(svyfit12))
pfnafit12 <- paramfit12[2, ]
pfnafit12

plot(svyfit12)
svyfit12a <- svyglm(cfdast~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit12a)
paramfit12a <- cbind(est = coef(svyfit12a), confint(svyfit12a))
pfnafit12a <- paramfit12a[2, ]
pfnafit12a

svyfit12b <- svyglm(cfdast~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit12b)
paramfit12b <- cbind(est = coef(svyfit12b), confint(svyfit12b))
pfnafit12b <- paramfit12b[2, ]
pfnafit12b

##Digital Symbol##
#PFOS
svyfit13 <- svyglm(cfdds~logpfos, design = dclus1, data = merger3data)
summary(svyfit13)
paramfit13 <- cbind(est = coef(svyfit13), confint(svyfit13))
pfosfit13 <- paramfit13[2, ]
pfosfit13

plot(svyfit13)
svyfit13a <- svyglm(cfdds~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit13a)
paramfit13a <- cbind(est = coef(svyfit13a), confint(svyfit13a))
pfosfit13a <- paramfit13a[2, ]
pfosfit13a

svyfit13b <- svyglm(cfdds~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit13b)
paramfit13b <- cbind(est = coef(svyfit13b), confint(svyfit13b))
pfosfit13b <- paramfit13b[2, ]
pfosfit13b

#PFOA
svyfit14 <- svyglm(cfdds~logpfoa, design = dclus1, data = merger3data)
summary(svyfit14)
paramfit14 <- cbind(est = coef(svyfit14), confint(svyfit14))
pfoafit14 <- paramfit14[2, ]
pfoafit14

plot(svyfit14)
svyfit14a <- svyglm(cfdds~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit14a)
paramfit14a <- cbind(est = coef(svyfit14a), confint(svyfit14a))
pfoafit14a <- paramfit14a[2, ]
pfoafit14a

svyfit14b <- svyglm(cfdds~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit14b)
paramfit14b <- cbind(est = coef(svyfit14b), confint(svyfit14b))
pfoafit14b <- paramfit14b[2, ]
pfoafit14b

#PFHS
svyfit15 <- svyglm(cfdds~logpfhs, design = dclus1, data = merger3data)
summary(svyfit15)
paramfit15 <- cbind(est = coef(svyfit15), confint(svyfit15))
pfhsfit15 <- paramfit15[2, ]
pfhsfit15

plot(svyfit15)
svyfit15a <- svyglm(cfdds~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit15a)
paramfit15a <- cbind(est = coef(svyfit15a), confint(svyfit15a))
pfhsfit15a <- paramfit15a[2, ]
pfhsfit15a

svyfit15b <- svyglm(cfdds~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit15b)
paramfit15b <- cbind(est = coef(svyfit15b), confint(svyfit15b))
pfhsfit15b <- paramfit15b[2, ]
pfhsfit15b

#PFNA
svyfit16 <- svyglm(cfdds~logpfna, design = dclus1, data = merger3data)
summary(svyfit16)
paramfit16 <- cbind(est = coef(svyfit16), confint(svyfit16))
pfnafit16 <- paramfit16[2, ]
pfnafit16

plot(svyfit16)
svyfit16a <- svyglm(cfdds~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, data = merger3data)
summary(svyfit16a)
paramfit16a <- cbind(est = coef(svyfit16a), confint(svyfit16a))
pfnafit16a <- paramfit16a[2, ]
pfnafit16a

svyfit16b <- svyglm(cfdds~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), design = dclus1, data = merger3data)
summary(svyfit16b)
paramfit16b <- cbind(est = coef(svyfit16b), confint(svyfit16b))
pfnafit16b <- paramfit16b[2, ]
pfnafit16b

#Unadjusted
rbind(pfosfit1, pfoafit2, pfhsfit3, pfnafit4)
rbind(pfosfit5, pfoafit6, pfhsfit7, pfnafit8)
rbind(pfosfit9, pfoafit10, pfhsfit11, pfnafit12)
rbind(pfosfit13, pfoafit14, pfhsfit15, pfnafit16)


#Adjusted Limited
rbind(pfosfit1a, pfoafit2a, pfhsfit3a, pfnafit4a)
rbind(pfosfit5a, pfoafit6a, pfhsfit7a, pfnafit8a)
rbind(pfosfit9a, pfoafit10a, pfhsfit11a, pfnafit12a)
rbind(pfosfit13a, pfoafit14a, pfhsfit15a, pfnafit16a)

#Adjusted Fully
rbind(pfosfit1b, pfoafit2b, pfhsfit3b, pfnafit4b)
rbind(pfosfit5b, pfoafit6b, pfhsfit7b, pfnafit8b)
rbind(pfosfit9b, pfoafit10b, pfhsfit11b, pfnafit12b)
rbind(pfosfit13b, pfoafit14b, pfhsfit15b, pfnafit16b)

"names(merger3data)
outcome <- c(49, 25, 32, 35)
predictor <- c(51, 50, 52, 53)


for(i in outcome) {
  outcome<-colnames(merger3data)[i]
  for (j in predictor) {
    exposure<-colnames(merger3data)[j]
    svymodel <- svyglm(get(outcome) ~ get(exposure), design = dclus1, data = merger3data)
    summary(svymodel)
    paramfit <- cbind(est = coef(svymodel), confint(svymodel))
    predictorfit <- paramfit[2, ]
    predictorfit
    out_fit[number] = predictorfit
    number = number + 1
  }
}

unadjusted <- rbind(out_fit)
unadjusted"

###### Logistic Regression #######

svymean(~factor(lowcst), design = dclus1, na.rm = TRUE)
svymean(~factor(lowcsr), design = dclus1, na.rm = TRUE)
svymean(~factor(lowast), design = dclus1, na.rm = TRUE)
svymean(~factor(lowds), design = dclus1, na.rm = TRUE)
## Score Recall ##
#PFOS
logitsvyfit1 <- svyglm(lowcst~logpfos, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit1)
logitparamfit1 <- exp(cbind(est = coef(logitsvyfit1), confint(logitsvyfit1)))
logitpfosfit1 <- logitparamfit1[2, ]
logitpfosfit1

logitsvyfit1a <- svyglm(lowcst~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit1a)
logitparamfit1a <- exp(cbind(est = coef(logitsvyfit1a), confint(logitsvyfit1a)))
logitpfosfit1a <- logitparamfit1a[2, ]
logitpfosfit1a

logitsvyfit1b <- svyglm(lowcst~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                   + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                   + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit1b)
logitparamfit1b <- exp(cbind(est = coef(logitsvyfit1b), confint(logitsvyfit1b)))
logitpfosfit1b <- logitparamfit1b[2, ]
logitpfosfit1b

#PFOA
logitsvyfit2 <- svyglm(lowcst~logpfoa, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit2)
logitparamfit2 <- exp(cbind(est = coef(logitsvyfit2), confint(logitsvyfit2)))
logitpfoafit2 <- logitparamfit2[2, ]
logitpfoafit2

logitsvyfit2a <- svyglm(lowcst~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit2a)
logitparamfit2a <- exp(cbind(est = coef(logitsvyfit2a), confint(logitsvyfit2a)))
logitpfoafit2a <- logitparamfit2a[2, ]
logitpfoafit2a

logitsvyfit2b <- svyglm(lowcst~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit2b)
logitparamfit2b <- exp(cbind(est = coef(logitsvyfit2b), confint(logitsvyfit2b)))
logitpfoafit2b <- logitparamfit2b[2, ]
logitpfoafit2b

#PFHS
logitsvyfit3 <- svyglm(lowcst~logpfhs, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit3)
logitparamfit3 <- exp(cbind(est = coef(logitsvyfit3), confint(logitsvyfit3)))
logitpfhsfit3 <- logitparamfit3[2, ]
logitpfhsfit3

logitsvyfit3a <- svyglm(lowcst~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit3a)
logitparamfit3a <- exp(cbind(est = coef(logitsvyfit3a), confint(logitsvyfit3a)))
logitpfhsfit3a <- logitparamfit3a[2, ]
logitpfhsfit3a

logitsvyfit3b <- svyglm(lowcst~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit3b)
logitparamfit3b <- exp(cbind(est = coef(logitsvyfit3b), confint(logitsvyfit3b)))
logitpfhsfit3b <- logitparamfit3b[2, ]
logitpfhsfit3b

#PFNA
logitsvyfit4 <- svyglm(lowcst~logpfna, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit4)
logitparamfit4 <- exp(cbind(est = coef(logitsvyfit4), confint(logitsvyfit4)))
logitpfnafit4 <- logitparamfit4[2, ]
logitpfnafit4

logitsvyfit4a <- svyglm(lowcst~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit4a)
logitparamfit4a <- exp(cbind(est = coef(logitsvyfit4a), confint(logitsvyfit4a)))
logitpfnafit4a <- logitparamfit4a[2, ]
logitpfnafit4a

logitsvyfit4b <- svyglm(lowcst~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit4b)
logitparamfit4b <- exp(cbind(est = coef(logitsvyfit4b), confint(logitsvyfit4b)))
logitpfnafit4b <- logitparamfit4b[2, ]
logitpfnafit4b

##Score Delayed Recall##
#PFOS
logitsvyfit5 <- svyglm(lowcsr~logpfos, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit5)
logitparamfit5 <- exp(cbind(est = coef(logitsvyfit5), confint(logitsvyfit5)))
logitpfosfit5 <- logitparamfit5[2, ]
logitpfosfit5

logitsvyfit5a <- svyglm(lowcsr~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit5a)
logitparamfit5a <- exp(cbind(est = coef(logitsvyfit5a), confint(logitsvyfit5a)))
logitpfosfit5a <- logitparamfit5a[2, ]
logitpfosfit5a

logitsvyfit5b <- svyglm(lowcsr~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit5b)
logitparamfit5b <- exp(cbind(est = coef(logitsvyfit5b), confint(logitsvyfit5b)))
logitpfosfit5b <- logitparamfit5b[2, ]
logitpfosfit5b

#PFOA
logitsvyfit6 <- svyglm(lowcsr~logpfoa, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit6)
logitparamfit6 <- exp(cbind(est = coef(logitsvyfit6), confint(logitsvyfit6)))
logitpfoafit6 <- logitparamfit6[2, ]
logitpfoafit6

logitsvyfit6a <- svyglm(lowcsr~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit6a)
logitparamfit6a <- exp(cbind(est = coef(logitsvyfit6a), confint(logitsvyfit6a)))
logitpfoafit6a <- logitparamfit6a[2, ]
logitpfoafit6a

logitsvyfit6b <- svyglm(lowcsr~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit6b)
logitparamfit6b <- exp(cbind(est = coef(logitsvyfit6b), confint(logitsvyfit6b)))
logitpfoafit6b <- logitparamfit6b[2, ]
logitpfoafit6b

#PFHS
logitsvyfit7 <- svyglm(lowcsr~logpfhs, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit7)
logitparamfit7 <- exp(cbind(est = coef(logitsvyfit7), confint(logitsvyfit7)))
logitpfhsfit7 <- logitparamfit7[2, ]
logitpfhsfit7

logitsvyfit7a <- svyglm(lowcsr~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit7a)
logitparamfit7a <- exp(cbind(est = coef(logitsvyfit7a), confint(logitsvyfit7a)))
logitpfhsfit7a <- logitparamfit7a[2, ]
logitpfhsfit7a

logitsvyfit7b <- svyglm(lowcsr~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit7b)
logitparamfit7b <- exp(cbind(est = coef(logitsvyfit7b), confint(logitsvyfit7b)))
logitpfhsfit7b <- logitparamfit7b[2, ]
logitpfhsfit7b

#PFNA
logitsvyfit8 <- svyglm(lowcsr~logpfna, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit8)
logitparamfit8 <- exp(cbind(est = coef(logitsvyfit8), confint(logitsvyfit8)))
logitpfnafit8 <- logitparamfit8[2, ]
logitpfnafit8

logitsvyfit8a <- svyglm(lowcsr~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit8a)
logitparamfit8a <- exp(cbind(est = coef(logitsvyfit8a), confint(logitsvyfit8a)))
logitpfnafit8a <- logitparamfit8a[2, ]
logitpfnafit8a

logitsvyfit8b <- svyglm(lowcsr~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit8b)
logitparamfit8b <- exp(cbind(est = coef(logitsvyfit8b), confint(logitsvyfit8b)))
logitpfnafit8b <- logitparamfit8b[2, ]
logitpfnafit8b

## Animal Fluency ##
#PFOS
logitsvyfit9 <- svyglm(lowast~logpfos, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit9)
logitparamfit9 <- exp(cbind(est = coef(logitsvyfit9), confint(logitsvyfit9)))
logitpfosfit9 <- logitparamfit9[2, ]
logitpfosfit9

logitsvyfit9a <- svyglm(lowast~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit9a)
logitparamfit9a <- exp(cbind(est = coef(logitsvyfit9a), confint(logitsvyfit9a)))
logitpfosfit9a <- logitparamfit9a[2, ]
logitpfosfit9a

logitsvyfit9b <- svyglm(lowast~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit9b)
logitparamfit9b <- exp(cbind(est = coef(logitsvyfit9b), confint(logitsvyfit9b)))
logitpfosfit9b <- logitparamfit9b[2, ]
logitpfosfit9b

#PFOA
logitsvyfit10 <- svyglm(lowast~logpfoa, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit10)
logitparamfit10 <- exp(cbind(est = coef(logitsvyfit10), confint(logitsvyfit10)))
logitpfoafit10 <- logitparamfit10[2, ]
logitpfoafit10

logitsvyfit10a <- svyglm(lowast~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit10a)
logitparamfit10a <- exp(cbind(est = coef(logitsvyfit10a), confint(logitsvyfit10a)))
logitpfoafit10a <- logitparamfit10a[2, ]
logitpfoafit10a

logitsvyfit10b <- svyglm(lowast~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit10b)
logitparamfit10b <- exp(cbind(est = coef(logitsvyfit10b), confint(logitsvyfit10b)))
logitpfoafit10b <- logitparamfit10b[2, ]
logitpfoafit10b

#PFHS
logitsvyfit11 <- svyglm(lowast~logpfhs, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit11)
logitparamfit11 <- exp(cbind(est = coef(logitsvyfit11), confint(logitsvyfit11)))
logitpfhsfit11 <- logitparamfit11[2, ]
logitpfhsfit11

logitsvyfit11a <- svyglm(lowast~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit11a)
logitparamfit11a <- exp(cbind(est = coef(logitsvyfit11a), confint(logitsvyfit11a)))
logitpfhsfit11a <- logitparamfit11a[2, ]
logitpfhsfit11a

logitsvyfit11b <- svyglm(lowast~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit11b)
logitparamfit11b <- exp(cbind(est = coef(logitsvyfit11b), confint(logitsvyfit11b)))
logitpfhsfit11b <- logitparamfit11b[2, ]
logitpfhsfit11b

#PFNA
logitsvyfit12 <- svyglm(lowast~logpfna, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit12)
logitparamfit12 <- exp(cbind(est = coef(logitsvyfit12), confint(logitsvyfit12)))
logitpfnafit12 <- logitparamfit12[2, ]
logitpfnafit12

logitsvyfit12a <- svyglm(lowast~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit12a)
logitparamfit12a <- exp(cbind(est = coef(logitsvyfit12a), confint(logitsvyfit12a)))
logitpfnafit12a <- logitparamfit12a[2, ]
logitpfnafit12a

logitsvyfit12b <- svyglm(lowast~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit12b)
logitparamfit12b <- exp(cbind(est = coef(logitsvyfit12b), confint(logitsvyfit12b)))
logitpfnafit12b <- logitparamfit12b[2, ]
logitpfnafit12b

## Digital Symbol ##
#PFOS
logitsvyfit13 <- svyglm(lowds~logpfos, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit13)
logitparamfit13 <- exp(cbind(est = coef(logitsvyfit13), confint(logitsvyfit13)))
logitpfosfit13 <- logitparamfit13[2, ]
logitpfosfit13

logitsvyfit13a <- svyglm(lowds~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit13a)
logitparamfit13a <- exp(cbind(est = coef(logitsvyfit13a), confint(logitsvyfit13a)))
logitpfosfit13a <- logitparamfit13a[2, ]
logitpfosfit13a

logitsvyfit13b <- svyglm(lowds~logpfos + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                        + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                        + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit13b)
logitparamfit13b <- exp(cbind(est = coef(logitsvyfit13b), confint(logitsvyfit13b)))
logitpfosfit13b <- logitparamfit13b[2, ]
logitpfosfit13b

#PFOA
logitsvyfit14 <- svyglm(lowds~logpfoa, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit14)
logitparamfit14 <- exp(cbind(est = coef(logitsvyfit14), confint(logitsvyfit14)))
logitpfoafit14 <- logitparamfit14[2, ]
logitpfoafit14

logitsvyfit14a <- svyglm(lowds~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                         + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit14a)
logitparamfit14a <- exp(cbind(est = coef(logitsvyfit14a), confint(logitsvyfit14a)))
logitpfoafit14a <- logitparamfit14a[2, ]
logitpfoafit14a

logitsvyfit14b <- svyglm(lowds~logpfoa + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                         + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                         + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit14b)
logitparamfit14b <- exp(cbind(est = coef(logitsvyfit14b), confint(logitsvyfit14b)))
logitpfoafit14b <- logitparamfit14b[2, ]
logitpfoafit14b

#PFHS
logitsvyfit15 <- svyglm(lowds~logpfhs, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit15)
logitparamfit15 <- exp(cbind(est = coef(logitsvyfit15), confint(logitsvyfit15)))
logitpfhsfit15 <- logitparamfit15[2, ]
logitpfhsfit15

logitsvyfit15a <- svyglm(lowds~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                         + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit15a)
logitparamfit15a <- exp(cbind(est = coef(logitsvyfit15a), confint(logitsvyfit15a)))
logitpfhsfit15a <- logitparamfit15a[2, ]
logitpfhsfit15a

logitsvyfit15b <- svyglm(lowds~logpfhs + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                         + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                         + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit15b)
logitparamfit15b <- exp(cbind(est = coef(logitsvyfit15b), confint(logitsvyfit15b)))
logitpfhsfit15b <- logitparamfit15b[2, ]
logitpfhsfit15b

#PFNA
logitsvyfit16 <- svyglm(lowds~logpfna, design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit16)
logitparamfit16 <- exp(cbind(est = coef(logitsvyfit16), confint(logitsvyfit16)))
logitpfnafit16 <- logitparamfit16[2, ]
logitpfnafit16

logitsvyfit16a <- svyglm(lowds~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                         + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup), design = dclus1, family = binomial(logit), data = merger3data)
summary(logitsvyfit16a)
logitparamfit16a <- exp(cbind(est = coef(logitsvyfit16a), confint(logitsvyfit16a)))
logitpfnafit16a <- logitparamfit16a[2, ]
logitpfnafit16a

logitsvyfit16b <- svyglm(lowds~logpfna + factor(riagendr) + factor(race) + ridageyr + factor(education) + factor(marry) 
                         + factor(PIR) + factor(alq101) + factor(smoke) + factor(bmigroup) + factor(bpq020)
                         + factor(bpq080) + factor(diq010) + factor(mcq160c) + factor(mcq160f), family = binomial(logit), design = dclus1, data = merger3data)
summary(logitsvyfit16b)
logitparamfit16b <- exp(cbind(est = coef(logitsvyfit16b), confint(logitsvyfit16b)))
logitpfnafit16b <- logitparamfit16b[2, ]
logitpfnafit16b

#Unadjusted
rbind(logitpfosfit1, logitpfoafit2, logitpfhsfit3, logitpfnafit4)
rbind(logitpfosfit5, logitpfoafit6, logitpfhsfit7, logitpfnafit8)
rbind(logitpfosfit9, logitpfoafit10, logitpfhsfit11, logitpfnafit12)
rbind(logitpfosfit13, logitpfoafit14, logitpfhsfit15, logitpfnafit16)

#Adjusted Limited
rbind(logitpfosfit1a, logitpfoafit2a, logitpfhsfit3a, logitpfnafit4a)
rbind(logitpfosfit5a, logitpfoafit6a, logitpfhsfit7a, logitpfnafit8a)
rbind(logitpfosfit9a, logitpfoafit10a, logitpfhsfit11a, logitpfnafit12a)
rbind(logitpfosfit13a, logitpfoafit14a, logitpfhsfit15a, logitpfnafit16a)

#Adjusted Fully
rbind(logitpfosfit1b, logitpfoafit2b, logitpfhsfit3b, logitpfnafit4b)
rbind(logitpfosfit5b, logitpfoafit6b, logitpfhsfit7b, logitpfnafit8b)
rbind(logitpfosfit9b, logitpfoafit10b, logitpfhsfit11b, logitpfnafit12b)
rbind(logitpfosfit13b, logitpfoafit14b, logitpfhsfit15b, logitpfnafit16b)
