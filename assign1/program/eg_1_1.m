clear all;clc;close all;
x0=1.0001;%0.9999;%
options=odeset('reltol',1e-8);
tic
[t,y]=ode45(@multi_equil,[0,20],x0,options);
toc
plot(t,y);
title('multi_equil');
xlabel('t');
ylabel('x');