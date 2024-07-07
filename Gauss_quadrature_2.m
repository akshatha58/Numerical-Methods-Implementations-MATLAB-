function integral = Gauss_quadrature_2(func, interval)
% Computes integral according to the nodes and c values of n=2 gaussian
% quadrature
C = [1,1];
x = [-1/sqrt(3), 1/sqrt(3)];

a = interval(1);
b = interval(2);

% Change interval to [-1,1]
if interval(1) ~= -1 || interval(2) ~= 1
    func_term = @(x) 0.5*((b-a)*x + a+b);
    integral = 0;
    for i = 1:length(C)
        integral = integral + 0.5*(b-a)*C(i)*func(func_term(x(i)));
    end
end
end