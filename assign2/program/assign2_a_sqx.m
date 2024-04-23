% ==========================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: assign2_a_sqx.m
% Description: EMK control.
% ==========================
clear all;clc;
% close all;
options=odeset('reltol',1e-8);
last_time=20;
x0=2;
a=1.7;
b=-2.4;
k=5;

[t_sys,y_sys]=ode45(@sys_model,[0,last_time],x0,options);
[t_ctl,y_ctl]=ode45(@emk_control,[0,last_time],x0,options,a,b,k);

% t_dsr=0:0.001:last_time;
y_dsr=sin(t_ctl);
for n=1:size(t_ctl,1)
    u_ctl(n,1)=controller(t_ctl(n),y_ctl(n),a,b,k);
end
ctl_error=y_dsr-y_ctl;
for n=1:size(ctl_error,1)
    if abs(ctl_error(n))<0.001
        t_ctl(n)
        break;
    end
end

figure;
plot(t_ctl,y_dsr,'k--');hold on;
plot(t_ctl,y_ctl,'g--');hold on;
% title('response');
% xlabel('t');
% ylabel('x');
% legend('controlled','desired');
% figure;
plot(t_sys,y_sys,'y--');hold on;
plot(t_ctl,ctl_error,'r-');hold on;
plot(t_ctl,u_ctl,'b--');hold on;
title('k=5');
xlabel('t');
% ylabel('x');
legend('x_d','x(controlled)','x(system)','e','u');