function [du] = rocketSimODE(t,y0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
du = zeros(2,1);
du(2) = y0(1);
fprintf("ODE Function Run, t: %2.0f\n", t);
du(1) = 2*t;

end

