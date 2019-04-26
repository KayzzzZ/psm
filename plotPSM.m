function plotPSM()

x = 0:0.1:50000;

global lamda;
global T3324;
global Pra;
global Nmax;
global concurrentDevices;
global resourceNumbers;


lamda = 0.00016667;
T3324 = 4.25;
Nmax = 128;
concurrentDevices = 20;
resourceNumbers = 100;
Pra = exp(-concurrentDevices/resourceNumbers);

P12 = 1 - exp(-lamda * x);
P15 = exp(-lamda * x);
P51 = exp(-lamda * T3324);
P54 = 1 - P51;
P24 = power(1-Pra, Nmax);
P23 = 1 - P24;
P42 = 1;
P35 = 1;

% y = q1
y = -1 ./ ((1 + P51 + P51*P12 + P51*P12*P23) + (2 + P23) * (1 - P51 + P51*P12*P24)/(1 - P24));
plot(x, y);
