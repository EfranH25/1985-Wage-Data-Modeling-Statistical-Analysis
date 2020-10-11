<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** EfranH25, repo_name, twitter_handle, email
-->

<!-- PROJECT LOGO -->
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

* [Background and Motivation](#Background and Motivation)
  * [Summary Conclusion](#Summary Conclusion)
  * [Tools Used](#Tools Used)
* [Data and Model Exploration](#Data and Model Exploration)
  * [Initial Analysis](#Initial Analysis)
  * [Initial Models](#Initial Models)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



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

<a href="https://drive.google.com/file/d/1dbON5nKYln6U27bFxFyu3TqnAhGTI_Py/view?usp=sharing">
    <img src="images/logo.png" alt="Logo" width="80" height="80">

![TEST](https://raw.githubusercontent.com/EfranH25/Gender-Wage-Gap-1985/master/1985%20Wages%20and%20Sex%20Analysis%20Figures/Fig%201.png)

### Initial Models

1. Clone the repo
```sh
git clone https://github.com/github_username/repo_name.git
```
2. Install NPM packages
```sh
npm install
```



<!-- USAGE EXAMPLES -->
## Usage

Use this space to show useful examples of how a project can be used. Additional screenshots, code examples and demos work well in this space. You may also link to more resources.

_For more examples, please refer to the [Documentation](https://example.com)_



<!-- ROADMAP -->
## Roadmap

See the [open issues](https://github.com/github_username/repo_name/issues) for a list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email

Project Link: [https://github.com/github_username/repo_name](https://github.com/github_username/repo_name)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* []()
* []()
* []()





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo.svg?style=flat-square
[contributors-url]: https://github.com/github_username/repo/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo.svg?style=flat-square
[forks-url]: https://github.com/github_username/repo/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo.svg?style=flat-square
[stars-url]: https://github.com/github_username/repo/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo.svg?style=flat-square
[issues-url]: https://github.com/github_username/repo/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo.svg?style=flat-square
[license-url]: https://github.com/github_username/repo/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/github_username
[product-screenshot]: images/screenshot.png
