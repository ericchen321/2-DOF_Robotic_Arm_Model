% This script sets the trajectory

%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%
% xy coordinates of circle moving left to right


% Robot XY Trajectory for cross-hatch pattern


% Sample Time for Set-Point Time Vector
SampleTime = TotalTime / (length(Xd)-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Values you should over-write in Control.m %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% =====================
% Set-Point Time Vector
% =====================
Time       = 0:SampleTime:TotalTime;       % DO NOT CHANGE TotalTime
