function [Poly] = generate_poly(theta)
% Generates a polynomial using parameter values
syms x
poly = 0;

for T = 1:length(theta)
    poly = poly + theta(T)*x^(T-1);
  
end
poly
Poly = matlabFunction(poly);
end