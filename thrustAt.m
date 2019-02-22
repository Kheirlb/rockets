function [returnThrustVal] = thrustAt(t)
% Thrust at Specific Time
global burntime thrust0;

if t < burntime
    returnThrustVal = thrust0;
else
    returnThrustVal = 0;
end

end

