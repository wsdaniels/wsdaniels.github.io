---
title: "Projects"
permalink: /projects/
---

Monitoring Emissions from Oil and Gas Operations
------
I work on this project in collaboration with the Payne Institute for Public Policy. We are broadly seeking to use techniques from data science and statistics to more completely and accurately monitor emissions from oil and gas operations. 

While working on this initiative, I created a hierarchical Bayesian model to estimate methane fields from "pixelated" TROPOMI observations. The figure below shows TROPOMI observations from a single pass over northeast Colorado and the estimated methane field. Note that we do not simply Krig the TROPOMI observations assuming that they are point sources, but rather take into account the size of the TROPOMI "pixel" projected onto the earth's surface. The data level of our model is z = Wc + e, where z are the TROPOMI observations, W is a matrix that averages the methane field, c, and e are normal errors. The process level of our model is c = BX + y, where c is again the methane field, X is a data matrix of latitudes and longitudes with B its coefficients, and y a Gaussian process. 

<img src="https://wsdaniels.github.io/images/pixels_and_preds.png">

This project also involves ground level continuous monitoring data. I put together an AWS database to receive these data in real time and store them in an easily accessible manner. We have performed an initial exploratory analysis of these data. Shown below are the VOC signals from three monitoring units during a known leak event. Highlighted in color are times when the wind was blowing from the leak to each unit. The overlap between the west (yellow) unit and the wind is the basis of a source localization algorithm that we are currently developing.

<img src="https://wsdaniels.github.io/images/continuous_monitoring_wind.png">


Modeling Atmospheric Carbon Monoxide
------
I work on this project in collaboration with scientists at the National Center for Atmospheric Research (NCAR). We are broadly seeking to model atmospheric carbon monoxide (CO) anomalies using climate mode indices. Atmospheric CO and climate indices are largely connected by fires. In the Southern Hemisphere (our primary study region), fires are the main source of atmospheric CO. Furthermore, fire intensity and burned area are related to the amount, type, and dryness of available fuel, all of which respond to the variability in climate described by climate indices.

Building on previous work, I switched from month to week averaged data and introduced an additional climate index (the MJO). I also implemented a recent hierarchy preserving regulation algorithm to perform variable selection instead of stepwise selection. The figure below compares predictions between a model containing the MJO and a model without the MJO. These predictions are also compared to the predictions from a model trained on month averaged data. The weekly models perform better than the monthly model when averaged on the same timescale. As a whole, the MJO model is on par with the no MJO model, however, the MJO seems to increase our ability to predict the largest anomalies. 

<img src="https://wsdaniels.github.io/images/pred_and_peak.png">

While working on this project, I also created a framework for selecting optimally performing models at varying complexities. This helps us see which climate indices and lags are most significant as we force the models to become more parsimonious. Finally, I used cross-validation to quantify the stability of selected model terms, which adds weight to our interpretation of these optimally performing models.

Verifying an ELVES Simulation using a Data Set of Observed ELVES
------
I worked on this project while in the Physics Department at Mines. ELVES (Emission of Light and Very Low Frequency perturbations due to Electromagnetic Pulse Sources) are phenomena that occur in the upper atmospheric due to strong lightning strikes. They appears as bright rings that grow in diameter until dissipating.

The goal of this project was to compare an ELVES simulation to a novel data set of observed ELVES from the Pierre Auger observatory. As part of this project, I performed a sensitivity study on the simulation, which helped identify the lightning parameters that most strongly influence ELVES shape and amplitude. Shown below are some results from this study. The three plots correspond to three ELVES parameters (written below the figure), and plotted is the sensitivity of various lightning parameters. Large ratios indicate that the given ELVES parameter is very sensitive to that lightning parameter.

<img src="https://wsdaniels.github.io/images/physics.png">
