% ==========================
% Author: Sun Qinxuan
% Last modified: Apr.16,2017
% Filename: assign2_a_sqx.m
% Description: EMK control.
% ==========================
clear all;clc;
close all;
options=odeset('reltol',1e-7);
last_time=20;
x0=[0;0];
a=1.7;
b=-2.4;
c=2.1;
alpha=1;
k=1;

% [t_sys,y_sys]=ode45(@sys_model,[0,last_time],x0,options);
[t_ctl,y_ctl]=ode45(@emk_control,[0,last_time],x0,options,a,b,c,alpha,k);

% t_dsr=0:0.001:last_time;
y_dsr=10*sin(t_ctl);
for n=1:size(t_ctl,1)
    [u_ctl(n,1),r(n,1)]=controller(t_ctl(n),y_ctl(n,:),a,b,c,alpha,k);
end
ctl_error=y_dsr-y_ctl(:,1);
% for n=1:size(ctl_error,1)
%     if abs(ctl_error(n))<0.001
%         t_ctl(n)
%         break;
%     end
% end

figure;
plot(t_ctl,y_dsr,'k--');hold on;
plot(t_ctl,y_ctl(:,1),'g--');hold on;
plot(t_ctl,ctl_error,'r-');hold on;
plot(t_ctl,u_ctl,'b--');hold on;
% plot(t_ctl,r,'k.-');hold on;
title('EMK controller - filtered signal');
xlabel('t');
legend('x_d','x(controlled)','e','u');
% axis([0 0.5 -1 1]);