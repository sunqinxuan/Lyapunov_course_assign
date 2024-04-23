% ====================================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: controller.m
% Description: For control value plot.
% ====================================
function u=controller(t,x,a,b,k)
x_d=sin(t);
e=x_d-x;
dx_d=cos(t);
u=(dx_d+a*x^3+b*sin(t))+k*e;