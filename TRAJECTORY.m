% This script sets the trajectory

%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%
Xd = [-10:4:10];

Xd = [Xd Xd(2:end)];
Yd = zeros(1,11);
Zd = ones(1,length(Xd));

plot(Xd, Yd);


% Sample Time for Set-Point Time Vector
SampleTime = TotalTime / (length(Xd)-1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Values you should over-write in Control.m %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% =====================
% Set-Point Time Vector
% =====================
Time       = 0:SampleTime:TotalTime;       % DO NOT CHANGE TotalTime
