function b = myrobustfit(x,y)
% Adapted version of robustfit able to deal with large-valued inputs x.
% AE 2008-01-10

b = robustfit(x - x(1),y);
b(1) = b(1) - b(2) * x(1);
