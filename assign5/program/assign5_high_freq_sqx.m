% ==============================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: assign5_high_freq_sqx.m
% Description: High frequency feedback robust control.
% ==============================
clear all;clc;
close all;
options=odeset('reltol',1e-4);
last_time=50;
% x0_sys=2;
x0=[1;8];
k=1;
eps=0.1;

% [t_sys,y_sys]=ode45(@sys_model,[0,last_time],x0_sys,options);
[t_ctl,y_ctl]=ode45(@high_freq_feedback,[0,last_time],x0,options,k,eps);

% y_dsr=sin(t_ctl);
for n=1:size(t_ctl,1)
    u_ctl(n,1)=controller(t_ctl(n),[y_ctl(n,1);y_ctl(n,2)],k,eps);
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
title('high gain feedback robust control');
xlabel('t');
% ylabel('x');
legend('x','u');