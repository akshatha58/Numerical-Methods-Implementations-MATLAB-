function [root, iter_secant, rel_error_secant] = Secant(a, b, tol, func)
% Implementation of the secant method
% Inputs: Lower limit, upper limit, tolerance and function
% Outputs: final root, iterations and relative error

iter_secant = 0;
rel_error_secant = 1;
func = str2func(func);

% Secant method
while abs(rel_error_secant(end)) > tol
    iter_secant = iter_secant + 1;
    root = (a*func(b) - b*func(a))/(func(b) - func(a));
    rel_error_secant(iter_secant) = (root - b)/root;
    b = a;
    a = root;
end
end