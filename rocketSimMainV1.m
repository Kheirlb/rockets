% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

angle = 1; %deg
Mo = 750; %kg
Ml = 10;
Ms = 240;
Mp = Mo - Ml - Ms;
t = 60; %sec
thrust = 20000; %N
frontArea = 0.196; %m^2

fileName = 'rocketSimExcel.xlsx';
%col1 = Mach 0.01 increments
%col2 = Cd Power-off
%col3 = Cd Power-on
CdvsMach = xlsread(fileName, 1, 'A2:C2501');
%col1 = Altitude [m]
%col2 = Temp [K]
%col3 = Density [kg/m^3]
atmosphereData = xlsread(fileName, 2, 'A3:C1203');



