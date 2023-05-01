function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

%checks to make sure the matrix is square
[r, c] = size(A);
if r ~= c
    error('Matrix must be square');
elseif r <= 1 
    error('Matrix must be larger than 1');
end
%sets up initial identity matrix and L matrix
P = eye(r);
L = P;

for i = 1:r-1 %column loop
    %pivoting
    [~, maxIndex] = max(abs(A(i:r, i))); %finds the index of the row with the largest magnitude
    maxIndex = maxIndex + i - 1;
    if maxIndex ~= i %if it isn't in the correct row, switch
        maxRow = A(maxIndex, :);
        A(maxIndex, :) = A(i, :);
        A(i, :) = maxRow;
        %does the same opperation to the P matrix
        maxRowP = P(maxIndex, :);
        P(maxIndex, :) = P(i,:);
        P(i, :) = maxRowP;
        %pivots the L matrix if need be
        if i > 1
        maxRowL = L(maxIndex, 1:i-1); 
        L(maxIndex, 1:i-1) = L(i, 1:i-1);
        L(i, 1:i-1) = maxRowL;
        end
    end

    for j = i+1:r %row loop
        %gets multiplier
        multiplier = A(j, i) / A(i, i);
        %puts that shit in the L matrix
        L(j, i) = multiplier;
        %multiplication and subtraction
        A(j, :) = A(j, :) - multiplier*A(i, :);
    end
end
U = A;
end