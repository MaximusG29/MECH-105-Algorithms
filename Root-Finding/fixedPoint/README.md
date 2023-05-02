# Fixed Point Algorithm
---
## fixedPoint(func, xr, es, maxit) finds the root of a function  using fixed point iteration

## Inputs:
* func - the function being evaluated (must be set equal to the variable wanted)
* xr - the starting value
* es - the desired stopping criterion (defaults to 0.0001%)
* maxit - the maximum number of iterations to use (defaults to 200)

## Outputs:
* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - how many iterations were performed
---
## EX: 
func = @(x) x.^2 - 50;

xr = 6; 

[root, fx, ea, iter] = fixedPoint(func, xr);
