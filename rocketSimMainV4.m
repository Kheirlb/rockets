%% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

% Used this for help:
% https://mintoc.de/index.php/Gravity_Turn_Maneuver
% https://carlospereyradotus.wordpress.com/independent-projects/drag-simulation/

clc; clear;

%% Initial Variables
global Mo g0 drag0 beta0 thrust0 burntime m_dot r0 atmosphereData CdvsMach frontArea;

%% Choose Initial Conditions
rocketType = 1;
% 1 = HW2
% 2 = FAR/MARS
% 3 = GAH
% otherwise = LR101 Rocket

switch rocketType
    case 1
        %% Initial Values - HW2
        disp('HW2');
        beta0 = 1; %deg launch angle
        thrust0 = 20000; %Newtons
        burntime = 60; %seconds
        frontArea = 0.196; %m^2
        Mo = 750; %kg total weight
        Ms = 240; %strucure mass
        Ml = 10; %payload mass
    case 2
        %% Initial Values - FAR/MARS
        disp('FAR/MARS');
        beta0 = 1; %deg launch angle
        thrust0 = 2224; %Newtons
        burntime = 20; %seconds
        frontArea = 0.031; %m^2
        Mo = 75; %kg total weight
        Ms = 45; %strucure mass
        Ml = 0; %payload mass
    case 3
        %% Initial Values - GAH
        disp('GAH');
        beta0 = 1; %deg launch angle
        thrust0 = 4500; %Newtons
        burntime = 15; %seconds
        frontArea = 0.071; %m^2
        Mo = 150; %kg total weight
        Ms = 120; %strucure mass
        Ml = 0; %payload mass
    otherwise
        %% Initial Values - LR101
        beta0 = 1; %deg launch angle
        thrust0 = 4500; %Newtons
        burntime = 15; %seconds
        frontArea = 0.071; %m^2
        Mo = 113; %kg total weight
        Ms = 90; %strucure mass
        Ml = 0; %payload mass
end
   
%% Propellant/Burnout
Mb = Ml + Ms; %mass at burnout (structure and payload)
Mp = Mo - Mb; %mass of propellant

%% Earth Values
g0 = 9.81;
r0 = 6.3781*10^6; %raduis of earth

%% Excel Data
fprintf("Importing Data\n");
fileName = 'rocketSimExcel.xlsx';
%col1 = Mach 0.01 increments
%col2 = Cd Power-off
%col3 = Cd Power-on
CdvsMach = xlsread(fileName, 1, 'A2:C2502');
%col1 = Altitude [m]
%col2 = Temp [K]
%col3 = Density [kg/m^3]
atmosphereData = xlsread(fileName, 2, 'A3:C1204');


%% Some Initial Calcs
m_dot = Mp/burntime; %mass flow rate
isp = thrust0/(m_dot*g0); %isp
ueq = isp*g0; %ueq
R = Mo/Mb; %mass ratio
deltaU = ueq*log(R); %total deltaU

%% Time Adjustments
tStep = 1;
tFinal = 500;
tSpan = 1:tStep:tFinal;

%% Iterate 1 Second and Grab Initial Values
accel_y = (thrust0*cosd(beta0)-Mo*g0)/Mo;
accel_x = (thrust0*sind(beta0))/Mo;
uy_1 = accel_y;
ux_1 = accel_x;

z1o=0;     % x-(initial x position)
z2o=ux_1;  % x-(initial x velocity)
z3o=0;     % y-(initial y position)
z4o=uy_1;  % y-(initial y velocity)
y=[z1o;z2o;z3o;z4o];

%% Run Numerical Simulation
options = odeset('Events',@yzero);
%fprintf("\n------- Real --------\n");
[t, x, te, ye, ie]=ode45(@rocketSimODE_Real,tSpan,y, options);
%fprintf("\n------- Ideal --------\n");
[t2, x2, te2, ye2, ie2]=ode45(@rocketSimODE_Ideal,tSpan,y, options);

%% Plots

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
maxHorzReal = max(x(:,1));
maxVertVelReal = max(x(:,4));
maxHorzVelReal = max(x(:,2));
fprintf('\nMax Altitude  (Real): %4.1f [m] %4.1f [ft]\n',maxAltReal,convlength(maxAltReal,'m','ft'));
fprintf('Max Horiz     (Real): %4.1f [m] %4.1f [ft]\n',maxHorzReal,convlength(maxHorzReal,'m','ft'));
fprintf('Max Vert Vel  (Real): %4.1f [m/s]\n',maxVertVelReal);
fprintf('Max Horz Vel  (Real): %4.1f [m/s]\n',maxHorzVelReal);

maxAltIdeal = max(x2(:,3));
maxVertVelIdeal = max(x2(:,4));
maxHorzVelIdeal = max(x2(:,2));
fprintf('\nMax Altitude  (Ideal): %4.1f [m]\n',maxAltIdeal);
fprintf('Max Vert Vel  (Ideal): %4.1f [m/s]\n',maxVertVelIdeal);
fprintf('Max Horz Vel  (Ideal): %4.1f [m/s]\n',maxHorzVelIdeal);

fprintf("\nTotal Weight: %2.0f  pounds\n", convmass(Mo,'kg','lbm'));
fprintf("Thrust:       %2.0f pounds\n", convforce(thrust0,'N','lbf'));
fprintf("T/W:          %2.3f \n", thrust0/(Mo*g0));

