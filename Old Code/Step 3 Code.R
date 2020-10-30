#This R Script produces all initial plots created for project during step 3

rm(list = ls())

cps85wages = read.table(file = "../STATS-525/IE Project/cpswages.dat", header = FALSE)
names(cps85wages) = c("EDUCATION","SOUTH", "SEX", "EXPERIENCE", "UNION", "WAGE", "AGE", "RACE", "OCCUPATION", "SECTOR", "MARR")


cps85wages

#Scatter Plots and Histograms
#Quantitative:
#EDUCATION
par(mfrow=c(1,2))
EDUCATION_wages_plot = plot(cps85wages$EDUCATION, cps85wages$WAGE, main = 'EDUCATION and WAGE Plot', xlab = 'EDUCATION', ylab = 'WAGE')

#Regrssion Line
EDUCATION_wages_fit <- lm(cps85wages$WAGE~cps85wages$EDUCATION)
abline(EDUCATION_wages_fit, col = 'red')
EDUCATION_wages_fit
#Histogram
EDUCATION_wages_plot_hist = hist(cps85wages$EDUCATION, main = 'EDUCATION Histogram', xlab = 'EDUCATION')

#Discrptive Statistics for Each Variable
summary(cps85wages$EDUCATION)
#Get Pearson Correlation for all values (r)
summary(EDUCATION_wages_fit)
cor(cps85wages$EDUCATION, cps85wages$WAGE)

summary(cps85wages$WAGE)
#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them

#---------------------------------------------------------------------------------------------------------------------------------
#EXPERIENCE
par(mfrow=c(1,2))
EXPERIENCE_wages_plot = plot(cps85wages$EXPERIENCE, cps85wages$WAGE, main = 'EXPERIENCE and WAGE Plot', xlab = 'EXPERIENCE', ylab = 'WAGE')

#Regrssion Line
EXPERIENCE_wages_fit <- lm(cps85wages$WAGE~cps85wages$EXPERIENCE)
abline(EXPERIENCE_wages_fit, col = 'red')

#Histogram
EXPERIENCE_wages_plot_hist = hist(cps85wages$EXPERIENCE, main = 'EXPERIENCE Histogram', xlab = 'EXPERIENCE')

#Discrptive Statistics for Each Variable
summary(cps85wages$EXPERIENCE)
#Get Pearson Correlation for all values (r)
summary(EXPERIENCE_wages_fit)
cor(cps85wages$EXPERIENCE, cps85wages$WAGE)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------
#AGE
par(mfrow=c(1,2))
AGE_wages_plot = plot(cps85wages$AGE, cps85wages$WAGE, main = 'AGE and WAGE Plot', xlab = 'AGE', ylab = 'WAGE')

#Regrssion Line
AGE_wages_fit <- lm(cps85wages$WAGE~cps85wages$AGE)
abline(AGE_wages_fit, col = 'red')

#Histogram
AGE_wages_plot_hist = hist(cps85wages$AGE, main = 'AGE Histogram', xlab = 'AGE')

#Discrptive Statistics for Each Variable
summary(cps85wages$AGE)
#Get Pearson Correlation for all values (r)
summary(AGE_wages_fit)
cor(cps85wages$AGE, cps85wages$WAGE)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------

#Categorical:
#SEX (0 = Male, 1 = Female)
par(mfrow=c(1,2))
SEX_wages_plot = plot(cps85wages$SEX, cps85wages$WAGE, main = 'SEX and WAGE Plot', xlab = 'SEX', ylab = 'WAGE')

#Regrssion Line
SEX_wages_fit <- lm(cps85wages$WAGE~cps85wages$SEX)
abline(SEX_wages_fit, col = 'red')

SEX_wages_fit

#Histogram
SEX_wages_plot_hist = hist(cps85wages$SEX, main = 'SEX Histogram', xlab = 'SEX')

#Discrptive Statistics for Each Variable
summary(cps85wages$SEX)
#Get Pearson Correlation for all values (r)
summary(SEX_wages_fit)
cor(cps85wages$SEX, cps85wages$WAGE)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------

#SOUTH (0 = Doesn't live in South, 1 = Lives in South)
par(mfrow=c(1,2))
SOUTH_wages_plot = plot(cps85wages$SOUTH, cps85wages$WAGE, main = 'SOUTH and WAGE Plot', xlab = 'SOUTH', ylab = 'WAGE')

#Regrssion Line
SOUTH_wages_fit <- lm(cps85wages$WAGE~cps85wages$SOUTH)
abline(SOUTH_wages_fit, col = 'red')

#Histogram
SOUTH_wages_plot_hist = hist(cps85wages$SOUTH, main = 'SOUTH Histogram', xlab = 'SOUTH')

