function [du] = rocketSimODE_Real(t,y0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global Mo g0 drag0 beta0 thrust0 r0;

m = valueAt(t, 'mass'); %kg total weight
drag = drag0;
thrust = valueAt(t, 'thrust');


du=zeros(4,1);

du(1) = y0(2); %intial x velocity -> x position
du(3) = y0(4); %intial y velocity -> y position
%beta = asind(du(1)/(sqrt(du(1)^2 + du(3)^2)));
beta = asind(y0(2)/(sqrt(y0(2)^2 + y0(4)^2)));
g = g0*((r0/(r0+du(3)))^2);

%drag calulcation
area_ref = 0.196; %m^2
rho = 0;
%rho = f(atl)
%temp = f(altitude) du(3)?
%velVec = sqrt(y0(2)^2+y0(4)^2);
%valueOfMach(velVec, temp);
%Cd = f(Mach);
%drag = 0.5*rho*Cd*velVec^2*area_ref;

fprintf('t: %2.1f   du(3): %2.1f   g: %2.4f   beta: %2.3f   rho: %1.4f\n', t, du(3), g, beta, rho);

du(2) = (thrust*sind(beta))/m - (drag*sind(beta))/m; %x-velocity
du(4) = (thrust*cosd(beta))/m - (drag*cosd(beta))/m - g; %y-velocity

end

