% MATLAB的GA工具只求函数的(近似)最小值，需要将目标函数取反
% x表示Tpsm
function [ y ] = target(x)
%global P12;
%global P15;
%global P51;
%global P54;
%global P24;
%global P23;
%global P42;
%global P35;

global lamda;
global T3324;
global Pra;
global Nmax;
global concurrentDevices;
global resourceNumbers;


lamda = 5;
T3324 = 255;
concurrentDevices = 20;
resourceNumbers = 100;
Pra = exp(-concurrentDevices/resourceNumbers);
Nmax = 128;


P12 = 1 - exp(-lamda * x);
P15 = exp(-lamda * x);
P51 = exp(-lamda * T3324);
P54 = 1 - P51;
P24 = power(1-Pra, Nmax);
P23 = 1 - P24;
P42 = 1;
P35 = 1;

y = -1.00 / ((1 + P51 + P51*P12 + P51*P12*P23) + (2 + P23) * (1 - P51 + P51*P12*P24)/(1 - P24));
%y = -x-10*sin(5*x)-7*cos(4*x);
end

