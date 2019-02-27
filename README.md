# Numerical Simulation of a Sounding Rocket Flight

* Author: Karl Parks
* Class: AE 530
* Date: 2.13.19

![Screenshot](karl_hw2_6plots_v6.jpg?raw=true)

## Run Program

Run "rocketSimMainV4.m"

It is possible to change between different rocket characteristics/specifications easily using the rocketType variable at the top of the main script. Use a value of 1 for Homework 2 specifications.

### Dependent Files
* rocketSimODE_Real.m
* rocketSimODE_Ideal.m
* valueAt.m
* findrho.m
* findTemp.m
* valueOfMach.m
* findCd.m
* simpleInterp.m
* yzero.m
* rocketSimExcel.xlsx

### Example Input
```
%% Time Adjustments
tStep = 0.1;
tFinal = 3000;
tSpan = 1:tStep:tFinal;

%% Choose Initial Conditions
rocketType = 2;
%rocketName = '';
% 1 = HW2
% 2 = FAR/MARS
% 3 = GAH
% 4 = HW1
% 5 = BASE11
% 6 = COMPARISON_1
% otherwise = LR101 Rocket

switch rocketType
    case 1
        %% Initial Values - HW2
        fprintf('rocketType: HW2\n');
        rocketName = 'HW2';
        beta0 = 1; %deg launch angle
        thrust0 = 20000; %Newtons
        burntime = 60; %seconds
        frontArea = 0.196; %m^2
        Mo = 750; %kg total weight
        Ms = 240; %strucure mass
        Ml = 10; %payload mass
    case 2
        %% Initial Values - FAR/MARS
```
### Example Output
```

 --- Numerical Simulation of a Sounding Rocket Flight ---

Author: Karl Parks
Class: AE 530
Date: 2.13.19

rocketType: HW2
Importing Data: This may take a moment...

NOTICE: Holding some values constant on plots after t: 355.2

Plots Displayed

f.
Burnout Time  (Real): 60.0 [sec]
Burnout Alt   (Real): 35273.8 [m] 115727.5 [ft]
Burnout Vel   (Real): 1565.3 [m/s]

g.
Time @ Apogee (Real): 218.1 [sec]
Apogee Alt    (Real): 153031.6 [m] 502072.3 [ft]

h.
Time @ Impact (Real): 394.7 [sec]
Max Horiz     (Real): 142225.7 [m] 466619.9 [ft]

l.
MATLAB's ode45 numerical integrator chooses its own time step.
https://www.mathworks.com/help/matlab/ref/ode45.html#bu00_4l_sep_shared-tspan

--- Other Interesting Information ---
Total Weight: 1653 pounds
Thrust:       4496 pounds
T/W:          2.718
Isp:          244.6 [sec]
u_eqivalent:  2400.0 [m/s]
Mass Ratio:   3
Delta V:      2636.7 [m/s]

Max Alt  (Real): 153031.6 [m] 502072.3 [ft]
Max Alt    (Eq): 261033.4 [m] 856408.7 [ft]
Max Alt (Ideal): 283222.9 [m] 929209.0 [ft]

Max Vert Vel  (Real): 1514.4 [m/s]
Max Horz Vel  (Real): 1040.1 [m/s]
Max Velocity  (Real): 1566.8 [m/s]
```
## Future Improvements
* Improved atmospheric data using atmosisa
* Add launch rail
* Add alt ASL
* Numerical integration of beta (flight angle)
* Numerical integration of theta (curvature of Earth)
* Incorporation of wind
* Incorporate CG vs CP differences
* Incorporate lift of rocket and fins
* Incorporate thrust profiles (with changing back pressure)  
* Incorporate control systems (TVC)
* Incorporate staging
* Incorporate transfer into LEO or GEO orbits
* Add parachute deployment options
* Add re-entry information
* Add graphical user interface (GUI)
* Make non-MATLAB version for any user (python?)
* Make GNU Octave Compatible  

* Apply optimization control theory

FYI... you could do the above... or you could just use RASAero
