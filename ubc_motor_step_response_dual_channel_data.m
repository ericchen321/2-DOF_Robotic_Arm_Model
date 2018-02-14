clear all;

% read values
fileID0 = fopen('ubc_motor_step_response_v13_@12V.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed and fitted xf
timeVec = (A(:, 2) - A(1,1)*ones(size(A,1),1))*10^(-6);
angleVec = A(:, 1) * (3.6/4.0) * (pi/180);
figure;
plot(timeVec, angleVec);

speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,2);
timeVec = timeVec(1: (size(A,1)-1));
figure;
plot(timeVec,speedVec);