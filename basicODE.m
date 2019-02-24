%% ODE45: The Basics For Karl

tspan = 0:0.1:5;
y0pos = 0;
y0vel = 0;
y0 = [y0pos y0vel];
[t,y] = ode45(@simpleODE, tspan, y0);
plot(t,y,'-o');

function dt = simpleODE(t,y)

dt = zeros(2,1);
dt(1) = 2*t; %velocity
dt(2) = 2;   %acceleration
fprintf("\nt: %2.1f  pos-y(1): %2.1f  vel-y(2): %2.1f  dydt: %2.1f  dvdt: %2.1f\n", t, y(1), y(2), dt(1), dt(2));
% the numerical integrator will update y with the answer

end