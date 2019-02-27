clc, clear, home;
 
%====================================================================
% #Programmer: Carlos Pereyra
% #Program: QuadDrag.m
% #Purpose: Demonstrate the use of a numerical differential-equation
%           solver, 'ode45', to model projectile motion with quadratic
%           drag effects &amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp; compare it to projectile motion without
%           quadratic drag.
%====================================================================
 
%-- Initial Conditions --
z1o=0;  % x-(initial x position)
z2o=1;  % x-(initial x velocity)
z3o=0;  % y-(initial y position)
z4o=4;  % y-(initial y velocity)
y=[z1o;z2o;z3o;z4o];

options = odeset('Events',@yzero);
[t,x, te, ye, ie]=ode45(@f,[0,1],y, options);   % Solve DE With Quadratic Drag
[t,x2, te2, ye2, ie2]=ode45(@f2,[0,1],y, options); % Solve DE Without Quadratic Drag

%-- Plots --
subplot(3,1,1)
plot(x(:,1),x(:,3),'+r',x2(:,1),x2(:,3),'k')
title('x vs. y', 'FontSize', 14)
xlabel('x', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
axis([-inf,inf,0,1])
legend('Quadratic Drag','No Drag')
 
subplot(3,1,2)
plot(t,x(:,1),'+r',t,x2(:,1),'k')
title('t vs. x-position', 'FontSize', 14)
xlabel('t', 'FontSize', 14);
ylabel('x', 'FontSize', 14);
legend('Quadratic Drag','No Drag')
 
subplot(3,1,3)
plot(t,x(:,3),'+r',t,x2(:,3),'k')
title('t vs. y-position', 'FontSize', 14)
xlabel('t', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
legend('Quadratic Drag','No Drag')

