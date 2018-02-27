clear all;
             
% --------------- ADJUSTABLE VARIABLES ---------------------%

TotalTime = 1; % specify the total simulation runtime

SetpointTime = 0.008; % specify time interval between loading setpoints

Y0 = 0.06;  % specify radius (quarter cycle length)

% -------------- END ADJUSTABLE VARIABLES ----------------- %

Period = 0.1; % specify the time required to traverse one cycle - set it to 0.1 because
             % we want 10 frames/sec

TimeVec_oneCycle = 0:SetpointTime:Period; % specify the time vector for setpoints in one cycle
Yd_oneCycle = Y0 * sin (2*pi*(1.0/Period)*TimeVec_oneCycle);

TimeVec = 0:SetpointTime:TotalTime;
Yd = Y0 * sin (2*pi*(1.0/Period)*TimeVec);

plot(TimeVec, Yd);



