function [x,y] = Euler(h, a, b, func, y0)
% Solves ODE by Euler's method

func = str2func(func);

n = (b-a)/h; % Interval length
x = a:h:b;
y = [y0, zeros(1, length(x))-1];

% Main iteration
for i = 1:n
    y(i+1) = y(i) + h*func(x(i), y(i));
end

y = y(1:end-1);


end