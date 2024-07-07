function [x,y] = Modified_Euler(h, a, b, func, y0)
% Solves ODE by Modified Euler's method

func = str2func(func);

n = (b-a)/h; % Interval length
x = a:h:b;
y = [y0, zeros(1, length(x))-1];

for i = 1:n
    
    % Initial guess for y(i+1) using Euler's method
    y(i+1) = y(i) + h*func(x(i), y(i));
    func0 = func(x(i), y(i));
    
    for j = 1:10
        % Updating y(i+1) using previous y(i+1) values
        y(i+1) = y(i) + (h/2)*(func0 + func(x(i+1), y(i+1)));
    end

end
y = y(1:end-1);
end




