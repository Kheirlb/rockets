function [y] = simpleInterp(x_1,y_1,x_2,y_2,x)
%Simple Linear Interpolation
y = y_1 + (x - x_1) * ((y_2-y_1)/(x_2-x_1));
end

