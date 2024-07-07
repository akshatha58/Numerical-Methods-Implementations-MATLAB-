function xsol = modified_GS(A, b)
% Implements modified Gram Schmidt Orthogonalisation of matrix A.
% Obtains QR decomposition of A and uses back substitution to find
% parameters xsol

[~,n] = size(A);


for j = 1:n
    v(:,j) = A(:,j);
end

for i = 1:n
    R(i,i) = norm(v(:,i));
    Q(:,i) = v(:,i)/R(i,i);

    for k = i+1:n
        R(i,k) = Q(:,i)'*v(:,k);
        v(:,k) = v(:,k) - R(i,k)*Q(:,i);

    end
 
end

xsol = backward_sub(R, (Q'*b));
end