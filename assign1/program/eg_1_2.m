clear all;clc;
close all;
x0=[-1,-3];%[5,5];%
options=odeset('reltol',1e-8);
tic
[t,y]=ode45(@limit_cycle,[0,100],x0,options);
toc
% hold on;
plot(y(:,1),y(:,2),'r');
title('limit_cycle');
xlabel('x');
ylabel('dx/dt');