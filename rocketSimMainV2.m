%% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

% Used this for help:
% https://mintoc.de/index.php/Gravity_Turn_Maneuver

clc; clear;

%% Given
beta0 = 1; %deg launch angle
Mo = 750; %kg total weight
Ml = 10; %payload mass
Ms = 240; %strucure mass
Mb = Ml + Ms; %mass at burnout (structure and payload)
Mp = Mo - Mb; %mass of propellant
tb = 60; %sec 
thrust = 20000; %N
frontArea = 0.196; %m^2

g0 = 9.81;
r0 = 6.3781*10^6; %raduis of earth
theta0 = 0; %angle from launch location

fprintf("Importing Data\n");
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

m_dot = Mp/tb; %mass flow rate
isp = thrust/(m_dot*g0); %isp
ueq = isp*g0; %ueq
R = Mo/Mb;
deltaU = ueq*log(R); 

%% ode
y0 = [0 0];
options = odeset('Events',@yzero);
%[ans1, y, te, ye, ie] = ode45('rocketSimODE', tPower, y0);

%count = 1;
%hPower = zeros(1, size(tPower, 2));

%ode: v, h, beta, theta


%% Print Stuff
fprintf("Total Weight %2.0f pounds\n", convmass(Mo,'kg','lbm'));
fprintf("Thrust: %2.0f pounds\n", convforce(thrust,'N','lbf'));
fprintf("T/W: %2.3f \n", thrust/(Mo*9.81));
%fprintf("Burnout Altitude: %2.0f meters\n", hB); 
%fprintf("Burnout Altitude: %2.0f feet\n", convlength(hB,'m','ft')); 


