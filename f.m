function [xp] = f(t,z)
%====================================================================
% #Programmer: Carlos Pereyra
% #Program: f.m
% #Purpose: define equations of motion for projectile motion
%           with quadratic drag in 'state variable form'.
%====================================================================
 
c=4;            % coefficient of drag
m=5;            % mass constant
g=9.81;         % acceleration of gravity constant
 
xp=zeros(4,1);
%-- Equations of Motion (State Variable Form) --
xp(1)=z(2);                                          % x(velocity)
xp(2)=(-c/m)*sqrt( ((z(2))^2) + ((z(4))^2) )*z(2);   % x(acceleration)

xp(3)=z(4);                                          % y(velocity)
xp(4)=-g-(c/m)*sqrt( ((z(2))^2) + ((z(4))^2) )*z(3); % y(acceleration)
%fprintf("Y_Accel: %2.2f\n",xp(4));
fprintf("xp(1): %2.1f  xp(2): %2.1f  xp(3): %2.1f  xp(4): %2.1f\n",xp(1),xp(2),xp(3),xp(4));
fprintf(" z(1): %2.1f   z(2): %2.1f   z(3): %2.1f   z(4): %2.1f\n",z(1),z(2),z(3),z(4));

end
