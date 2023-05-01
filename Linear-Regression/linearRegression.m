function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

%checks that x and y are the same size
if length(x) ~= length(y)
error("Arrays are not the same size!");
end

%sorts the data
[fY, sortOrder] = sort(y);
fX = x(sortOrder);

%removes outliers
%finds index of Q1 and Q3
Q1i = floor((length(fX)+1)/4); 
Q3i = floor((3*length(fX)+3)/4);
Q1 = fY(Q1i);
Q3 = fY(Q3i);
IQR = Q3 - Q1;
%sets the bounds to evaluate if something is an outlier
upperBound = Q3 + (1.5*IQR);
lowerBound = Q1 - (1.5*IQR);
indexToPurge = []; %this will collect what outliers need to be decimated
for i = 1:1:length(fY)

    if fY(i) > upperBound || fY(i) < lowerBound
        indexToPurge(length(indexToPurge) + 1) = i;
    end
end

fY(indexToPurge) = [];
fX(indexToPurge) = [];

%gives the values for the slope and intercept
slope = (length(fX)*sum(fX.*fY) - sum(fX)*sum(fY))/(length(fX)*sum(fX.^2)-(sum(fX))^2);
intercept = mean(fY) - slope*mean(fX);

%Gives the R^2 value
Rsquared = 1 - (sum((fY - (slope*fX + intercept)).^2))/(sum((fY - mean(fY)).^2));

end