function lgn_poly = legendre(n, x)
% Returns the n-th Legendre polynomial

if mod(n, 2) == 0
    M = n/2;
else
    M = (n-1)/2;
end

poly_n = 0*x;
for m = 0:M
    poly_n = poly_n + ((-1)^m * factorial(2*n - 2*m)*x^(n-2*m))/(2^n*factorial(m)*factorial(n-m)*factorial(n-2*m));

end
lgn_poly = matlabFunction(poly_n);
end