clear all;

% Enter parameters
DegPerRad = 57.3;
Side = 0.06;
SetPointTime = 0.021;
TotalTime = 5;
D = 0.1;
R = 0.05;
XPerFrame = [0 0.06 0.03 0];
YPerFrame = [0 0 0.052 0];
SetPointSizePerFrame = size(XPerFrame,2);

% Create time vector
time = 0:SetPointTime:TotalTime;

% Create desired x and y arrays based on parameters
SetPointSize = size(time,2);
i = 1;
while i <= (SetPointSize - SetPointSizePerFrame + 1)
    desiredXArray(i:i+SetPointSizePerFrame-1) = XPerFrame;
    desiredYArray(i:i+SetPointSizePerFrame-1) = YPerFrame;
    i = i + SetPointSizePerFrame - 1;
end
desiredXArray(239) = 0.06;
desiredYArray(239) = 0;


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