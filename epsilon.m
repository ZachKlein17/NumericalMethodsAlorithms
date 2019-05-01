%% Homework #7 Question 1
% Zach Klein
clear
clc

E = 1;
while(1)
    if 1+E <= 1
        E = 2*E;
        break
    else
        E = E/2;
    end
end
disp(E)
