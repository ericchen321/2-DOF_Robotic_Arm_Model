clear all;

% read values
fileID0 = fopen('motor_step_response_data/ubc_motor_step_response_v19_@12V.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed
timeVec = (A(:, 1) - A(1,1)*ones(size(A,1),1))*10^(-3);
angleVec = A(:, 2)*(3.6/4.0)*(pi/180);
speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,3);
timeVec = timeVec(1: (size(A,1)-1));


timeVecShifted = timeVec(36:end);
timeVecShifted = timeVecShifted - timeVecShifted(1)*ones(size(timeVecShifted,1),1);
speedVecShifted = speedVec(36:end);

% get xf using measured B, J and stuff
R=2.768;
L=0.0019;
J=7.7*10^(-6);
Kt=0.0135;
Ke=0.0135;
B=3.58*10^(-7);
s = tf('s');
modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));

plot(timeVecShifted, speedVecShifted);
hold on;
step(12 * modelXF);
hold off;