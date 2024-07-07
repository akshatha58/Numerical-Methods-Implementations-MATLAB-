function [xsol,ysol] = finite_diff(ain, bin, alpha, beta, N)
% Solves given differential equation using finite difference approach
% Algorithm 11.3, Burden & Faires

p = @(x) (2*x/(1+x^2));
q = @(x) (-2/(1+x^2));
r = @(x) 1;

% Setting step size and x value
h = (bin-ain)/N;
x = ain+h;

% Initial values of a, b, d
a(1) = 2 + h^2*q(x);
b(1) = -1 + (h/2)*p(x);
d(1) = -h^2*r(x) + (1+(h/2)*p(x))*alpha;

% Intermediate values of a, b, d
for i = 2:N-1
    x = ain + i*h;
    a(i) = 2 + h^2*q(x);
    b(i) = -1+(h/2)*p(x);
    c(i) = -1-(h/2)*p(x);
    d(i) = -h^2*r(x);
end

% Final values of a, b, d
x = bin-h;
a(N) = 2+h^2*q(x);
c(N) = -1 -(h/2)*p(x);
d(N) = -h^2*r(x) + (1-(h/2)*p(x))*beta;

% Solving tridiagonal linear system 
l(1) = a(1);
u(1) = b(1)/a(1);
z(1) = d(1)/l(1);

for i = 2:N-1
    l(i) = a(i) - c(i)*u(i-1);
    u(i) = b(i)/l(i);
    z(i) = (d(i) - c(i)*z(i-1))/l(i);
end

l(N) = a(N) - c(N)*u(N-1);
z(N) = (d(N) - c(N)*z(N-1))/l(N);

y(1) = alpha;
y(N) = z(N);
y(N+1) = beta;

for i = N-1:-1:1
    y(i) = z(i) - u(i)*y(i+1);
end

for i = 0:N+1
    x = ain+i*h;
end

xsol = ain:h:bin-h;
ysol = y(1:N);




end