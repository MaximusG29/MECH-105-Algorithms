# Linear Regression Algorithm
---
## linearRegression(x,y) -  Computes the linear regression of a data set

## Inputs:
* x: x-values for our data set
* y: y-values for our data set

## Outputs:
* fX: x-values with outliers removed
* fY: y-values with outliers removed
* slope: slope from the linear regression y = mx+b
* intercept: intercept from the linear regression y= mx+b
* Rsquared: R^2 value or coefficient of determination
---
## EX:
x = [1 2 3 4 5];

y = [4 15 18 29 59];

[fX, fY, slope, intercept, Rsquared] = linearRegression(x,y);
