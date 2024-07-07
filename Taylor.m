function y = Taylor(x0,yin,h)
% Finds derivative of function (Approximation about point x) using Taylor
% series expansion of order 4

xhat = (x0-yin)/2;

% Taylor series expansion
y = yin + xhat*h + (0.5-xhat)*(h^2/2) + (-0.5+xhat)*(h^3/6) + (0.5 - xhat)*(h^4/24);
end