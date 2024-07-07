function y = RK4(x, yt, h, func)
% Finds RK coefficients k1, k2, k3, k4 and solves for y(j+1)

func = str2func(func);

k1 = h*func(x, yt);
k2 = h*func((x + (h/2)), (yt + (k1/2)));
k3 = h*func((x + (h/2)), (yt + (k2/2)));
k4 = h*func((x + (h)), (yt + (k3)));

y = yt + (1/6)*(k1 + 2*k2 + 2*k3 + k4);

end