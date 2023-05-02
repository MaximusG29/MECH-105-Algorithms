# Secant Modified Algorithm(s)
---
## secantModif(func, xr, pf, es, maxit) finds the root of a function using the modified secant method

## secantModif2(func, xr, pf, es, maxit) finds the root of a function using the modified secant method with Dr. B logic (used to settle an argument in class)

## Inputs:
* func - the function being evaluated
* xr - the starting value
* pf - the value of the perturbation fraction
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

xr = 6; pf = 0.0000001; 

[root, fx, ea, iter] = secantModif(func, xr, pf);
