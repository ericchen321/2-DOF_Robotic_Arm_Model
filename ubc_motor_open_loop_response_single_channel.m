clear all;

% -------------------------------- pwm = 255 -----------------------------
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

speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,6);
timeVec = timeVec(1: (size(A,1)-1));

plot(timeVec, speedVec);
hold on;






% ----------------------------- pwm = 179 --------------------
% read values
fileID0 = fopen('motor_open_loop_response_data/ubc_motor_open_loop_response_v5_@179.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed and fitted xf
timeVec = (A(:, 1) - A(1,1)*ones(size(A,1),1))*10^(-6);
angleVec = A(:, 2)*3.6*(pi/180);

speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,6);
timeVec = timeVec(1: (size(A,1)-1));

plot(timeVec, speedVec);







% -------------------- pwm = 128 -----------------------
% read values
fileID0 = fopen('motor_open_loop_response_data/ubc_motor_open_loop_response_v7_@128.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed and fitted xf
timeVec = (A(:, 1) - A(1,1)*ones(size(A,1),1))*10^(-6);
angleVec = A(:, 2)*3.6*(pi/180);

speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,6);
timeVec = timeVec(1: (size(A,1)-1));

plot(timeVec, speedVec);









% -------------------- pwm = 63 -----------------------
% read values
fileID0 = fopen('motor_open_loop_response_data/ubc_motor_open_loop_response_v10_@63.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get time and angle and speed and fitted xf
timeVec = (A(:, 1) - A(1,1)*ones(size(A,1),1))*10^(-6);
angleVec = A(:, 2)*3.6*(pi/180);

speedVec = diff(angleVec)./diff(timeVec);
speedVec = movmean(speedVec,6);
timeVec = timeVec(1: (size(A,1)-1));

plot(timeVec, speedVec);