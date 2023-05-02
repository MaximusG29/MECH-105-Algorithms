function [root, fx, ea, iter] = fixedPoint(func, xr, es, maxit)
%fixedPoint(func, xr, es, maxit) finds the root of a function  using fixed point iteration
%Inputs:
%    func - the function being evaluated (must be set equal to the variable
%    wanted)
%    xr - the starting value
%    es - the desired relative error (should default to 0.0001%)
%    maxit - the maximum number of iterations to use (should default to 200)
%Outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

%nargin junk
if nargin < 2 %defaults maxit
     error('ERROR: 2 inputs required');
elseif nargin < 3 %defaults es
    es = 0.0001;
    maxit = 200;
elseif nargin < 4 %checks for valid inputs
   maxit = 200;
end

xrold = 0; %sets up the variable xrold as 0 so that the ea calculation works
iter = 1; %says that we are starting the iterations
while(1)%starts the loop
    %sets up the "xi+1"
    xr = func(xr);

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

        xrold = xr;
        iter = iter + 1;
   
end

end