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

% Motor Transfer Functions: linearized transfer functions of the motors
ElecMechXF0 = ElecXF0 * TConst0 * MechXF0;
ElecMechXF1 = ElecXF1 * TConst1 * MechXF1;

MotorXF0 = (ElecMechXF0/(1 + ElecMechXF0 * BackEMF0))*(1/s);
MotorXF1 = (ElecMechXF1/(1 + ElecMechXF1 * BackEMF1))*(1/s);

% System (Open-loop) Transfer Functions
SysOLXF0 = minreal(MotorXF0, 1e-3);             % Open loop gain of the system
                                                % (PID) not included is
                                                % just the motors' gains
SysOLXF1 = minreal(MotorXF1, 1e-3);
[SysOLXF0p,SysOLXF0z]=pzmap(SysOLXF0);          % Open loop poles that will be cancelled by the PIDs
[SysOLXF1p,SysOLXF1z]=pzmap(SysOLXF1);

% For Q0: Root Locus

% For Q1: Root Locus





% ================
% CONTROLLER GAINS
% ================
% PID sample time
PIDSampleTime = 800*10^(-6);

% PWM Saturation
PWMUpperSat = 255;
PWMLowerSat = -255;


% PID gain values for Q0 and Q1
% Enter optimized PID values here.
% No more than 3 significant figures per gain value.
PID0 = [0.178 8.83 0.0785];
PID1 = [0.8 0.005 0.005];
