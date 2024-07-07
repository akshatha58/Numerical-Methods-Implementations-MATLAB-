function intval = romberg(int_val)
% Uses Romberg extrapolation on the results of each iteration of
% integration
intval = [];
for j = 1:length(int_val) - 1
    extrp = (4*int_val(j+1) - int_val(j))/3;
    intval = [intval, extrp];
end
end