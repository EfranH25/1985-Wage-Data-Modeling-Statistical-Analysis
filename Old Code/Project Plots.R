data = read.table(file = "../STATS-525/IE Project/cps85wages.txt")

df <- data.frame(data)


colnames(df) <- c("EDUCATION","SOUTH", "SEX", "EXPERIENCE", "UNION", "WAGE", "AGE", "RACE", "OCCUPATION", "SECTOR", "MARR")

#print(df)

#hist(df$EDUCATION)
#hist(df$SOUTH)
#hist(df$SEX)
#hist(df$EXPERIENCE)
#hist(df$UNION)
#hist(df$WAGE)
#hist(df$AGE)
#hist(df$RACE)
#hist(df$OCCUPATION)
#hist(df$SECTOR)
#hist(df$MARR)

#Creates 2 X 2 Marix that shows 4 graphs in 4 pages

par(mfrow=c(2,2))

plot(df$EDUCATION, df$WAGE, main = 'EDUCATION and WAGE Plot', xlab = 'EDUCATION', ylab = 'WAGE')
fit <- lm(df$WAGE~df$EDUCATION)
plot(df$SOUTH, df$WAGE, main = 'SOUTH and WAGE Plot', xlab = 'SOUTH', ylab = 'WAGE')
plot(df$SEX, df$WAGE, main = 'SEX and WAGE Plot', xlab = 'SEX', ylab = 'WAGE')
plot(df$EXPERIENCE, df$WAGE, main = 'EXPERIENCE and WAGE Plot', xlab = 'EXPERIENCE', ylab = 'WAGE')
plot(df$UNION, df$WAGE, main = 'UNION and WAGE Plot', xlab = 'UNION', ylab = 'WAGE')
plot(df$AGE, df$WAGE, main = 'AGE and WAGE Plot', xlab = 'AGE', ylab = 'WAGE')
plot(df$RACE, df$WAGE, main = 'RACE and WAGE Plot', xlab = 'RACE', ylab = 'WAGE')
plot(df$OCCUPATION, df$WAGE, main = 'OCCUPATION and WAGE Plot', xlab = 'OCCUPATION', ylab = 'WAGE')
plot(df$SECTOR, df$WAGE, main = 'SECTOR and WAGE Plot', xlab = 'SECTOR', ylab = 'WAGE')
plot(df$MARR, df$WAGE, main = 'MARR and WAGE Plot', xlab = 'MARR', ylab = 'WAGE')

#Scatter Plots

#Histograms

#Discrptive Statistics for Each Variable

#Get Pearson Correlation for all values (r)

#For Each Predictor Variable (Categorical and Qualitative)--> describe how Y affects them

#Regrssion Line