function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition(func, xl, xu, es, maxit) finds the root of a function using false position method
%Inputs:
%    func - the function being evaluated
%    xl - the lower guess
%    xu - the upper guess
%    es - the desired relative error (should default to 0.0001%)
%    maxit - the maximum number of iterations to use (should default to 200)
%Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

%nargin junk
if nargin < 3 %defaults maxit
     error('ERROR: 3 inputs required');
elseif nargin < 4 %defaults es
    es = 0.0001;
    maxit = 200;
elseif nargin < 5 %checks for valid inputs
   maxit = 200;
end
%makes sure the function is bracketed
if (func(xl)<0) == (func(xu) <0)
    error('ERROR: bound must bracket function');
end

xrold = 0; %sets up the variable xrold as 0 so that the ea calculation works
iter = 1; %says that we are starting the iterations
while(1)%starts the loop
    xr = xu - (func(xu)*(xl - xu))/(func(xl)-func(xu)); %sets your xr value
   
    if func(xr) == 0 %checks to see if solution is exact
        ea = 0;
        fx = func(xr);
        root = xr;
        break;
    end %does everything else
        
        ea = abs((xr - xrold)/xr)*100; %finds the approximate relative error
        if iter == maxit || ea < es %checks your stopping criteria
            root = xr;
            fx = func(xr);
            break;
        end
        %sets the new bounds
        if (func(xr) < 0) == (func(xu) < 0) %checks to see if the signs are the same
            xu = xr;
        else %if the signs weren't the same between xr and xu, xl is set to xr
            xl = xr;
        end

        xrold = xr;
        iter = iter + 1;
   
end

end