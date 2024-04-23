% ==============================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: sliding_mode_control.m
% Description: Sliding mode control.
% ==============================
function dx=sliding_mode_control(t,x,k)
% x=[x_dot,x];
% dx=[x_ddot,x_dot];
alpha=1;
r=x(1)+alpha*x(2);
rho=2*abs(x(2)*r)+(2*x(2)^2+7)*abs(x(1))+3*abs(x(2)*sin(t));
u=-rho*sign(r)-k*r;
dx(1:2,1)=sys_model(t,x(1:2,1),u);