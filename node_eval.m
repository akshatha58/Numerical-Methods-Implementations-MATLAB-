function actual_roots = node_eval(lgn_func, subint)
% Evaluates all the roots of the nth legendre polynomial

% Define function parameters

tol = 10^(-6);
actual_roots = [];
iters = [];

int_spacings = 0:subint:1;

for int = 1:length(int_spacings)-1
    a = int_spacings(int);
    b = int_spacings(int+1);
    
    mid = a + (b-a)/2;
    [root, iterations] = Muller(a, mid, b, tol,lgn_func);
    
    actual_roots(int) = root;
    iters(int) = iterations;
end


end