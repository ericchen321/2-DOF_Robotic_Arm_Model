clear all;

% measurement params
speedSampleTime = 2000; %  specified in us
suppliedVolt = 3.5;

% define constants
RadPSecPerRPM = pi/30;  % (rad/s) / rpm

% read values
fileID0 = fopen('pitch_step_motor_data/8_3.5V.txt','r');
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
R=4.1;
L=0.000204;
J=3*10^(-6);
Kt=0.0055;
Ke=0.0055;
B=8*10^(-6);
s = tf('s');
modelXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));

% plot to compare model with actual
plot(time,speed,'b');
hold on;
step(suppliedVolt * modelXF,'r');
title('Pitch Motor Step Response');
xlabel('Time (sec)');
ylabel('Speed (rad/sec)');
legend('Measured', 'Simulated');
hold off;