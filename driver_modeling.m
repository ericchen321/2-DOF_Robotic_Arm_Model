clear all;

% read values
fileID0 = fopen('motor_driver_modeling/v3.txt','r');
formatSpec = '%f %f';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

pwmVec = A(:,1);
voltVec = A(:,2);
voltMax = voltVec(1);
voltVecForFitting = voltVec - voltMax;
plot(pwmVec, voltVecForFitting);
