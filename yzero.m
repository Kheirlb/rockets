function [value,isterminal,direction] = yzero(~,y)
% Locate the time when the value is zero
% increasing direction and don't stop integration.
value = y(3);   % detect value at zero
isterminal = 1; % don't stop the integration 
direction = 0;  % positive direction only
end

