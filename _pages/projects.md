---
title: "Projects"
permalink: /projects/
---

Monitoring Methane Emissions from Oil and Gas Operations
------
I work on this project in collaboration with the Payne Institute for Public Policy. We are broadly seeking to use techniques from data science and statistics to more completely and accurately monitor emissions from oil and gas operations. 

While working on this initiative, I created a hierarchical Bayesian model to estimate methane fields from "pixelated" TROPOMI observations (see figure below). The data level of our model is z = Wc + e, where z are the TROPOMI observations, W is a matrix that averaged the methane field, c, and e are normal errors. The process level of our model is c = BX + y, where c is again the methane field, X is a data matrix of latitudes and longitudes with B its coefficients, and y a Gaussian process. Note that in the figure below we do not simply Krig the TROPOMI observations assuming they are points, but we rather take into account the size of the TROPOMI "pixel" projected onto the earth's surface.

<img src="https://wsdaniels.github.io/images/pixels_and_preds.png">

This project also involves ground level continuous monitoring data. I put together an AWS-based database to recieve these data in real time and store them in an easily accessible manner. We have performed an initial exploratory analysis of these data. Shown below is the VOC time series during a known leak event. Highlighted in color are times when the wind was blowing from the leak to the monitoring unit. The overlap between the west (yellow) unit and the wind is the basis of a source localization algorithm that we are currently developing.

<img src="https://wsdaniels.github.io/images/continuous_monitoring_wind.png">


Modeling Atmospheric Carbon Monoxide
------
Check back soon for a project description!

<img src="https://wsdaniels.github.io/images/co_modeling.png">

Verifying an ELVES Simulation using a Data Set of Observed ELVES
------
Check back soon for a project description!
