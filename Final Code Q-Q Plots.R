#This R Script Produces all Q-Q plots and test results for Presentation 

#install.packages("ggpubr")
#install.packages("dplyr")
#install.packages("caret")

setwd("~/stats 525/project")
cps85wages = read.table(file = "cpswages.dat", header = FALSE)
names(cps85wages) = c("EDUCATION","SOUTH", "SEX", "EXPERIENCE", "UNION", "WAGE", "AGE", "RACE", "OCCUPATION", "SECTOR", "MARR")

library(ggpubr)
library(dplyr)
library(caret)

new_cps85wages = subset(cps85wages, WAGE < 40)
new_cps85wages$SEX <- as.factor(new_cps85wages$SEX)

#QQ plot of education
#normal plot
ggqqplot(new_cps85wages$EDUCATION, title = "Education Normality")
#plot separated by sex
ggqqplot (new_cps85wages, x = "EDUCATION", color = "SEX", title = "Education Normality")

#QQ plot of experience
ggqqplot(new_cps85wages$EXPERIENCE, title = "Experience Normality")
ggqqplot (new_cps85wages, x = "EXPERIENCE", color = "SEX", title = "Experience Normality")

#QQ plot of wage
wage_log = log(new_cps85wages$WAGE)
ggqqplot(wage_log, title = "Wage Normality")
ggqqplot(new_cps85wages, x = log("WAGE"), color = "SEX", title = "WAGE Normality")

#QQ plot of age
#normal plot
ggqqplot (new_cps85wages$AGE, title = "Age Normality")
#plot separates by sex
ggqqplot (new_cps85wages, x = "AGE", color = "SEX", title = "Age Normality")

#shapiro tests
shapiro.test(cps85wages$EDUCATION)
shapiro.test(cps85wages$AGE)
shapiro.test(cps85wages$WAGE)
shapiro.test(cps85wages$EXPERIENCE)

#testing which model is better -- the one with experience or the one with age
wages.both = lm(formula = WAGE ~ AGE + EDUCATION + SEX + UNION + EXPERIENCE , data = new_cps85wages)
wages.age = lm(formula = WAGE ~ AGE + EDUCATION + SEX + UNION, data = new_cps85wages)
wages.experience = lm(formula = WAGE ~ EDUCATION + SEX + UNION + EXPERIENCE , data = new_cps85wages)

car::vif(wages.both)
car::vif(wages.age)
car::vif(wages.experience)
