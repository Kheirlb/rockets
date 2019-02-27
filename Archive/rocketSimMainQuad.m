%% Numerical Simulation of a Rocket Flight
% Author: Karl Parks
% Date: 2.13.19

% Used this for help:
% https://mintoc.de/index.php/Gravity_Turn_Maneuver

clc; clear;

%% Given
global Mo g0 drag0 beta0 thrust0;
Mo = 5; %kg total weight
g0 = 9.81;
drag0 = 0;
beta0 = 90-75.963756; %deg launch angle
thrust0 = 20.615; %N

%% Iterate 1 Second and Grab Values
accel_1 = thrust0/Mo;
uy_1 = cosd(beta0)*accel_1;
ux_1 = sind(beta0)*accel_1;

z1o=0;  % x-(initial x position)
z2o=ux_1;  % x-(initial x velocity)
z3o=0;  % y-(initial y position)
z4o=uy_1;  % y-(initial y velocity)
y=[z1o;z2o;z3o;z4o];

options = odeset('Events',@yzero);
[t, x, te, ye, ie]=ode45(@rocketSimODEv2Drag,[0 1],y, options);
[t2, x2, te2, ye2, ie2]=ode45(@rocketSimODEv2,[0 1],y, options);

%-- Plots --
subplot(3,1,1)
plot(x(:,1),x(:,3),'+r',x2(:,1),x2(:,3),'k')
title('x vs. y', 'FontSize', 14)
xlabel('x', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
axis([-inf,inf,0,1])
legend('Force Drag','No Drag')
 
subplot(3,1,2)
plot(t,x(:,1),'+r',t,x2(:,1),'k')
title('t vs. x-position', 'FontSize', 14)
xlabel('t', 'FontSize', 14);
ylabel('x', 'FontSize', 14);
legend('Force Drag','No Drag')
 
subplot(3,1,3)
plot(t,x(:,3),'+r',t,x2(:,3),'k')
title('t vs. y-position', 'FontSize', 14)
xlabel('t', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
legend('Force Drag','No Drag')
