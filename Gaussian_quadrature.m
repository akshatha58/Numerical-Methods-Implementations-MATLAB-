function integral = Gaussian_quadrature(func, points, interval)
% Finds the approximate integral of the function given the degree and the
% number of points (Define function func first)

degree = 2*points - 1;
a = interval(1);
b = interval(2);
syms x

% Find the nth legendre polynomial
lgn_poly = legendre(points, x);

% Find positive roots by solving nth legendre polynomial
subint = 2/points;

pos_roots = node_eval(lgn_poly, subint);
pos_roots = unique(pos_roots);

% By symmetry of legendre polynomial about 0, we can calculate the negative roots
nodes = [-sort(pos_roots,"descend"), pos_roots];

% Solve system of equations pertaining to nodes to find C
C = solve_nl(degree, nodes);


% Interval change
if interval(1) ~= -1 || interval(2) ~= 1
    func_term = @(x) 0.5*((b-a)*x + a+b);
    integral = 0;
    for i = 1:length(C)
        integral = integral + 0.5*(b-a)*C(i)*func(func_term(nodes(i)));
    end

elseif interval(1) == -1 && interval(2) == 1
    integral = 0;
    for i = 1:length(C)
        integral = integral + C(i)*func(nodes(i));
    end
    
end

end