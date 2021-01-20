---
title: "Projects"
permalink: /projects/
---

Monitoring Methane Emissions from Oil and Gas Operations
------
I work on this project in collaboration with the Payne Institute for Public Policy. We are broadly seeking to use techniques from data science and statistics to more completely and accurately monitor emissions from oil and gas operations. 

While working on this initiative, I created a hierarchical Bayesian model to estimate methane fields from "pixelated" TROPOMI observations. The figure below shows TROPOMI observations in northeast Colorado on the left and our estimated methane field on the right. Note that we did not simply Krig the TROPOMI observations assuming they are points, but we rather took into account the size of the TROPOMI "pixel" projected onto the earth's surface. The data level of our model is z = Wc + e, where z are the TROPOMI observations, W is a matrix that averaged the methane field, c, and e are normal errors. The process level of our model is c = BX + y, where c is again the methane field, X is a data matrix of latitudes and longitudes with B its coefficients, and y a Gaussian process. 

<img src="https://wsdaniels.github.io/images/pixels_and_preds.png">

This project also involves ground level continuous monitoring data. I put together an AWS-based database to recieve these data in real time and store them in an easily accessible manner. We have performed an initial exploratory analysis of these data. Shown below are the VOC signals from three monitoring units during a known leak event. Highlighted in color are times when the wind was blowing from the leak to each unit. The overlap between the west (yellow) unit and the wind is the basis of a source localization algorithm that we are currently developing.

<img src="https://wsdaniels.github.io/images/continuous_monitoring_wind.png">


Modeling Atmospheric Carbon Monoxide
------
I work on this project in collaboration with scientists at the National Center for Atmospheric Research (NCAR). We are broadly seeking to model atmospheric carbon monoxide (CO) anomalies using climate mode indices. Atmospheric CO and climate indices are connected by fires. In the Southern Hemisphere (our primary study region), fires are the main source of atmospheric CO. Furthermore, fire intensity and burned area are related to the amount, type, and dryness of available fuel, which respond to the variability in climate described by climate indices. 

We have created a lagged multiple linear regression model where atmospheric CO is the response and various climate indices at different lags are the predictors. We perform variable selection using a recent hierarchy preseving regulation algorithm.

I am currently writing a paper on this research. The figure below is taken from this manuscript and addresses the stability of our model. The top plot shows that our model trained on all of the data (main model) performs as well or better than our model refit to a subset of the data with one year left out (new model), regardless of the year left out. This suggests that our model is picking up a meaningful signal in the climate indices, rather than random correlations. The bottom left plot shows the relative frequency of main model terms from the leave one year out cross validation. The bottom right plot similarly shows the relative frequency of non-main model terms from the cross validation. This figure shows that certain indices have a very strong relationship to atmospheric CO (like ENSO lagged at 4 weeks), while others perhaps have a more subtle relationship (like ENSO lagged at 49 weeks). 

The goal of this project is to develop a modeling framework that can both be used to predict future CO anoamlies, which can give advanced warning of fire season intensity, as well as better explain the connection between atmospheric chemistry and climate, a relationship that is less studied. The stability analysis shown in the figure below attemps to add weight to the climate indices selected by regularization.

<img src="https://wsdaniels.github.io/images/co_modeling.png">

Verifying an ELVES Simulation using a Data Set of Observed ELVES
------
I worked on this project while in the Physics Department at Mines. ELVES (Emission of Light and Very Low Frequency perturbations due to Electromagnetic Pulse Sources) are phenomena that occur in the upper atmospheric due to strong lightning strikes. They appears as bright rings that grow in diameter until dissipating.

The goal of this project was to compare an ELVE simulation to a novel data set of observed ELVES from the Pierre Auger observatory. As part of this project, I performed a sensitivity study on this simulation, which ultimately helped determine which lightning parameters the ELVES are most sensitive too. Shown below are some results from this study. The three plots correspond to three ELVE parameters (written below), and plotted is the sensitivity of various lightning parameters. Large ratios indicate the the ELVE parameter is very sensitive to that lightning parameter.

<img src="https://wsdaniels.github.io/images/physics.png">
