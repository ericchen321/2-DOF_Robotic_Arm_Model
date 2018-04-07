% This script sets parameter values for the following device:
% The ubc motor from elec 391
% Attention to units, not all in SI

MotorParam = ...
[12                 % NomV          (V)
 1                  % NoLoadSpd     (rpm)
 1                  % NoLoadCurr    (A)
 1                  % NomSpd        (rpm)
 1                  % NomTorque     (g*cm)
 1                  % NomCurr       (A) REQUIRED
 929                % StallTorque   (g*cm) REQUIRED
 1.5                % StallCurr     (A) REQUIRED
 1                  % MaxEff        (decimal)
 4.1                % TermR         (Ohms) REQUIRED
 0.000204           % TermL         (H) REQUIRED
 0.0055             % TorqueConst   (Nm/A) REQUIRED
 0.0055             % SpdConst      (V/(rad/sec)) REQUIRED
 0                  % RotJ          (kg*m^2)
 0                  % Weight        (g)

 0                  % OuterDiam     (mm)
 0];                % Length        (mm)
