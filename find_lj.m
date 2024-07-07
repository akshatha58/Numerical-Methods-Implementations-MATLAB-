function lj = find_lj(x_dat, y_dat, j, x)
% Finds the jth l value using Lagrange interpolation using existing x-y
% data
lj = 0*x + 1;
for i = 1:length(x_dat)
    if i ~= j
        lj = lj * (x - x_dat(i))/(x_dat(j) - x_dat(i));
    end
end
lj = lj*y_dat(j);
%disp(lj)
end