% This script sets the trajectory

% Sample Time for Set-Point Time Vector
SampleTime = 0.008;     % ADJUSTABLE

% Simulation Execution Time
TotalTime = 1;          % (s) ADJUSTABLE


% =====================
% Set-Point Time Vector
% =====================
Time       = 0:SampleTime:TotalTime;


%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%

Radius = 0.06; % ADJUSTABLE

Period = 1/FramePerSec;

%Yd = Radius * sin (2*pi*(1.0/Period)*Time);
Yd = 0.06 * ones(126,1);
Xd = zeros(1,length(Time));
Zd = zeros(1,length(Time));

%plot(Xd, Yd);