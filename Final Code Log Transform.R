# This R Script Produces All Our Data/Results for our log transformed data and the tests for our final model

setwd(dir = "/Users/madelynnelson/Documents/Stat 525 R")


## WageData2 is the wage data without the outlier; manually removed
WageData2 = read.table(file="cps85wages-2.txt", header = TRUE)
names(WageData2) = c("Education", "South", "Sex", "Experience", "Union", "Wage", "Age", "Race", "Occupation", "Sector", "Marr")
attach(WageData2)
WageData2$Sex = as.factor(WageData2$Sex)
library(ggplot2)
library(ggpubr)
library(dplyr)
##qqplot for the wage variable
ggqqplot(WageData2$Wage, title = "Wage Normality")
ggqqplot(WageData2, x = "Wage", color = "Sex", title = "Wage Normality")

## pairs plot of experience and age
pairs(Experience~Age)
## correlation between experience and age
cor(Age,Experience)

detach(WageData2)

## WageDataLog is the wage data with the log manually applied to the wage variable; it also lacks the outlier
WageDataLog = read.table(file = "cps85wages - log.txt", header = TRUE)
names(WageDataLog) = c("EducationLog", "SouthLog", "Sex", "ExperienceLog", "UnionLog", "WageLog", "AgeLog", "RaceLog", "OccupationLog", "SectorLog", "MarrLog")
attach(WageDataLog)
WageDataLog$Sex = as.factor(WageDataLog$Sex)
## qqplot for the wage variable with the log transformation
ggqqplot(WageDataLog$WageLog, title = "Wage Normality - Log Transform")
ggqqplot(WageDataLog, x = "WageLog", color = "Sex", title = "Wage Normality - Log Transform")

detach(WageDataLog)
 

------------------------------------------------------------------------------
  
  
  
## taking log of the wage variable from full dataset (WageData)
WAGELOG = log(WAGE)

## taking log of the wage variable from the set without the outlier (WageData2)
WageLog = log(Wage)

## model1 is a model without the outlier and with all the variables
model1 = lm(Wage ~ ., data = WageData2)

## modelOutlier is the model with the outlier and with all the variables
modelOutlier = lm(WAGE ~ ., data = WageData)

## plot of residuals for the model without the outlier
plot(model1$residuals, main = "Residuals Plot, Model without Outlier", ylab = "Residuals")
abline(h=0)

## plot of residuals for the model with the outlier
plot(modelOutlier$residuals, main = "Residuals Plot, Full Model", ylab = "Residuals")
abline(h=0)


res1 = regsubsets(WAGE ~ ., data = WageData, nbest=2, method = "exhaustive")
res2 = regsubsets(WAGELOG ~ EDUCATION+SOUTH+SEX+EXPERIENCE+UNION+AGE+RACE+OCCUPATION+SECTOR+MARR, data = WageData, nbest = 2, method = "exhaustive")
res3 = regsubsets(Wage ~., data = WageData2, nbest = 2, method = "exhaustive")
res4 = regsubsets(WageLog ~ Education+South+Sex+Experience+Union+Age+Race+Occupation+Sector+Marr, data = WageData2, nbest=2, method = "exhaustive")

## BIC and adjusted R-squared plot for the four sets of data: (1) full dataset, (2) full data set with 
## log transformation of wage, (3) data set without the outlier, (4) data set without the outlier and 
## with the log transformation of wage 
plot(res1, scale = "bic")
plot(res2, scale = "bic")
plot(res3, scale = "bic")
plot(res4, scale = "bic")
plot(res1, scale = "adjr2")
plot(res2, scale = "adjr2")
plot(res3, scale = "adjr2")
plot(res4, scale = "adjr2")
