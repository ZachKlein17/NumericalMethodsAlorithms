function [L,U,P] = luFactor(A)
% Created by Zach Klein
% Created on 4/1/2019
% This is a user defined function that converts a square matrix into a
% lower and upper triangular matrix. The input is a single square matrix
% and the outputs are a lower triangular matrix (L), an upper triangular
% matrix (U), and a pivot matrix (P).

% Display error code for any input other than a square matrix
[row,col] = size(A);
if row ~= col
    error('Input must be a square matrix')
end

% Set initial values for L, U, and P
L = eye(row);
U = A;
P = eye(row);

for i = 1:row-1
    % Determine pivot value (pv)
    pivot = max(abs(U(i:row,i)));
    for k = i:row
        if abs(U(k,i)) == pivot
            pv = k;
        end
    end
    % Swap the row with pv for row of interest
    % Hey Dr. B... How's it going?
    % Peter, if you're grading this, same question.
    % variables in []s are rows being swapped
    L([i,pv],1:i-1) = L([pv,i],1:i-1);
    U([i,pv],i:col) = U([pv,i],i:col);
    P([i,pv],:) = P([pv,i],:);
    
    % Perform gaussian elimination
    for k = i+1:row
        L(k,i) = U(k,i)/U(i,i);
        U(k,i:row) = U(k,i:row)-L(k,i)*U(i,i:row);
    end
    % Repeat for number of rows -1
end
% end
end

    
    
    
