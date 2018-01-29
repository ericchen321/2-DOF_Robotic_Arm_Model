% This script sets the trajectory

%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%
radius = 60;

lengTh = radius * ones(1,37);

angleInDeg = 0:10:360;

angleInRad = angleInDeg * pi/180;

Xd_face = lengTh.*cos(angleInRad);
Yd_face = lengTh.*sin(angleInRad);

% left eye
radius = 45;

lengTh = radius * ones(1,6);

angleInDeg = 120:6:150;

angleInRad = angleInDeg * pi/180;

Xd_leftI = lengTh.*cos(angleInRad);
Yd_leftI = lengTh.*sin(angleInRad);

% right eye

angleInDeg = 30:6:60;

angleInRad = angleInDeg * pi/180;

Xd_rightI = lengTh.*cos(angleInRad);
Yd_rightI = lengTh.*sin(angleInRad);

% smile
lengTh = radius * ones(1,16);

angleInDeg = -45:-6:-135;

angleInRad = angleInDeg * pi/180;

Xd_smile = lengTh.*cos(angleInRad);
Yd_smile = lengTh.*sin(angleInRad);

Xd = [Xd_leftI, Xd_rightI, Xd_smile, Xd_face];
Yd = [Yd_leftI, Yd_rightI, Yd_smile, Yd_face];

Xd = repmat(Xd,1,60);
Yd = repmat(Yd,1,60);
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
