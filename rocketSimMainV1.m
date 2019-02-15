% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

%% Given
angle = 1; %deg
Mo = 750; %kg
Ml = 10;
Ms = 240;
Mb = Ml + Ms;
Mp = Mo - Mb;
burntime = 60; %sec
thrust = 20000; %N
frontArea = 0.196; %m^2
g = 9.81;

fileName = 'rocketSimExcel.xlsx';
%col1 = Mach 0.01 increments
%col2 = Cd Power-off
%col3 = Cd Power-on
CdvsMach = xlsread(fileName, 1, 'A2:C2501');
%col1 = Altitude [m]
%col2 = Temp [K]
%col3 = Density [kg/m^3]
atmosphereData = xlsread(fileName, 2, 'A3:C1203');

%% Calcs
tStep = 0.1;%adjust
tF = 100; %time final adjust
tTotal = 1:tStep:tF;
tPower = 1:tStep:burntime;

mdot = Mp/burntime; 
isp = thrust/(mdot*g);
ueq = isp*g;
R = Mo/Mb;
deltaU = ueq*log(R); 
count = 1;
hPower = zeros(1, size(tPower, 2));

for t = tPower 
    hPower(count) = -ueq*t*((log(R))/(R-1)) + ueq*t - 0.5*g*(t^2);
    count = count + 1;
end
hB = hPower(burntime);
plot(tPower, hPower);

%% Print Stuff
fprintf("Total Weight %2.0f pounds\n", convmass(Mo,'kg','lbm'));
fprintf("Thrust: %2.0f pounds\n", convforce(thrust,'N','lbf'));
fprintf("T/W: %2.3f \n", thrust/(Mo*9.81));
fprintf("Burnout Altitude: %2.0f meters\n", hB); 
fprintf("Burnout Altitude: %2.0f feet\n", convlength(hB,'m','ft')); 


