clear all;
a=arduino('COM5','uno');

%set motor control pins
configurePin(a,'D9','DigitalOutput');
configurePin(a, 'D6','DigitalOutput');
configurePin(a, 'D7','DigitalOutput');

%set encoder read pins
configurePin(a, 'D4', 'DigitalInput');
configurePin(a, 'D5', 'DigitalInput');
  
%Set initial rotation direction
writeDigitalPin(a, 'D6', 1);
writeDigitalPin(a, 'D7', 0);

dutycyc = 0.8;
period = 0;
frequency = 0;

writePWMDutyCycle(a,'D9',dutycyc);

while 1
  tic;
  readDigitalPin(a, 'D4');
  period = toc;
end

