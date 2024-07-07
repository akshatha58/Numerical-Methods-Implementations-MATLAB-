function [root, relative_error, iterations] = modified_Newton(func, dfunc,ddfunc, x0, tol)
% Finds out root of function using modified Newton's method
% Inputs: function, its derivative and double derivative (str), initial
% guess and tolerance
% Outputs: roots, relative error and number of iterations taken

format long
root = 0.0;
iterations = 0;
relative_error = 1;

dfunc = str2func(dfunc);
ddfunc = str2func(ddfunc);

while abs(relative_error(end)) > tol
    iterations = iterations + 1;
    
    mu = func(x0)/dfunc(x0);
    dmu = 1 - (func(x0)*ddfunc(x0) / (dfunc(x0))^2);

    root = x0 - (mu / dmu);
    relative_error(iterations) = (root - x0)/root;
    x0 = root;
end

end