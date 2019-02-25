# Numerical Simulation of a Sounding Rocket Flight

* Author: Karl Parks
* Class: AE 530
* Date: 2.13.19

![Screenshot](karl_hw2_6plots_v5.jpg?raw=true)

## Run Program

Run "rocketSimMainV4.m"

It is possible to change between different rocket characteristics/specifications easily using the rocketType variable at the top of the main script. Use a value of 1 for Homework 2.

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

## Future Improvements
* Improved atmospheric data using atmosisa
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

## FYI... you could do the above... or you could just use RASAero
