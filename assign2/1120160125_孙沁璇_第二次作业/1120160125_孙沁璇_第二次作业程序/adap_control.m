% ==============================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: adap_control.m
% Description: Adaptive control.
% ==============================
function dx=adap_control(t,x,gamma1,gamma2,k)
% dx=[x_dot,a_dot,b_dot];
x_d=sin(t);
e=x_d-x(1);
dx_d=cos(t);
u=(dx_d+x(2)*x(1)^3+x(3)*sin(t))+k*e;
dx=[sys_model(t,x(1))+u;gamma1*e*x(1)^3;gamma2*e*sin(t)];