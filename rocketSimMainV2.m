%% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

% Used this for help:
% https://mintoc.de/index.php/Gravity_Turn_Maneuver

clc; clear;

%% Given
angle = 1; %deg
Mo = 750; %kg
Ml = 10;
Ms = 240;
Mb = Ml + Ms;
Mp = Mo - Mb;
tb = 60; %sec
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

%% Pre-Calcs
tStep = 0.1;%adjust
tF = 100; %time final adjust
tTotal = 1:tStep:tF; %total time

tPower = 1:tStep:tb;
tCoast = (tb+tStep):tStep:tF;

mdot = Mp/tb; %mass flow rate
isp = thrust/(mdot*g); %isp
ueq = isp*g; %ueq
R = Mo/Mb;
deltaU = ueq*log(R); 
g0 = 9.81;
y0 = [0 0];
[ans1, y] = ode45('rocketSimODE', tTotal, y0);

%count = 1;
%hPower = zeros(1, size(tPower, 2));

%ode: v, h, beta, theta


%% Print Stuff
fprintf("Total Weight %2.0f pounds\n", convmass(Mo,'kg','lbm'));
fprintf("Thrust: %2.0f pounds\n", convforce(thrust,'N','lbf'));
fprintf("T/W: %2.3f \n", thrust/(Mo*9.81));
%fprintf("Burnout Altitude: %2.0f meters\n", hB); 
%fprintf("Burnout Altitude: %2.0f feet\n", convlength(hB,'m','ft')); 


