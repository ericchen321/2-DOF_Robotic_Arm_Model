clear all;

% read values
fileID0 = fopen('ubc_motor_step_response_v11_@10V.txt','r');
formatSpec = '%f,%f';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed and fitted xf
timeVec = (A(:, 2) - A(2,1)*ones(size(A,1),1))*10^(-6);
angleVec = A(:, 1) * (3.6/4.0) * pi/180;
%plot(timeVec,angleVec);
speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,3);

i = 1;
while (angleVec(i) == 0)
    i = i+1;
end    
voltVec = [zeros(i-1,1) ; 10*ones((size(A,1)-1)-(i-1),1)];

timeVec = timeVec(1: (size(A,1)-1));
Ts = timeVec(end)/length(timeVec);
estXFData = iddata(speedVec,voltVec,Ts);
estXF = tfest(estXFData,2,0);

timeVecShifted = timeVec(i-1:end);
timeVecShifted = timeVecShifted - timeVecShifted(1,1);
voltVecShifted = voltVec(i-1:end);
speedVecShifted = speedVec(i-1:end);

% get xf using measured B, J and stuff
%R=2.768;
%L=0.0012;
%J=2.92*10^(-5);
%Kt=0.0141;
%Ke=0.0141;
%B=3.58*10^(-7);
%s = tf('s');
%modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));

step(10 * estXF);
hold on;
plot(timeVecShifted, speedVecShifted);
hold off;
%step(modelXF);