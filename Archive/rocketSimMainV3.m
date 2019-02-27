%% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

% Used this for help:
% https://mintoc.de/index.php/Gravity_Turn_Maneuver

clc; clear;

%% Given
global Mo g0 drag0 beta0 thrust0 burntime m_dot r0;
burntime = 60;

% Mass Stuff
Mo = 750; %kg total weight
Ml = 10; %payload mass
Ms = 240; %strucure mass
Mb = Ml + Ms; %mass at burnout (structure and payload)
Mp = Mo - Mb; %mass of propellant

%% Excel Data
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

%% Initial Values
g0 = 9.81;
r0 = 6.3781*10^6; %raduis of earth
drag0 = 5000; %tempory value
beta0 = 1; %deg launch angle
initialThrust = 20000; %N
thrust0 = initialThrust;
temp0 = 288.15; %kelvin

%% Some Initial Calcs
m_dot = Mp/burntime; %mass flow rate
isp = thrust0/(m_dot*g0); %isp
ueq = isp*g0; %ueq
R = Mo/Mb;
deltaU = ueq*log(R); 


tStep = 1;
tFinal = 300;
tSpan = 1:tStep:tFinal;

%densityNew = interp1(atmosphereData(:,1),)

%% Iterate 1 Second and Grab Values
accel_1 = initialThrust/Mo;
uy_1 = cosd(beta0)*accel_1;
ux_1 = sind(beta0)*accel_1;

z1o=0;  % x-(initial x position)
z2o=ux_1;  % x-(initial x velocity)
z3o=0;  % y-(initial y position)
z4o=uy_1;  % y-(initial y velocity)
y=[z1o;z2o;z3o;z4o];

options = odeset('Events',@yzero);
%fprintf("\n------- Real --------\n");
[t, x, te, ye, ie]=ode45(@rocketSimODE_Real,tSpan,y, options);
%fprintf("\n------- Ideal --------\n");
[t2, x2, te2, ye2, ie2]=ode45(@rocketSimODE_Ideal,tSpan,y, options);

%-- Plots --

labelIdeal = 'Ideal';
labelComplex = 'Real';

firstPlot = subplot(2,1,1);
plot(t,x(:,3),'+r',t2,x2(:,3),'k')
title('Altitude')
xlabel('Time [sec]');
ylabel('Altitude [m]');
legend(labelComplex,labelIdeal)
firstPlot.YAxis.TickLabelFormat='%.f';
firstPlot.YAxis.Exponent = 0;

firstPlot(2) = subplot(2,1,2);
plot(t,x(:,1),'+r',t2,x2(:,1),'k')
title('Downrange')
xlabel('Time [sec]');
ylabel('Horizontal Distance [m]');
legend(labelComplex,labelIdeal)
firstPlot(2).YAxis.TickLabelFormat='%.f';
firstPlot(2).YAxis.Exponent = 0;

maxAltReal = max(x(:,3));
maxVertVelReal = max(x(:,4));
maxHorzVelReal = max(x(:,2));
fprintf('Max Altitude  (Real): %4.1f [m]\n',maxAltReal);
fprintf('Max Vert Vel  (Real): %4.1f\n',maxVertVelReal);
fprintf('Max Horz Vel  (Real): %4.1f\n',maxHorzVelReal);

maxAltIdeal = max(x2(:,3));
maxVertVelIdeal = max(x2(:,4));
maxHorzVelIdeal = max(x2(:,2));
fprintf('\nMax Altitude  (Ideal): %4.1f [m]\n',maxAltIdeal);
fprintf('Max Vert Vel  (Ideal): %4.1f\n',maxVertVelIdeal);
fprintf('Max Horz Vel  (Ideal): %4.1f\n',maxHorzVelIdeal);



