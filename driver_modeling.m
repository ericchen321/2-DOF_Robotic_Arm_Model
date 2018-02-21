clear all;

% read values
fileID0 = fopen('motor_driver_modeling/v2.txt','r');
formatSpec = '%d %f';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

pwmVec = A(:,1);
speedVec = A(:,2);
speedMax = speedVec(1);
speedVecForFitting = speedVec - speedMax;
plot(pwmVec, speedVecForFitting);
