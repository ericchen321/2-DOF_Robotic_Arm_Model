% This script contains all physical constants and specifications for the
% SLS 3-D Printer

% Start with a clean slate
% Erase entire Matlab environment
clear all;

%%%%%%%%%%%%%%%%%%%%%%
% Physical Constants %
%%%%%%%%%%%%%%%%%%%%%%
G = 9.81;               % m/s^2
FtPerM = 3.28;          % ft / m
RadPerDeg = pi/180;     % rad / deg
DegPerRad = 180/pi;     % deg / rad
RadPSecPerRPM = pi/30;  % (rad/s) / rpm
RPMPerRadPSec = 9.5492; % rpm / (rad/s)

Big = 1e6;              % General purpose large number
Sml = 1e-6;             % General purpose small number


%%%%%%%%%%%%%%%%%%
% Specifications %
%%%%%%%%%%%%%%%%%%

% Number of frames per second
FramePerSec = 1;

% Sensor

% Distance between tip of laser to the drawing pad
Height = 0.1;

% Coeff of static friction
% Amount of torque required to set a body in motion which has a given
% amount of radial force being applied to it (usually due to gravity)
uSF    = 700;            % (um) = (uNm/N)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Indices into MotorParam Vector for Maxon motors %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Values at Nominal Voltage
NomV          = 1;
NoLoadSpd     = 2;
NoLoadCurr    = 3;
NomSpd        = 4;
NomTorque     = 5;
NomCurr       = 6;
StallTorque   = 7;
StallCurr     = 8;
MaxEff        = 9;

% Characteristics
TermR         = 10;
TermL         = 11;
TorqueK       = 12;
SpdK          = 13;
RotJ          = 14;
Weight        = 15;

% Physical Dimensions
OuterDiam     = 16;
Length        = 17;

% Ready transfer function param s
s = tf('s');
