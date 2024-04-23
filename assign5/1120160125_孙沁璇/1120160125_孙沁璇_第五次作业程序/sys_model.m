% ===========================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: sys_model.m
% Description: System model.
% ===========================
function dx=sys_model(t,x,u)
% x=[x_dot,x];
% dx=[x_ddot,x_dot];
theta=[1.7;2.4];
M=[x(2)^2+1;1];
Y=[x(1);x(2)*sin(t)];
dx=[(Y'*theta+u)/(M'*theta);x(1)];