function yjsol = RK4_multieq(a, b, numeq, h, initial)
% Solves RK4 method for system of ODEs
n = (b-a)/h;
t = a;

for i = 1:numeq
    % Initialise values
    yj(i) = initial(i);
end

yjsol = [t, yj];

for i = 1:n
    % Find k1, k2, k3, k4 for each equation
    for j = 1:numeq
        k(1, j) = h*odefunc(t,yj, j);
    end

    for j = 1:numeq
        k(2, j) = h*odefunc(t+0.5*h, yj+0.5*k(1), j);
    end

    for j = 1:numeq
        k(3, j) = h*odefunc(t+0.5*h, yj+0.5*k(2), j);
    end

    for j = 1:numeq
        k(4, j) = h*odefunc(t+h, yj+k(3), j);
    end

    for j = 1:numeq
        kf = (1/6)*(k(1,j) + 2*(k(2,j) + k(3,j)) + k(4,j));
        yj(j) = yj(j) + kf;
    end
    t = a + i*h;
    yjsol = [yjsol; [t,yj]];

end

end