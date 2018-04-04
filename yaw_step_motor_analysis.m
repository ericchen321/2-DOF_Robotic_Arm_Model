clear all;

% measurement params
speedSampleTime = 2000; %specified in us
suppliedVolt = 2.89;

% define constants
RadPSecPerRPM = pi/30;  % (rad/s) / rpm

% read values
fileID0 = fopen('yaw_step_motor_data/1_2.89V.txt','r');
formatSpec = '%f';
sizeA = [1 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);

% get shifted speed and time
i = 1;
while (A(i) == 0)
    i = i+1;
end
i = i-1;
speed = RadPSecPerRPM * A(i:end);
time = (0:size(speed,1)-1)';
time = (speedSampleTime/10^6)*time;

% get xf using measured B, J and stuff
R=2.768;
L=0.0019;
J=7.7*10^(-6);
Kt=0.0135;
Ke=0.0135;
B=3.58*10^(-7);
s = tf('s');
modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));

% plot to compare model with actual
plot(time,speed);
hold on;
step(suppliedVolt * modelXF);
title('Yaw Motor Step Response');
xlabel('Time (sec)');
ylabel('Speed (rad/sec)');
legend('Measured', 'Simulated');
hold off;