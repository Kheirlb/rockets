function [outputCd] = findCd(inputMach, t)
global CdvsMach burntime;
col = 2;
try
    if t <= burntime
        col = 3; %3 = power on
    else
        col = 2; %2 = power off
    end
catch
    col = 3;
end
if inputMach > 25
    outputCd = CdvsMach(2501,col); 
    return;
end
if inputMach < 0
    outputCd = CdvsMach(1,col); 
    return;
end

[numRows, c] = size(CdvsMach);
smallestDelta = 0;
%desiredVal1 = 0;
x_1 = 0; %low Mach 
y_1 = 0; %low Cd 
x_2 = 0; %high Mach
y_2 = 0; %high Cd
x = inputMach; %desired Mach
y = 0; %desired Cd at Mach


for i = 1:numRows
    %fprintf("Searching at index: %2.0f\n", i);
    if i == 1
       smallestDelta = abs(inputMach-CdvsMach(i,1)); 
    end
    if abs(inputMach-CdvsMach(i,1)) < smallestDelta 
        smallestDelta = abs(inputMach-CdvsMach(i,1));
        %desiredVal1 = atmosphereData(i,3);
        if CdvsMach(i,1) > inputMach
            x_1 = CdvsMach(i-1,1); %low alt 
            y_1 = CdvsMach(i-1,col); %low rho 
            x_2 = CdvsMach(i,1); %high alt
            y_2 = CdvsMach(i,col); %high rho
        else
            x_1 = CdvsMach(i,1); %low alt 
            y_1 = CdvsMach(i,col); %low rho 
            x_2 = CdvsMach(i+1,1); %high alt
            y_2 = CdvsMach(i+1,col); %high rho
        end
    end
end
outputCd = simpleInterp(x_1,y_1,x_2,y_2,x);
end

