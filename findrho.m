function [outputDensity] = findrho(inputAlt)
global atmosphereData;
if inputAlt > 59999
    outputDensity = atmosphereData(1202,3); 
    return;
end
if inputAlt < 0
    outputDensity = atmosphereData(1,3); 
    return;
end

[numRows, c] = size(atmosphereData);
smallestDelta = 0;
%desiredVal1 = 0;
x_1 = 0; %low alt 
y_1 = 0; %low rho 
x_2 = 0; %high alt
y_2 = 0; %high rho
x = inputAlt; %desired altitude
y = 0; %desired density at altitude


for i = 1:numRows
    %fprintf("Searching at index: %2.0f\n", i);
    if i == 1
       smallestDelta = abs(inputAlt-atmosphereData(i,1)); 
    end
    if abs(inputAlt-atmosphereData(i,1)) < smallestDelta 
        smallestDelta = abs(inputAlt-atmosphereData(i,1));
        %desiredVal1 = atmosphereData(i,3);
        if atmosphereData(i,1) > inputAlt
            x_1 = atmosphereData(i-1,1); %low alt 
            y_1 = atmosphereData(i-1,3); %low rho 
            x_2 = atmosphereData(i,1); %high alt
            y_2 = atmosphereData(i,3); %high rho
        else
            x_1 = atmosphereData(i,1); %low alt 
            y_1 = atmosphereData(i,3); %low rho 
            x_2 = atmosphereData(i+1,1); %high alt
            y_2 = atmosphereData(i+1,3); %high rho
        end
    end
end
outputDensity = simpleInterp(x_1,y_1,x_2,y_2,x);
end

