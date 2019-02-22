function [mach] = valueOfMach(u,Temp)
% Return Mach Number at u and T
gamma = 1.4;
gasConst = 287;
c = sqrt(gamma*gasConst*Temp);
%disp(c);
mach = u/c;

end

