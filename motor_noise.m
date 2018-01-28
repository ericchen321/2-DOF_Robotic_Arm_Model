clear all;

% with noise
fileID0 = fopen('ubc_motor_noise_form.txt','r');
formatSpec = '%f %f';
sizeA = [2 inf];
A = fscanf(fileID0,formatSpec,sizeA);
A = A';
fclose(fileID0);
TimeVec = A(:,1);
VoltVec = A(:,2);
L = length(TimeVec);
Fs = length(TimeVec)/(TimeVec(end)-TimeVec(1));

figure;
plot(TimeVec, VoltVec);

figure;
Y = fft(VoltVec);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1); 
axis([-100 9500 0 5]);
title('Single-Sided Amplitude Spectrum of Volt(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');

% with perfect squre wave
fileID1 = fopen('ubc_perfec_square_wave_form.txt','r');
formatSpec = '%f %f';
sizeA = [2 inf];
A = fscanf(fileID1,formatSpec,sizeA);
A = A';
fclose(fileID1);
TimeVec = A(:,1);
VoltVec = A(:,2);
L = length(TimeVec);
Fs = length(TimeVec)/(TimeVec(end)-TimeVec(1));

figure;
plot(TimeVec, VoltVec);

figure;
Y = fft(VoltVec);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1); 
axis([-100 9500 0 5]);
title('Single-Sided Amplitude Spectrum of Perfect square wave');
xlabel('f (Hz)');
ylabel('|P1(f)|');