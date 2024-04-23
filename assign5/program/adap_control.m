% ==============================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: adap_control.m
% Description: Adaptive control.
% ==============================
function dx=adap_control(t,x,gamma1,gamma2,k)
% x=[x_dot,x,a_hat,b_hat];
% dx=[x_ddot,x_dot,a_dot,b_dot];
alpha=1;
gamma=[gamma1,0;0,gamma2];
r=x(1)+alpha*x(2);
M=[x(2)^2+1;1];
M_dot=[2*x(2);0];
Y=[x(1);x(2)*sin(t)];
tmp=0.5*M_dot*r+Y+alpha*x(1)*M;
theta=[x(3);x(4)];
u=-tmp'*theta-k*r;
dx(1:2,1)=sys_model(t,x(1:2,1),u);
dx(3:4,1)=gamma*tmp*r;