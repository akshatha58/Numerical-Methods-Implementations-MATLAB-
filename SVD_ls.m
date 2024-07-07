function x = SVD_ls(A, b)
% Does a least square approximation based on the SVD of A
[U,S,V] = svd(A);
w = [];
w = S\U'*b;
x = V*w;
end