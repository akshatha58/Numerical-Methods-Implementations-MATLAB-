function simps = simpson(h, x_int, sum_t, f)
% Performs numerical integration according to Simpson's one third rule

if length(x_int) > 2
    for j = 2:length(x_int)-1
        if mod(j,2) == 0
            sum_t = sum_t + 2*f(x_int(j));
            else
                sum_t = sum_t + 4*f(x_int(j));
        end
    end
end

simps = (h/3)*sum_t;
end



