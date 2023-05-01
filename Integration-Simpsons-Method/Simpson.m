function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%error checking and bullshit
    %did they input shit?
    if nargin ~=2
        error("Error: User must input 2 arrays");
    end
    %same length?
    if length(x) ~= length(y)
        error("Error: Arrays must be the same length");
    end
    %evenly spaced?
    spacing = x(2) - x(1); %sets up the spacing to maybe be used later? I haven't thought that far ahead yet
    for i = 2:1:length(x)
        if x(i) - x(i-1) ~= spacing
            error("Error: Independent variable must be evenly spaced");
        end
    end
    %trapezoidal rule n shit
    
    segments = length(x) - 1; %sets up 'n'
    I = 0; %sets up I

    if mod(segments, 2) ~=0 %if there are an odd amount of segments
        warning("Odd number of segments detected. Trapezoidal rule will be used on last segment");
        I = (y(length(y) - 1)+y(length(y)))*(spacing/2);%calculates the value of this last segment
        x(length(x)) = [];%purges those last values from the arrays
        y(length(y)) = [];
        segments = segments - 1; %adjusts segments to reflect change
    end

    %actually does the simpson shit
    if segments ~= 0 %doesn't do simpson if there was only 1 segment to begin with
        for i = 1:1:(segments/2) %loops through simpsons for the segments
        increase = 2*(i-1);
        simpVal = (spacing/3)*(y(1 + increase) + 4*y(2 + increase) + y(3 + increase));
        I = simpVal + I;

        end
    end
end