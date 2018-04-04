% This script sets the trajectory

% Sample Time for Set-Point Time Vector
SampleTime = 0.08;     % ADJUSTABLE

% Simulation Execution Time
TotalTime = 5;          % (s) ADJUSTABLE


% =====================
% Set-Point Time Vector
% =====================
Time       = 0:SampleTime:TotalTime;


%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%

Radius = 0.06; % ADJUSTABLE

Period = 1/FramePerSec;

%Yd = Radius * sin (2*pi*FramePerSec*Time);
Yd = ones(1, size(Time,2));
Xd = zeros(1,length(Time));
Zd = zeros(1,length(Time));

%plot(Xd, Yd);