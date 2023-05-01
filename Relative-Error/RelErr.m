function [err] = RelErr(true, appx)
%RelErr(true, appx) - Takes in a scalar or array of values to calcualte the true
%relative error or approximate relative error
%Inputs:
%   true: scalar or array of the 'true' or 'new' value depending on if you
%   are calcualting true or approximate relative error
%   appx: scalar or array of the 'approximate' or 'old value depending on
%   if you are calculating true or approximate relative error (note: if
%   using arrays, 'true' and 'appx' must be the same size)
%Outputs:
%   err: a scalar or array of the percent relative error

err = abs((true-appx)./true)*100;
end