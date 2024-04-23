% ===========================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: sys_model.m
% Description: System model.
% ===========================
function dx=sys_model(t,x)
a=1.7;
b=-2.4;
dx=-a*x^3-b*sin(t);