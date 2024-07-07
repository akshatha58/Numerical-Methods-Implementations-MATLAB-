function [x] = find_coefficients(x0, x1, x2, func)
% For three guess values in every iteration, this function finds out the
% coefficients of the parabola (P(x) = a(x-x2)^2 + b(x-x2) + c) that passes

A = [(x0 - x2)^2, (x0 - x2), 1;
     (x1 - x2)^2, (x1 - x2), 1;
      0,            0,       1];
func = str2func(func);
b = [func(x0); func(x1); func(x2)];

x = A\b;
end