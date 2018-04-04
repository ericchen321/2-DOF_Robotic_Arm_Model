% This script sets the trajectory

% Sample Time for Set-Point Time Vector
SampleTime = 0.04;     %  (s) ADJUSTABLE

% Simulation Execution Time
TotalTime = 5;          % (s) ADJUSTABLE


% =====================
% Set-Point Time Vector
% =====================
Time       = 0:SampleTime:TotalTime;


%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%

fileID0 = fopen('kin_yaw_circle_slow.txt','r');
formatSpec = '%f';
sizeYawD = [1 inf];
YawD = fscanf(fileID0,formatSpec,sizeYawD);
YawD = RadPerDeg * YawD';
fclose(fileID0);

fileID1 = fopen('kin_pitch_circle_slow.txt','r');
formatSpec = '%f';
sizePitchD = [1 inf];
PitchD = fscanf(fileID0,formatSpec,sizePitchD);
PitchD = RadPerDeg * PitchD';
fclose(fileID1);