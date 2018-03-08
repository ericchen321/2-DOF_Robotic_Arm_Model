clear all;

PWM = 255; % SET THIS VALUE EVERY TIME!!!

% read values
fileID0 = fopen('motor_open_loop_response_data/ubc_motor_open_loop_response_v2_@255.txt','r');
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
speedVec = movmean(speedVec,5);
timeVec = timeVec(1: (size(A,1)-1));


R=2.768;
L=0.0012;
J=7.8*10^(-6);
Kt=0.0135;
Ke=0.0135;
B=3.58*10^(-7);
s = tf('s');
modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));


plot(timeVec,speedVec);
hold on;
step(10.4*modelXF);
hold off;