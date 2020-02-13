# Introduction to Trading, Machine Learning and GCP

--------------------------
* [Course 1](#Course_1)
* [Course 2](#Course_2)
* [Course 3](#Course_3)
* [Course 4](#Course_4)





--------------------------

## Course_1

* Cointegration indicates that the difference between the means of two price series is stationary (reverts to a long-term mean). A cointegrated series series can also be correlated but this is not required. 

* Correlation indicates that a price series has some relationship with another price series. This relationship can be very strong in the case of perfect positive (+1) or negative (-1) correlation or non-existent in the case of zero correlation.


## Course_2

* Need to run those script with GCP credential cannot run on local
* data: https://github.com/GoogleCloudPlatform/training-data-analyst ->  training-data-analyst > courses > ai-for-finance > solution > aapl_regression_scikit_learn.ipynb


## Course_3 Time series

* How to convert a trendy data to stationary data? Difference it or De-Mean it.
* Stationary: the statistical structure of the series is independent of time
* AR (Auto Regressive): goal is to find the correct time lag that best captures the order of such an AR process. this is not a one step procedure but is an iterative process
* MA (Moving Average): don't take previous y values as inputs, but rather take the previous error terms (actual - predicted y values based on MA model)
* ARIMA: (1,2,3) meaning one lagged data value (AR), 3 lagged error terms (MA) and is differenced twice (I: integrated or stationary)
* ARIMA (p,d,q) -> high p: market has high memory; low p: the past has the low impact for the future; if p and q are zero your model is random walk