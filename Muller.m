function [root, iterations, rel_error_muller] = Muller(x0, x1, x2, tol, func)
% Muller's method implementation
% Inputs: first three initial guesses, tolerance, function
% Outputs: converged root, iterations, relative error

iterations = 0;
rel_error_muller = 1;

while abs(rel_error_muller(end)) > tol 
    iterations = iterations + 1;
    Coeff_vec = find_coefficients(x0, x1, x2, func);
    a = Coeff_vec(1);
    b = Coeff_vec(2);
    c = Coeff_vec(3);

    if b<0
        root = x2 - 2*c/(b - sqrt(b^2 - 4*a*c));
    else
        root = x2 - 2*c/(b + sqrt(b^2 - 4*a*c));
    end
        
    rel_error_muller(iterations) = (root - x1)/root; 
    x0 = x1;
    x1 = x2;
    x2 = root;
end

end