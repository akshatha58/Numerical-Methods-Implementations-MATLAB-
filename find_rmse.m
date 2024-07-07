function  RMSE = find_rmse(actual, predicted)
% Finds the root mean squared error between the actual and predicted data
% Inputs: actual and predicted data vectors
% Output: RMSE

RMSE = 0;

for i = 1:length(actual)
    RMSE = RMSE + (predicted(i) - actual(i))^2;

end
RMSE = sqrt(RMSE/length(actual));
end