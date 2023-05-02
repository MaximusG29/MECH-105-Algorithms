# False Position Algorithm
---
## falsePosition(func, xl, xu, es, maxit) - finds the root of a function using the false position method

## Inputs:
* func - the function being evaluated
* xl - the lower bound
* xu - the upper bound
* es - the desired stopping criterion (defaults to 0.0001%)
* maxit - the maximum number of iterations to use (defaults to 200)

## Outputs:
* root - the estimated root location
* fx - the function evaluated at the root location
* ea - the approximate relative error (%)
* iter - how many iterations were performed
---
## EX: 
func = @(x) x.2 - 50;

xl = 6: xu = 8:

[root, fx, ea, iter] = falsePosition(func, xl, xu);
