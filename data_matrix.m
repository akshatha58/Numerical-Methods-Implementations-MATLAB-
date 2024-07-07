function X = data_matrix(x_dat, degree)
% Generate X data matrix that is populated based on 'degree'
% number of normal equations wrt parameters to be fitted

dummy_mat = [ones(length(x_dat), 1)];
x_dat = x_dat';

for k = 1:2*degree
    dummy_mat = [dummy_mat, x_dat.^k];
end

sum_data = sum(dummy_mat);

j = 1;
for i = 1:degree + 1
    X(:,i) = sum_data(j:j+degree)';
    j = j+1;
end

end