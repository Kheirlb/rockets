function [du] = rocketSimODE_Ideal(t,y0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global Mo g0 drag0 beta0 thrust0 r0;

%m = Mo; %kg total weight
m = valueAt(t, 'mass'); %kg total weight
g = g0*((r0/(r0+y0(3)))^2);
thrust = valueAt(t, 'thrust');

drag = 0;

du=zeros(4,1);

du(1) = y0(2);
du(3) = y0(4);
beta = asind(y0(2)/(sqrt(y0(2)^2 + y0(4)^2)));
%beta = 1;
%fprintf("Beta: %2.3f\n", beta);

du(4) = (thrust*cosd(beta))/m - (drag*cosd(beta))/m - g;
du(2) = (thrust*sind(beta))/m - (drag*sind(beta))/m;

end

