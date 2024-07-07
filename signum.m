function result = signum(func, x)
% It applies the signum of the function : returns 1 if func(x) > 0, -1 if
% func(x) < 0, 0 if func(x) = 0
func = str2func(func);

if func(x) < 0
    result = -1;
elseif func(x) > 0
    result = 1;
else
    result = 0;
end