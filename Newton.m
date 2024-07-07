function [root, relative_error, iterations] = Newton(func, dfunc, x0, tol)
% Finds out root of function using Newton's method
% Inputs: function and its derivative (str), initial guess and tolerance
% Outputs: root, relative error and number of iterations taken

format long
root = 0.0;
iterations = 0;
relative_error = 1;
dfunc = str2func(dfunc);
while abs(relative_error(end)) > tol
    iterations = iterations + 1;

    root = x0 - func(x0)/(dfunc(x0));   
    relative_error(iterations) = (root - x0)/root;
    x0 = root;
end
end

