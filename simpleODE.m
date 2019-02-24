function dt = simpleODE(t,y)

dt = zeros(2,1);
dt(1) = 2*t; %velocity
dt(2) = 2;   %acceleration
fprintf("\nt: %2.1f  y: %2.1f  dydt: %2.1f  dvdt: %2.1f\n", t, y, dt(1), dt(2));
% the numerical integrator will update y with the answer

end

