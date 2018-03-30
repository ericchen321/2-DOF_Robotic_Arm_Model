clear all;

% Enter parameters
DegPerRad = 57.3;
Radius = 0.06;
FramePerSec = 2;
SetPointTime = 0.04;
TotalTime = 5;
D = 0.1;
R = 0.05;

% Create time vector
time = 0:SetPointTime:TotalTime;

% Create desired x and y arrays based on parameters
SetPointSize = size(time,2);
for i = 1:SetPointSize
    desiredYArray(i) = Radius * sin ( 2 * pi * FramePerSec * time(i));
    desiredXArray(i) = Radius * cos ( 2 * pi * FramePerSec * time(i));
end

% Derive desired pitch and yaw arrays
for i = 1:SetPointSize
    desiredPitchArray(i) = DegPerRad * atan(desiredYArray(i)/D);
end

syms f(x)
for i = 1:SetPointSize
    f(x) = D*(x+(1/3)*x^3+(2/15)*x^5)-R*(x+(1/3)*x^3+(2/15)*x^5)*(x-x^3/6+x^5/120)-desiredXArray(i);
    sol = vpasolve(f,[-1.571,1.571]);
    desiredYawArray(i) = DegPerRad * double(sol);
end

% plot desired pitch and yaw
figure;
plot(time,desiredPitchArray);
title('Desired Pitch');
figure;
plot(time,desiredYawArray);
title('Desired Yaw');