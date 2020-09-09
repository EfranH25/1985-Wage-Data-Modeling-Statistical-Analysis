# This R Script Produces All Our BIC,AIC, and Cross-Validation Results for our Step 4

#install.packages("leaps")
#install.packages("tidyverse")
#install.packages("caret")

library(leaps)
library(tidyverse)
library(caret)

rm(list = ls())

cps85wages = read.table(file = "cpswages.dat", header = FALSE)
names(cps85wages) = c("EDUCATION","SOUTH", "SEX", "EXPERIENCE", "UNION", "WAGE", "AGE", "RACE", "OCCUPATION", "SECTOR", "MARR")

cps85wages

attach(cps85wages)

# Use regsubsets to calculate model selection criteria and rank models
# find out more about regsubsets:

# calculate the criteria for various candidate models:
res <- regsubsets(cps85wages$WAGE ~ ., data=cps85wages, 
                    nbest=3, # how many candidate models to display for each number of parameters included? 
                    method="exhaustive" # how to check candidate models
  )


# overview of models: which variables are included?

par(cex.axis = 1.5, cex.lab = 1.5)
plot(res, scale = "bic") # using BIC
par(cex.axis = 1.5, cex.lab = 1.5, mar = c(5,5,1,1))
plot(res, scale = "adjr2") # using adjusted Rsquared

# examine criteria in more detail:
summ <- summary(res)
selected <- summ$which # this gives a 1/0 (TRUE/FALSE) for included/excluded predictor variables
selected

attributes(summ)

# BIC
bic <- summ$bic
# which models are within +2 of model with smallest BIC?
# how many models
sum(bic < (min(bic) +2)) # 2 models within 2 of minimum
# info on those models:
cbind(bic, selected)[(bic < (min(bic) +2)), ]
# 1 for a predictor means it's included in the model

#BIC Cross Validation Tests
# Define training control
set.seed(123) 
train.control <- trainControl(method = "repeatedcv", 
                              number = 10, repeats = 10)

# Train the model
cv_model <- train(WAGE ~ ., data = cps85wages, method = "lm",
                  trControl = train.control)

cv_bic1 <- train(WAGE ~ EDUCATION+SEX+EXPERIENCE+UNION, data = cps85wages, method = "lm",
               trControl = train.control)

cv_bic2 <- train(WAGE ~ EDUCATION+SEX+UNION+AGE, data = cps85wages, method = "lm",
                   trControl = train.control)

cv_bic3 <- train(WAGE ~ SEX+EXPERIENCE+UNION+AGE, data = cps85wages, method = "lm",
                   trControl = train.control)

# Summarize the results
print(cv_model)
print(cv_bic1)
print(cv_bic2)
print(cv_bic3)

min(c(4.351149,4.363351,4.363794))
min(c(0.287044,0.286095,0.2865341))
mean(c(3.188479,3.190695, 3.191397))

# AIC
# Adjusted Rsquared:
# (No rule of thumb here, just looking at the models within 1% of the best model)
cbind(summ$adjr2, selected)[(summ$adjr2 > (max(summ$adjr2) -0.01)), ]

cv_aic1 <- train(WAGE ~ EDUCATION+SEX+EXPERIENCE+UNION, data = cps85wages, method = "lm",
                   trControl = train.control)
cv_aic2 <- train(WAGE ~ EDUCATION+SEX+UNION+AGE, data = cps85wages, method = "lm",
                 trControl = train.control)
cv_aic3 <- train(WAGE ~ SEX+EXPERIENCE+UNION+AGE, data = cps85wages, method = "lm",
                 trControl = train.control)

cv_aic4 <- train(WAGE ~ EDUCATION+SEX+EXPERIENCE+UNION+RACE, data = cps85wages, method = "lm",
                 trControl = train.control)
cv_aic5 <- train(WAGE ~ EDUCATION+SEX+UNION+AGE+RACE, data = cps85wages, method = "lm",
                 trControl = train.control)
cv_aic6 <- train(WAGE ~ EDUCATION+SOUTH+SEX+EXPERIENCE+UNION, data = cps85wages, method = "lm",
                 trControl = train.control)
print(cv_aic1)
print(cv_aic2)
print(cv_aic3)
print(cv_aic4)
print(cv_aic5)
print(cv_aic6)



mean(c(4.353261,4.363868,4.363367,4.357479,4.354874,4.349955))
mean(c(0.2867345,0.2874234,0.2914519,0.2898737,0.2855159,0.290442 ))
mean(c(3.184384,3.190609,3.196297,3.169784,3.165077,3.167207))
