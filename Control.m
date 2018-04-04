% This script sets the controller parameters for the SLS 3-D Printer

% ==================
% TRANSFER FUNCTIONS
% ==================
% Compute transfer functions from above values and perform system analysis
% You may prefer to put this section in a separate .m file

% Electrical Transfer Functions
ElecXF0 = tf(Elec0n, Elec0d);
ElecXF1 = tf(Elec1n, Elec1d);

% Mechanical Transfer Functions
MechXF0 = tf(Mech0n, Mech0d);
MechXF1 = tf(Mech1n, Mech1d);

% Driver Transfer Functions
DriverXF0 = DriverGain;
DriverXF1 = DriverGain;

% Motor Transfer Functions: linearized transfer functions of the motors
ElecMechXF0 = ElecXF0 * TConst0 * MechXF0;
ElecMechXF1 = ElecXF1 * TConst1 * MechXF1;

MotorXF0 = DriverXF0 * (ElecMechXF0/(1 + ElecMechXF0 * BackEMF0))*(1/s);
MotorXF1 = DriverXF1 * (ElecMechXF1/(1 + ElecMechXF1 * BackEMF1))*(1/s);

% System (Open-loop) Transfer Functions
SysOLXF0 = minreal(MotorXF0, 1e-3);             % Open loop gain of the system
                                                % (PID) not included is
                                                % just the motors' gains
SysOLXF1 = minreal(MotorXF1, 1e-3);
[SysOLXF0p,SysOLXF0z]=pzmap(SysOLXF0);          % Open loop poles that will be cancelled by the PIDs
[SysOLXF1p,SysOLXF1z]=pzmap(SysOLXF1);

% For Q0: Root Locus

% For Q1: Root Locus
UnityGain = 1;
PID1z = [SysOLXF1p(1) SysOLXF1p(3)]; % Defines which two open-loop poles to cancel
PID1p = [0]; % PID adds a zero to the open loop xfer fctn
PIDXF1 = zpk(PID1z, PID1p, UnityGain);  %PID0's transfer function with Kd undetermined
OLXF1 = minreal(PIDXF1 * SysOLXF1, 1e-3);
%figure;
%rlocus(OLXF1);
%title('RLocus Q1');


% Closed loop transfer functions
Kd0 = 1;
Kp0 = 8.518*Kd0;
Ki0 = 0;

Kd1 = 78;
Kp1 = 8.518*Kd1;
Ki1 = 0;
CLXF1 = (Kd1 * PIDXF1 * MotorXF1)/(1 + Kd1 * PIDXF1 * MotorXF1);


% ================
% CONTROLLER GAINS
% ================

% PID sample time specified in seconds
PIDSampleTime = 0.0005;


% PWM Saturation
PWMUpperSat = 1023;
PWMLowerSat = -1023;


% PID gain values for Q0 and Q1
% Enter optimized PID values here.

% Continuous PID values
PID0 = [Kp0 Ki0 Kd0];
PID1 = [Kp1 Ki1 Kd1];

% Discrete PID values
Kd0Dig = Kd0/DegPerRad;
Kp0Dig = Kd1/DegPerRad;
Ki0Dig = 0;
PIDDig0 = [Kp0Dig Ki0Dig Kd0Dig];


Kd1Dig = Kd1/DegPerRad;
Kp1Dig = Kp1/DegPerRad;
Ki1Dig = 0;
PIDDig1 = [Kp1Dig Ki1Dig Kd1Dig];