#Discrptive Statistics for Each Variable
summary(cps85wages$SOUTH)
#Get Pearson Correlation for all values (r)
summary(SOUTH_wages_fit)
cor(cps85wages$SOUTH, cps85wages$WAGE)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------  
#UNION (0 = Not union Member, 1 = Union Member)
par(mfrow=c(1,2))
UNION_wages_plot = plot(cps85wages$UNION, cps85wages$WAGE, main = 'UNION and WAGE Plot', xlab = 'UNION', ylab = 'WAGE')

#Regrssion Line
UNION_wages_fit <- lm(cps85wages$WAGE~cps85wages$UNION)
abline(UNION_wages_fit, col = 'red')

#Histogram
UNION_wages_plot_hist = hist(cps85wages$UNION, main = 'UNION Histogram', xlab = 'UNION')

#Discrptive Statistics for Each Variable
summary(cps85wages$UNION)
#Get Pearson Correlation for all values (r)
summary(UNION_wages_fit)
cor(cps85wages$UNION, cps85wages$WAGE)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------  
#RACE (1 = Other, 2 = Hispanic, 3 = White)
par(mfrow=c(1,2))
RACE_wages_plot = plot(cps85wages$RACE, cps85wages$WAGE, main = 'RACE and WAGE Plot', xlab = 'RACE', ylab = 'WAGE')

#Regrssion Line
RACE_wages_fit <- lm(cps85wages$WAGE~cps85wages$RACE)
abline(RACE_wages_fit, col = 'red')

#Histogram
RACE_wages_plot_hist = hist(cps85wages$RACE, main = 'RACE Histogram', xlab = 'RACE')

#Discrptive Statistics for Each Variable
summary(cps85wages$RACE)
#Get Pearson Correlation for all values (r)
summary(RACE_wages_fit)
cor(cps85wages$RACE, cps85wages$WAGE)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------  
#OCCUPATION (1 = Management, 2 = Sales, 3 = Clerical, 4 = Service, 5 = Professional, 6 = Other)
par(mfrow=c(1,2))
OCCUPATION_wages_plot = plot(cps85wages$OCCUPATION, cps85wages$WAGE, main = 'OCCUPATION and WAGE Plot', xlab = 'OCCUPATION', ylab = 'WAGE')

#Regrssion Line
OCCUPATION_wages_fit <- lm(cps85wages$WAGE~cps85wages$OCCUPATION)
abline(OCCUPATION_wages_fit, col = 'red')

#Histogram
OCCUPATION_wages_plot_hist = hist(cps85wages$OCCUPATION, main = 'OCCUPATION Histogram', xlab = 'OCCUPATION')

#Discrptive Statistics for Each Variable
summary(cps85wages$OCCUPATION)
#Get Pearson Correlation for all values (r)
summary(OCCUPATION_wages_fit)
cor(cps85wages$OCCUPATION, cps85wages$WAGE)
#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------  
#SECTOR (0 = Other, 1 = Manufacturing, 2 = Construction)
par(mfrow=c(1,2))
SECTOR_wages_plot = plot(cps85wages$SECTOR, cps85wages$WAGE, main = 'SECTOR and WAGE Plot', xlab = 'SECTOR', ylab = 'WAGE')

#Regrssion Line
SECTOR_wages_fit <- lm(cps85wages$WAGE~cps85wages$SECTOR)
abline(SECTOR_wages_fit, col = 'red')

#Histogram
SECTOR_wages_plot_hist = hist(cps85wages$SECTOR, main = 'SECTOR Histogram', xlab = 'SECTOR')

#Discrptive Statistics for Each Variable
summary(cps85wages$SECTOR)
#Get Pearson Correlation for all values (r)
summary(SECTOR_wages_fit)
cor(cps85wages$SECTOR, cps85wages$WAGE)
#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------  
#MARITAL STATUS (0 = Unmarried, 1 = Married)
par(mfrow=c(1,2))
MARR_wages_plot = plot(cps85wages$MARR, cps85wages$WAGE, main = 'MARITAL STATUS and WAGE Plot', xlab = 'MARITAL STATUS', ylab = 'WAGE')

#Regrssion Line
MARR_wages_fit <- lm(cps85wages$WAGE~cps85wages$MARR)
abline(MARR_wages_fit, col = 'red')

#Histogram
MARR_wages_plot_hist = hist(cps85wages$MARR, main = 'MARITAL STATUS Histogram', xlab = 'MARITAL STATUS')

#Discrptive Statistics for Each Variable
summary(cps85wages$MARR)
#Get Pearson Correlation for all values (r)
summary(MARR_wages_fit)
cor(cps85wages$MARR, cps85wages$WAGE)
#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them
#---------------------------------------------------------------------------------------------------------------------------------  

