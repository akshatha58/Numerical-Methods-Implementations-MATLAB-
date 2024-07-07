function [u_rk, v_rk] = shoot(a, b, alpha, N)
% Solves boundary value problem using Shooting technique

h = (b-a)/N;

% Initial conditions, y1 = -y'' + p(x)y' + q(x) + r(x) = 0
u(1) = alpha;
u(2) = 0;

% Initial conditions, y2 = -y'' + p(x)y' + q(x) = 0
v(1) = 0;
v(2) = 1;

% Solve for y1 and y2 IVPs using RK4 method

u_rk = rungekutta(h, a, b, u, 1);
v_rk = rungekutta(h, a, b, v, 0);
