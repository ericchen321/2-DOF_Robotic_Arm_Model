% This script sets the trajectory

% Sample Time for Set-Point Time Vector
SampleTime = 0.08;     % ADJUSTABLE

% Simulation Execution Time
TotalTime = 1;          % (s) ADJUSTABLE


% =====================
% Set-Point Time Vector
% =====================
Time       = 0:SampleTime:TotalTime;


%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%

Radius = 0.1; % ADJUSTABLE

Period = 1/FramePerSec;

Yd = Radius * sin (2*pi*FramePerSec*Time);
%Yd = Radius * ones(1,(length(Time)-5));
%Yd = [0 0 0 0 0 Yd];
Xd = zeros(1,length(Time));
Zd = zeros(1,length(Time));

%plot(Xd, Yd);