function trpz = trapezoidal(h, x_int, sum_t, f)
% Performs numerical integration according to trapezoidal rule
if length(x_int) > 2
    for j = 2:length(x_int)-1
        sum_t = sum_t + 2*f(x_int(j));
    end
end

trpz = (h/2)*sum_t;
end