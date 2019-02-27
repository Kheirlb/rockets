# Numerical Simulation of a Sounding Rocket Flight

* Author: Karl Parks
* Class: AE 530
* Date: 2.13.19

![Screenshot](karl_hw2_6plots_v5.jpg?raw=true)

## Run Program

Run "rocketSimMainV4.m"

It is possible to change between different rocket characteristics/specifications easily using the rocketType variable at the top of the main script. Use a value of 1 for Homework 2 specifications.

### Dependent Files
* rocketSimODE_Real
* rocketSimODE_Ideal
* valueAt
* findrho
* findTemp
* valueOfMach
* findCd
* simpleInterp
* yzero

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

rocketType: FAR/MARS
Importing Data: This may take a moment...

NOTICE: Holding some values constant on plots after t: 83.1

Plots Displayed

f.
Burnout Time  (Real): 20.0 [sec]
Burnout Alt   (Real): 4542.6 [m] 14903.4 [ft]
Burnout Vel   (Real): 411.6 [m/s]

g.
Time @ Apogee (Real): 52.6 [sec]
Apogee Alt    (Real): 10151.9 [m] 33306.8 [ft]

h.
Time @ Impact (Real): 92.4 [sec]
Max Horiz     (Real):  0.0 [m]  0.0 [ft]

l.
MATLAB's ode45 numerical integrator chooses its own time step.
https://www.mathworks.com/help/matlab/ref/ode45.html#bu00_4l_sep_shared-tspan

--- Other Interesting Information ---
Total Weight: 158 pounds
Thrust:       500 pounds
T/W:          3.171
Isp:          171.1 [sec]
u_eqivalent:  1678.5 [m/s]
Mass Ratio:   2
Delta V:      777.2 [m/s]

Max Alt  (Real): 10151.9 [m] 33306.8 [ft]
Max Alt    (Eq): 22417.3 [m] 73547.5 [ft]
Max Alt (Ideal): 21258.8 [m] 69746.6 [ft]

Max Vert Vel  (Real): 411.6 [m/s]
Max Horz Vel  (Real):  0.0 [m/s]
Max Velocity  (Real): 411.6 [m/s]
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
