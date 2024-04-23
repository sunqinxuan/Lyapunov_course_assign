% ==============================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: assign2_b_sqx.m
% Description: Adaptive control.
% ==============================
clear all;clc;
% close all;
options=odeset('reltol',1e-8);
last_time=70;
x0_sys=2;
x0=[2;-1;3];
% a=1.7;
% b=-2.4;
k=5;
gamma1=5;
gamma2=5;

[t_sys,y_sys]=ode45(@sys_model,[0,last_time],x0_sys,options);
[t_ctl,y_ctl]=ode45(@adap_control,[0,last_time],x0,options,gamma1,gamma2,k);

y_dsr=sin(t_ctl);
for n=1:size(t_ctl,1)
    u_ctl(n,1)=controller(t_ctl(n),y_ctl(n,1),y_ctl(n,2),y_ctl(n,3),k);
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
plot(t_sys,y_sys,'y--');hold on;
plot(t_ctl,ctl_error,'r-');hold on;
plot(t_ctl,u_ctl,'b--');hold on;
plot(t_ctl,y_ctl(:,2),'k-.');hold on;
plot(t_ctl,y_ctl(:,3),'b-.');hold on;
title('k=5,\Gamma_1=5,\Gamma_2=5');
xlabel('t');
% ylabel('x');
legend('x_d','x(controlled)','x(system)','e','u','a(estimated)','b(estimated)');