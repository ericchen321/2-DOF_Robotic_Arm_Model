clear all;

% read values
fileID0 = fopen('motor_open_loop_response_data/ubc_motor_open_loop_response_v1_@255.txt','r');
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
%figure;
%plot(timeVec,speedVec);
voltVec = 12*ones(size(timeVec,1),1);

timeVecForEst = [(0:6.2669*10^(-4):1)' ; (timeVec+1)];
sizeDiff = size(timeVecForEst,1)-size(timeVec,1);
voltVecForEst = [zeros(sizeDiff,1); voltVec];
speedVecForEst = [zeros(sizeDiff,1); speedVec];
Ts = timeVecForEst(end)/length(timeVecForEst);
estXFData = iddata(speedVecForEst,voltVecForEst,Ts);
estXF = tfest(estXFData,2,0);

% get xf using measured B, J and stuff
R=2.74;
L=0.0019;
J=5.5*10^(-5);
Kt=0.013;
Ke=0.013;
B=3.2*10^(-7);
s = tf('s');
modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));

step(12 * estXF);
hold on;
plot(timeVec, speedVec);
step(12 * modelXF);
