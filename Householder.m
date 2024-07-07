function [xsol] = Householder(A, b)
%  Does a Householder triangularisation to transform A to an upper 
% triangular matrix and b to Qtb

[m,n] = size(A);

for k = 1:n
    x = A(k:m, k);
    e1 = [1, zeros(1, m-k)]';
    vk = sign(x(1))*norm(x)*e1 + x;
    vk = vk/norm(vk);

    A(k:m, k:n) = A(k:m, k:n) - 2*(vk*vk')*A(k:m, k:n);
    b(k:m) = b(k:m) - 2*(vk*vk')*b(k:m);

end
   
   xsol = backward_sub(A(1:n, 1:n), b(1:n));
  
   
end