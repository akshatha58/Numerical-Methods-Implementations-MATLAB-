function [final_root, iterations, rel_error] = Bisection(a, b, tol, func)
% Bisection method implementation
% Inputs: Lower limit, upper limit, tolerance and function
% Outputs: final root, iterations and relative error

rel_error = 1;
root = 1;
iterations = 0;

% Main logic of bisection method
while abs(rel_error) > tol
    iterations = iterations + 1;
    mid = a + (b-a)/2;

    if signum(func, a)*signum(func, mid) < 0
        b = mid;
    elseif signum(func, mid)*signum(func, b) < 0
        a = mid;
    end

    root = [root, mid];
    rel_error = (root(end) - root(end-1))/root(end);
        
end
final_root = root(end);
end