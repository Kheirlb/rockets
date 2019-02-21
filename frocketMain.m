%initial condition
global F r b m0 g0 R
F = 48000;
m0 = 2200;
r = 0.8;
g0 = 9.81;
b = 60;
R = 6.4*10^6;
%x0=0;
%x0=0
%v0=0;
tspan=[(0:100)];
[T,X]=ode45(@frocket, tspan, [0 0]);
% disp(T)
% disp(X)
plot (T,X);
grid on
xlabel('Time')
ylabel('Velocity')