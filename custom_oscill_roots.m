% Custom numerical method to solve for multiple roots of highly oscillating
% functions
% Before implementing, define function in "f_oscill" and change omega and
% tolerance parameters accordingly

clc
clear all

% Define function parameters
format long

tol = 10^(-6);
actual_roots = [];
iters = [];
omega = 30*2.718; % Of the oscillatory function

% Derive interval width that is half of the time period of the oscillation, 
% to capture a maximum and a minimum at the interval, so that the root
% would lie somewhere in between

subint = (2*pi)/(omega*2); 
int_spacings = 0:subint:1;

for int = 1:length(int_spacings)-1
    a = int_spacings(int);
    b = int_spacings(int+1);
    
    mid = a + (b-a)/2;
    [root, iterations, rel_error_muller] = Muller(a, mid, b, tol,"f_oscill"); % 140, 5.6
    
    % Trial methods for comparison % total number of iterations, avg
    % iterations per subinterval

    %[root, iterations, rel_error] = Bisection(a, b, tol, "f_oscill"); % 430, 17
    %[root, iterations, rel_error_secant] = Secant(a, b, tol, "f_oscill"); % 155, 6.2

    actual_roots(int) = root;
    iters(int) = iterations;
end

actual_roots
length(actual_roots)
sum(iters)
mean(iters)
