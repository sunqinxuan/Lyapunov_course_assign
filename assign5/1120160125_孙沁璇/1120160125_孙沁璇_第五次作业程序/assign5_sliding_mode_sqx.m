% ==============================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: assign5_sliding_mode_sqx.m
% Description: Sliding mode control.
% ==============================
clear all;clc;
close all;
options=odeset('reltol',1e-4);
last_time=20;
% x0_sys=2;
x0=[1;1];
k=1;

% [t_sys,y_sys]=ode45(@sys_model,[0,last_time],x0_sys,options);
[t_ctl,y_ctl]=ode45(@sliding_mode_control,[0,last_time],x0,options,k);

% y_dsr=sin(t_ctl);
for n=1:size(t_ctl,1)
    u_ctl(n,1)=controller(t_ctl(n),[y_ctl(n,1);y_ctl(n,2)],k);
end
% ctl_error=y_dsr-y_ctl(:,1);
% for n=1:size(ctl_error,1)
%     if abs(ctl_error(n))<0.001
%         t_ctl(n)
%         break;
%     end
% end

figure;
plot(t_ctl,y_ctl(:,2),'r-');hold on;
% plot(t_sys,y_sys,'y--');hold on;
% plot(t_ctl,ctl_error,'r-');hold on;
plot(t_ctl,u_ctl,'k-');hold on;
% plot(t_ctl,y_ctl(:,2),'b--');hold on;
% plot(t_ctl,y_ctl(:,3),'g--');hold on;
title('sliding mode control');
xlabel('t');
% ylabel('x');
legend('x','u');