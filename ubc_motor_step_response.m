clear all;

% with noise
fileID0 = fopen('ubc_motor_step_response.txt','r');
formatSpec = '%f %f %f';
sizeA = [3 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);
timeVec = 0;
angleVec = 0;
voltVec = 0;

for i=2:(size(A,1)-1)
    if(A(i,1)>A(i-1,1))
        timeVec = [timeVec; A(i,1)];
        angleVec = [angleVec; A(i,2)];
        voltVec = [voltVec; A(i,3)];
    end
end

timeVec=timeVec(1:300);
angleVec=angleVec(1:300)*(pi/180);
voltVec=voltVec(1:300);
speedVec = diff(angleVec)./diff(timeVec);

timeVec = timeVec(1:299);
speedVec = speedVec - mean(speedVec(101:299));

R=2.768;
L=0.0019;
J=2.92*10^(-5);
Kt=0.01401;
Ke=0.0152;
B=3.58*10^(-7);
s = tf('s');
secOrderXF = (Kt/(L*J))/(s^2 + (B/J+R/L)*s + (R*B+Kt*Ke)/(L*J));
plot(timeVec, (121.8-121.8*exp(-2.66*timeVec))*0.535);
hold on;
step(secOrderXF);