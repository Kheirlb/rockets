function [du] = rocketSimODEv2(t,y0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global Mo g0 drag0 beta0 thrust0;

m = Mo; %kg total weight
g = g0;
drag = 0;
thrust = valueAt(t, 'thrust');

%fprintf("ODE Function Run, t: %2.1f\n", t);

du=zeros(4,1);

du(1) = y0(2);
du(3) = y0(4);
beta = asind(du(1)/(sqrt(du(1)^2 + du(3)^2)));
%fprintf("Beta: %2.3f\n", beta);

du(4) = (thrust*cosd(beta))/m - (drag*cosd(beta))/m - g;
du(2) = (thrust*sind(beta))/m - (drag*sind(beta))/m;

end

