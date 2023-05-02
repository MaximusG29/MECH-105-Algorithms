# Newton Raphson Algorithm
---
## newtonRaphson(func, deriv, xr, es, maxit) finds the root of a function using Newton Raphson Method

## Inputs:
* func - the function being evaluated
* deriv - the derivative of the function being evaluated
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
deriv = @(x) 2*x;

xr = 6;

[root, fx, ea, iter] = newtonRaphson(func, deriv, xr);
