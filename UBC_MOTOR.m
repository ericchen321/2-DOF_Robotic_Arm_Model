% This script sets parameter values for the following device:
% The ubc motor from elec 391
% Attention to units, not all in SI

MotorParam = ...
[12                 % NomV          (V)
 7200               % NoLoadSpd     (rpm)
 0.19               % NoLoadCurr    (A)
 3606               % NomSpd        (rpm)
 480                % NomTorque     (g*cm)
 3.204              % NomCurr       (A)
 929                % StallTorque   (g*cm)
 6.03               % StallCurr     (A)
 0.74               % MaxEff        (decimal)
 2.768              % TermR         (Ohms)
 0.0012             % TermL         (H)
 0.0135             % TorqueConst   (Nm/A)
 0.0135             % SpdConst      (V/(rad/sec))
 0                  % RotJ          (kg*m^2)
 0                  % Weight        (g)

 0              % OuterDiam     (mm)
 0];            % Length        (mm)
