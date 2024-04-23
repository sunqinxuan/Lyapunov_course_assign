% ===========================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: emk_control.m
% Description: EMK control.
% ===========================
function dx=emk_control(t,x,a,b,k)
x_d=sin(t);
e=x_d-x;
dx_d=cos(t);
u=(dx_d+a*x^3+b*sin(t))+k*e;
dx=sys_model(t,x)+u;