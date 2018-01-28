clear all;
a=arduino('COM5','uno');

configurePin(a,'D9','DigitalOutput');
configurePin(a, 'D6','DigitalOutput');
configurePin(a, 'D7','DigitalOutput');
  
%Set initial rotation direction
writeDigitalPin(a, 'D6', 1);
writeDigitalPin(a, 'D7', 0);

dutycyc = 0.5;

while 1
  writePWMDutyCycle(a,'D9',dutycyc);
end
