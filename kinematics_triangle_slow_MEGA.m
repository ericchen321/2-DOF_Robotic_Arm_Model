clear all;

% Enter parameters
GearGain0 = -5;
GearGain1 = 3;
DegPerRad = 57.3;
Side = 0.06;
SetPointTime = 0.042;
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

desiredXArray(119:120) = [0.06 0.03];
desiredYArray(119:120) = [0 0.052];


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

% Scale desired yaw and pitch by gear gains
desiredYawArray = GearGain0 * desiredYawArray;
desiredPitchArray = GearGain1 * desiredPitchArray;

% plot desired pitch and yaw
figure;
plot(time,desiredPitchArray);
title('Triangle Slow: Desired Pitch');
figure;
plot(time,desiredYawArray);
title('Triangle Slow: Desired Yaw');

% write the yaw angles to file
fileID1 = fopen('kin_yaw_triangle_slow.txt', 'w');
i = 1;
for i = 1:size(desiredYawArray,2)
  if i ~= size(desiredYawArray,2)
    fprintf(fileID1,'%.2f\n',desiredYawArray(i));
  else
    fprintf(fileID1,'%.2f',desiredYawArray(i));
  end
end
fclose(fileID1);

% write the pitch angles to file
fileID2 = fopen('kin_pitch_triangle_slow.txt', 'w');
i = 1;
for i = 1:size(desiredPitchArray,2)
  if i ~= size(desiredPitchArray,2)
    fprintf(fileID2,'%.2f\n',desiredPitchArray(i));
  else
    fprintf(fileID2,'%.2f',desiredPitchArray(i));
  end
end
fclose(fileID2);