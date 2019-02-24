function [outputTemp] = findTemp(inputAlt)
global atmosphereData;
col = 2;
if inputAlt > 59999
    outputTemp = atmosphereData(1202,col); 
    return;
end
if inputAlt < 0
    outputTemp = atmosphereData(1,col); 
    return;
end

[numRows, c] = size(atmosphereData);
smallestDelta = 0;
%desiredVal1 = 0;
x_1 = 0; %low alt 
y_1 = 0; %low temp 
x_2 = 0; %high alt
y_2 = 0; %high temp
x = inputAlt; %desired altitude
y = 0; %desired temperature at altitude


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
            y_1 = atmosphereData(i-1,col); %low rho 
            x_2 = atmosphereData(i,1); %high alt
            y_2 = atmosphereData(i,col); %high rho
        else
            x_1 = atmosphereData(i,1); %low alt 
            y_1 = atmosphereData(i,col); %low rho 
            x_2 = atmosphereData(i+1,1); %high alt
            y_2 = atmosphereData(i+1,col); %high rho
        end
    end
end
outputTemp = simpleInterp(x_1,y_1,x_2,y_2,x);
end

