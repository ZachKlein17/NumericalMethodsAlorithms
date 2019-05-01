function [root,fx,ea,iter] = falsePosition (func,xl,xu,es,maxiter)
% This is a user defined function that takes up to 5 inputs and delievers 4
% outputs regarding the root of a function
% The code that follows uses false position as a way of estimating the root
% of a function given the 5 inputs
% The variables are as follows:

%   func - user defined function
%   xl - user defined lower guess 
%   xu - user defined upper guess
%   es - desired relative error (default of 0.0001%)
%   maxiter - Number of iterations desired (default of 200)

%   root - estimate of root location
%   fx - function evaluated at the root location
%   ea - approximate relative error (%)
%   iter - Number of iterations performed

% Set defaults or display error based on inputs
if nargin == 4
    maxiter = 200;
elseif nargin == 3
    es = 0.0001;
    maxiter = 200;
elseif nargin < 2
    error('At Least 3 Input Arguments Are Required')
end

% Check that bounds have opposite signs
if func(xl)*func(xu) > 0
    error('Upper and Lower Bounds Must Have Opposite Signs')
end
% Check that upper bound is greater than lower bound
if xu < xl
    error('Upper Bound Must Be Greater Than Lower Bound')
end

iter = 1;
root = xl;
ea = 1;
while ea > es && iter < maxiter
    % use false position equation to solve for guess at root
    root_previous = root;
    root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    ea = abs(((root-root_previous)/root)*100);
    % check if guess is right, otherwise set new bound
    if sign(func(root)) == sign(func(xu))
        xu = root;
    else
        xl = root;
    end
    iter = iter+1;
    fx = func(root);
end