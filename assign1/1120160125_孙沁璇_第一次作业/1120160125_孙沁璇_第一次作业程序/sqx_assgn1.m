clear all;clc;
close all;
options=odeset('reltol',1e-8);
last_time=20;

x0=[2,3];
tic
[t1,y1]=ode45(@chaos,[0,last_time],x0,options);
toc

x0=[2.01,3.01];
tic
[t2,y2]=ode45(@chaos,[0,last_time],x0,options);
toc

figure;
plot(y1(:,1),y1(:,2),'b-');hold on;
plot(y2(:,1),y2(:,2),'r--');hold on;
title('phase plane');
xlabel('x');
ylabel('dx/dt');
legend('x0=[2,3]','x0=[2.01,3.01]');

figure;
plot(t1,y1(:,1),'b-');hold on;
plot(t2,y2(:,1),'r--');hold on;
title('response');
xlabel('t');
ylabel('x');
legend('x0=[2,3]','x0=[2.01,3.01]');