function [du] = rocketSimODE_Real(t,y)
% -> means "integrates or relates to"

%y(1) = x position
%y(2) = x velocity
%y(3) = y position
%y(4) = y velocity

%du(1) = x velocity     -> x position y(1)
%du(2) = x acceleration -> x velocity y(2)
%du(3) = y velocity     -> y position y(3)
%du(4) = y acceleration -> y velocity y(4)

%% Initial Values
global Mo g0 drag0 beta0 thrust0 r0;
m = valueAt(t, 'mass'); %kg total weight
%drag = drag0;
thrust = valueAt(t, 'thrust');
alt = y(3);

du=zeros(4,1);

du(1) = y(2); %x velocity -> x position y(1)
du(3) = y(4); %y velocity -> y position y(3)

%% Angle and Gravity Change 
beta = asind(y(2)/(sqrt(y(2)^2 + y(4)^2)));
g = g0*((r0/(r0+y(3)))^2);

%% Drag Calulcation Per Iteration
area_ref = 0.196; %m^2
rho = findrho(alt); %rho = f(atl)
temp = findTemp(alt);
velVec = sqrt(y(2)^2+y(4)^2);
Mach = valueOfMach(velVec, temp);
Cd = findCd(Mach);
drag = 0.5*rho*Cd*velVec^2*area_ref;

fprintf('t: %2.1f   du(3): %2.1f   y(3): %2.1f   rho: %2.4f   g: %2.4f   beta: %2.3f   rho: %1.4f\n', t, du(3), y(3), rho, g, beta, rho);
%fprintf('t: %2.1f \n',t);

%% Acceleration Changes
du(2) = (thrust*sind(beta))/m - (drag*sind(beta))/m;     %x-accel
du(4) = (thrust*cosd(beta))/m - (drag*cosd(beta))/m - g; %y-accel

end

