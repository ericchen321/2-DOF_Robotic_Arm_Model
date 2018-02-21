% This script sets the model parameters for the ELEC 391 Motors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Over-write the default values from DEFAULT.m %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ==========================
% Choose Motors
% ==========================
UBC_MOTOR;                % Motor for Q0
Q0 = MotorParam;
UBC_MOTOR;                % Motor for Q1
Q1 = MotorParam;

% Motor Unit Conversions
ConversionArray = ...
...             
[1                          % NomV          (V)
 RadPSecPerRPM              % NoLoadSpd     (rpm)
 1                          % NoLoadCurr    (A)
 RadPSecPerRPM              % NomSpd        (rpm)
 (1/G)*10^(-5);                 % NomTorque     (g*cm)
 1                          % NomCurr       (A)
 (1/G)*10^(-5);                 % StallTorque   (g*cm)
 1                          % StallCurr     (A)
 1                          % MaxEff        (decimal)
 1                          % TermR         (Ohms)
 1                          % TermL         (H)
 1                          % TorqueConst   (Nm/A)
 1                          % SpdConst      (V/(rad/sec))
 1                          % RotJ          (kg*m^2)
 0.001                      % Weight        (g)

 0.001                      % OuterDiam     (mm)
 0.001];                    % Length        (mm)

% Convert units to standard units
Q0 = ConversionArray .* Q0;
Q1 = ConversionArray .* Q1;






% ==========================
% Motor Parameters
% ==========================

% Maximum Current
% These values are all taken from the Datasheet
NomI0   = Q0(6);                 % Max average current
StallI0 = Q0(8);                 % Max peak current
NomI1   = Q1(6);                 % Max average current
StallI1 = Q1(8);                 % Max peak current



% ==========================
% Driver Parameters
% ==========================
VDriverSat = 12;



% =============================
% Q0 : Rotation of the top motor
% =============================

% Electrical Motor Dynamics
Elec0n  = [1];                      % Numerator
Elec0d  = [Q0(11) Q0(10)];          % Denominator, (sL + R), so the numerators are terminal inductance and terminal resistance of Q0's rotor, respectively

% Torque Const & Back EMF
TConst0  = Q0(12);                  % The torque constant given by the Datasheet
BackEMF0 = Q0(13);                  % The speed costant 
                                    

% Mechanical Motor Dynamics


% Mech Transfer Function:
J0 = 1;
B0 = 1;
Mech0n  = [1 0];                 % Numerator
Mech0d  = [J0 B0];               % Denominator
JntSat0 =  Big;                  % Q0 has unlimited motion range, as stated in the Datasheet

% Sensor Dynamics

% Static Friction
StFric0 = 0;       % Total static frictional torque










% =============================
% Q1 : Rotation of the bottom motor
% =============================
% Electrical Motor Dynamics
Elec1n  = [1];                      % Numerator
Elec1d  = [Q1(11) Q1(10)];          % Denominator

% Torque Const & Back EMF
TConst1  = Q1(12);
BackEMF1 = Q1(13);

% Mechanical Motor Dynamics


% Mech Transfer Function:
J1 = 1;
B1 = 1;
Mech1n  = [1];                         % Numerator
Mech1d  = [J1 B1];                     % Denominator

% Sensor Dynamics

% Static Friction
StFric1 = 0;                % static friction on q1 is negligible, since only the laser is loaded on q1's rotor