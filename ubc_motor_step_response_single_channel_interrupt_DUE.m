clear all;

% read values
fileID0 = fopen('motor_step_response_data/ubc_motor_step_response_v22_@12V.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed and fitted xf
timeVec = (A(:, 1) - A(1,1)*ones(size(A,1),1))*10^(-6);
angleVec = A(:, 2)*3.6*(pi/180);
%figure;
%plot(timeVec, angleVec);

speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,2);
timeVec = timeVec(1: (size(A,1)-1));
figure;
plot(timeVec,speedVec);

% get xf using measured B, J and stuff
R=2.768;
L=0.0012;
J=7.7*10^(-6);
Kt=0.0135;
Ke=0.0135;
B=3.58*10^(-7);
s = tf('s');
modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));