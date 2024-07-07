function x = backward_sub(R, b)
% Does a backward substitution to solve Rx = Q'b (Here, Q'b is 
% represented by b)

n = size(b);

b(end) = b(end)/R(end, end);

for i = n - 1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + b(j)*R(i,j);
    end

    b(i) = (1/R(i,i))*(b(i) - sum);

end

x = b;
end