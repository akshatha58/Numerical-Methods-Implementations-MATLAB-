function [a, b, c, d] = findspline(days, sample)
% Returns the coefficients of each natural cubic spline interpolating
% polynomial

points = length(days);
a = zeros(1, points-1);
b = zeros(1, points-1);
c = zeros(1, points-1);
d = zeros(1, points-1);

% Find coefficients aj first, out of sample data
for j = 1:points
    at(j) = sample(j);
end

for j = 1:points-1
    a(j) = at(j);
end

% Find error (difference between two days at which sampling is done)
for n = 1:points-1
    error(n) = days(n+1) - days(n);
end

% Solve tridiagonal linear system of equations  
for n = 2:points-1
    alpha(n) = (3/error(n))*(at(n+1)-at(n)) - (3/error(n-1))*(at(n) - at(n-1));
end

l(1) = 1;
mu(1) = 0;
z(1) = 0;

for n = 2:points -1
    l(n) = 2*(days(n+1) - days(n-1)) - error(n-1)*mu(n-1);
    mu(n) = error(n)/l(n);
    z(n) = (alpha(n) - error(n-1)*z(n-1))/l(n);
end

l(points) = 1;
z(points) = 0;
ct(points) = 0;

for j = points-1:-1:1
    ct(j) = z(j) - mu(j)*ct(j+1);
    b(j) = (at(j+1) - at(j))/error(j) - error(j)*(ct(j+1) + 2*ct(j))/3;
    d(j) = (ct(j+1) - ct(j))/(3*error(j));
end

c = ct(1:end-1);

end