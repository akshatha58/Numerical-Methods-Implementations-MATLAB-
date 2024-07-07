function cubic = find_cubic(a, b, c, d, x, day)
% Finds the natural cubic interpolating polynomial value at the value x

cubic = a + b*(x - day) + c*(x - day)^2 + d*(x - day)^3;


end


