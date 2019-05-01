function [I] = Simpson(x,y)
% Created by Zach Klein 
% on April 12th, 2019

% This is a user defined function that uses to user defined vectors
% representing the x and y values of tabular data.
% This function is used to numerically evaluate an integral for the given
% values of x and y

% x: vector of values corresponding to the independent variable
% y: vector of values corresponding to the dependent variable

% Error checking
if nargin<2
    error('Invalid number of inputs')
end
% Check that inputs are vectors
[m_x,n_x] = size(x);
[m_y,n_y] = size(y);
if m_x > 1 && n_x > 1
    error('Input "x" must be a vector.')
elseif m_y > 1 && n_y > 1
    error('Input "y" must be a vector.')
end
% If an input is a column vector, convert to row vector
if m_x > 1
    x = x';
end
if m_y > 1
    y = y';
end
% Check that vectors are equal length and greater than 3 
if length(x) ~= length(y)
    error('Both inputs must be vectors of equal length.')
elseif length(x) < 2 || length(y) < 2
    error('Both inputs must be vectors with at least 2 elements.')
end
% Check that x is eqaully spaced
x_spacing = diff(x);
if range(x_spacing) > 0
    error('"x" must be a vector with equally spaced elements.')
end
% Check the number of intervals and inform user if trapezoidal rule is
% needed for the last interval
space = x_spacing(1);
if length(x_spacing) == 1
    disp('Simpsons rule will not be used. Only 1 itereation of the trapezoidal rule will be used.')
    I = space*((y(1)+y(2))/2);
elseif rem(length(x_spacing),2) == 1
    disp('The trapezoidal rule will be used for the final interval.')
    
    I_s = (space)*((y(1)+4*(sum(y(2:2:end-2)))+2*(sum(y(3:2:end-3)))+y(end-1)))/(3);
    I = I_s + (space)*((y(end-1)+y(end))/2);
    
else
    
    I = (space)*((y(1)+4*(sum(y(2:2:end-1)))+2*(sum(y(3:2:end-2)))+y(end)))/(3);

end

end