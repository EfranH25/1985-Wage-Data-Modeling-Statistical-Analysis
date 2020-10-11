<br />
<p align="center">
  <h3 align="center">1985 Wages and Sex Relationship Analysis</h3>

  <p align="center">
    This project analyzes wage data from the 1985 Current Population Survey to see what factors have the greatest impact on wage outcomes for individuals. In particular, this project examines whether gender is one of the main factors in wage outcomes.
    <br />
    <a href="https://github.com/EfranH25/Gender-Wage-Gap-1985"><strong>Explore the Repo »</strong></a>
    <a href="https://drive.google.com/file/d/1o7xOckNXH_Ay-jqTiPslZ7wzCkazX2o1/view?usp=sharing">View Presentation</a>
    ·
    <a href="https://drive.google.com/file/d/19-jZxUslRl81f5ewzPU4jF2FEappSz8f/view?usp=sharing">View Writup</a>

  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Background_and_Motivation](#Background_and_Motivation)
  * [Summary_Conclusion](#Summary_Conclusion)
  * [Tools_Used](#Tools_Used)
* [Data and Model Exploration](#Data and Model Exploration)
  * [Initial Analysis](#Initial Analysis)
  * [Initial Models](#Initial Models)
* [Final Model](#Final Model)
* [Contact](#contact)



<!-- Background and Motivation -->
## Background and Motivation

The “gender pay gap” is a controversial and highly debated topic in the United States. This raises the question amongst people: does sex really affect a person’s wage? The project’s goal is to determine how significantly sex impacts a person’s predicted wage, in 1985. Although, it is likely that the wage disparity between males and females has decreased since 1985, by studying this information institutions can gain insight that might help make future projections on how this issue may develop. An analysis of the gender pay gap will allow us to gain a better and informed understanding on how such an issue can be tackled and where solutions need to be applied.

In the project, I assessed the impact of sex on wages while taking into consideration other confounding variables. The data is collected by the 1985 Current Population Survey and contains 11 variables. The four quantitative variables in the data set are level of education, number of years of experience, age, and wage. The remaining seven qualitative variables included in the data are sex, whether they live in the south, if they are in a union, race, occupation, sector, and marital status. Using a multitude of analytical tests, I wanted to determine whether each of these variables has a significant effect on wage. I analyzed the distribution among each variable, looked at adjusted residuals, and estimated AIC and BIC to determine the importance of each predictor variable. These methods allowed me to create a regression model for predicting wage, including only the variables I deemed important. 

### Summary Conclusion
Based on the data from the 1985 Current Population Survey, I found that sex is an important predictor variable in the model to predict wage. Using log transformations of the data to address a lack of normality, I was able to produce a final model for predicting wage that includes the predictor variables age, education, sex, union, and sector. In this model, sex has a negative coefficient meaning it will decrease predicted wage when the value of sex is one, which represents females. Therefore, it is likely that being a female could have a negative impact on wage. Although these findings are interesting, I am unable to make sweeping general statements due to the limitations of the data and tests. 

### Tools Used
* R Studio and Various R Packages
* Google Slides


<!-- Data Exploration -->
## Data and Model Exploration
This section goes over how the information in the data set was explored.

### Initial Analysis
For the first step in the analysis, I plotted each one of the variables against wage to gain an idea of the various distributions that were present within the data. I also produced various histograms for each of the predictor variables as well. Creating these plots gave me a general initial idea of the relationships between each one of the variables in relation to wage. They also gave me a rough sense of which variables had outliers that may be of concern for me later. Overall, from these initial plots I did not encounter any outstanding plots that may provide any interesting insights about the data other than that some relationship does exist between wage on the variables. With that said, none of the plots implied a strong linear relationship with wages, the highest R2 value of 0.1459 going to the age and wage plot, which indicated to me that it is likely a combination of variables would more strongly relate to wage than a single one. All the plots had some outlying variables, I interpreted many of these to be unique individuals whose circumstances impacted their wages much differently compared to their contemporaries. For extreme cases, I noted that the outlier may have to be removed when I create the final model because they most likely did not represent the general population at the time, such as someone being born into extreme wealth and easily acquiring a high wage job early in life. For example, in figure 1, the age against wage and experience against wage plots have an extreme outlier in the beginning where they have the highest wage with one of the lowest age and education.

![Figure 1](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%201.png)

After creating these plots, I produced regression lines for each one to determine which plots had some linear relationship with wages. I would later use the residuals from these lines for more in-depth analysis of the data later. 

After the initial data exploration, I continued the analysis with residual plots to see if there were any unusual behaviors. It can be seen from the plot on the left in Figure 2 below, which shows the full data set, there is one outlier that is significantly different from the rest of the data. I removed the outlier and replotted the residuals, which can be seen on the plot to the right.

![Figure 2](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%202.png)

This outlier represents a white woman age 21 with one year of experience and a wage of 44.50 dollars, which is roughly 18 dollars higher than the next highest wage of 26.29 dollars. I decided that if testing revealed that it would be beneficial to remove this outlier, it would be acceptable to do so because of the fact that that data point is not very representative of the rest of the data set. 

During the data analysis, I used the pairs function in R to plot the correlations of each of the variables, and I found that age and experience have a very high correlation of 0.9779, which can be seen in Figure 3 below. 

![Figure 3](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%203.png)

Due to this fact, I decided that the final model would only include one of these in an effort to eliminate any unnecessary variables, but I had to do more testing to determine which of these variables would remain in the final model.

Q-Q plots of each of the quantitative variables were examined as well, this was to make sure that the normality assumption was upheld. I examined the normality for experience, education, age, and wage in two types of Q-Q plots, one where sex was not considered and another where sex was considered. In general, I found that experience, education, and age all had some semblance of normality or almost normality for both types of graphs. However, during the testing, I found that the wage variable showed a right skew, which can be seen from the graph on the left in Figure 4 below.

![Figure 4](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%204.png)

To resolve the issue of nonnormality of wage, a log transformation on wage was applied which can be seen from the second Q-Q plot in the figure above. I noticed that this new plot showed much less of a skew, so I decided that a log transformation of the wage variable was something I would want to consider when carrying out further testing.

### Initial Models
Another approach I utilized to analyze the data were BIC and AIC tests. This allowed me to test for every possible combination of predictor variable so that I may gain some insight on which variables had the highest predictive capacity for wages in the given data. After completing both tests, I found that all top scoring models in both the AIC and BIC results had sex and union status and some combination of education and experience. I interpreted this finding to mean, that sex and union had the strongest predictive capabilities for the data set in determining seeing what an individual’s wage would be.

![Table 1](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Table%201.png)

After gaining these results, I decided to test the robustness of the models. I conducted 10-fold cross validation for all the top-ranking models to see how robust these regression models were. All the AIC and BIC models had very low R-squared values of around 0.28 when run through cross validation. After conducting these tests I now believed that sex likely has some relationship with wages, due to it being in all the best models, but does not alone make significant contributions to predicting the final outcome of an individual’s wage. Despite their lack of robustness, the models produced from the BIC and AIC testing would be used as a foundation for the final model.

After the data analysis, I had two things that I wanted to consider when building initial models to ensure the linearity assumptions were met and to make sure the models would have a satisfactory predictive ability: the removal of the outlier and the log transformation of the wage variable. In an attempt to determine which of those steps should be taken, I performed adjusted R-squared and BIC testing with the four sets of data were I considered: (1) the original data set, (2) the data set with the log transformation of wage, (3) the data set with the outlier removed, and (4) the data set with the outlier removed and with the log transformation of wage.

I conducted adjusted R-squared testing first, and the four resulting plots can be seen in the figure below:

![Figure 5](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%205.png)

With these graphs, it can be seen that the models without the outlier have a higher adjusted R-Squared, which suggests that leaving out the outlier would produce models that were a better fit for the rest of the dataset. As aforementioned, I feel comfortable with removing this point because it is not very representative of the rest of the data. I can also see from Figure 5 that the models with the log transformation of wage outperformed those without the log transformation, suggesting that there is evidence that I should transform the wage variable in the final model.

In carrying out BIC testing, I used the same four sets of data as I did with adjusted R-Squared, which is illustrated in Figure 6. It can be seen that this form of testing returned very similar results to those obtained with adjusted R-Squared testing in regards to the fact that the best fit models had no outlier as well as the log transformation of the wage variable. 

![Figure 6](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%206.png)

Therefore, after testing with both adjusted R-Squared and BIC, I decided to remove the outlier from the dataset and do the log transformation on wage to uphold the normality assumption.

<!-- Final Model -->
## Final Model
With the outlier now removed, I wanted to see if the initial models (without outlier removed and no transformations) would still uphold. From the new BIC tests and adjusted R-Squared tests, it was determined that the sector variable could be added to the model. Though, I were not sure whether I should include an additional variable to the final model or not as it could make the model become overfit. I performed an ANOVA test at an alpha level of 0.05 between the two models: the initial model and the initial model with sector. The null hypothesis stated that the initial model without sector is a better performing model. The ANOVA test gave a p-value of 0.01175, thus I rejected the null hypothesis and stated that sector was a significant variable in the model.

Due to the multicollinearity between age and experience, I had to decide which one of the two variables to omit from the final model. I computed the Variance Inflation Factor for two different models, one that included age and another that included experience. The VIF values for the model that contained age were overall lower and had values closer to one when in comparison to the model that contained experience. Therefore, I decided to include age over experience in the final model. 

With the transformation performed, the outlier removed, and an additional variable added to the model, I decided that I exhausted all possible diagnostic testing and have concluded that I had reached the final model. I ran an analysis on the final model and receive:

![Final Regression Equation](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Regression%20Model%20Equation.png)

as the multilinear regression model for determining wage with an adjusted R-squared of 0.3067. 

<!-- CONTACT -->
## Contact

Efran Himel - efranhimel@gmail.com

Project Link: [https://github.com/EfranH25/Gender-Wage-Gap-1985](https://github.com/EfranH25/Gender-Wage-Gap-1985)
