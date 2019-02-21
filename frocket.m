%ode for rocket in vertical flight
function dxdt=frocket(t,x)
global F r b m0 g0 R
dxdt = zeros(2,1); %2x1 array for dxdt
dxdt(2)=x(1);
m=m0*(1-((r*t)/b));
g=g0*(R / (R+x(2)))^2;
% v=0;
%t=0;
%x=0;
%X2=v
% dxdt(2)=(F/(m0*(1-((r*t)/ b))))-(g0*((R /(R+x(2)))^2)) + ((29.33*x(2))/(m0*(1-((r*t)/b))));
%  dxdt(1)=(F/m)-(g) + (29.33)*(x(1))/(m);
dxdt(1)=(F/(m0*(1-((r*t)/ b))))
return
