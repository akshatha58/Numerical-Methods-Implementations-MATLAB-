function polyH = Hermite_polynomial(diagval, z, x)
% Returns the hermite interpolating polynomial for the given set of Q diag
% and z values

polyH = diagval(1);
for i = 2:length(z)
    prod = 1;
    for j = 1:i-1
        prod = prod*(x-z(j));
    end
    polyH = polyH + prod*diagval(i);
end
end