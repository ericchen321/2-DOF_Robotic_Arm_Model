clear all;

% define params
angleSampleTime = 0.004; % specified in seconds

% read values
fileID0 = fopen('circle_slow_pitch_setpoint_following_data/4_p25_i0_d_5.12p.txt','r');
formatSpec = '%d,%d';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

time = 0: (size(A,1)-1);
time = time * angleSampleTime;
desiredPitch = A(:,1);
actualPitch = A(:,2);

plot(time, desiredPitch);
hold on;
plot(time, actualPitch);
title('Desired vs. Actual Pitch Angle (in degree)');
xlabel('Time (s)');
ylabel('Angle (deg)');
legend('Desired', 'Actual');
hold off;

