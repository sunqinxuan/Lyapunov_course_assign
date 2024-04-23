% ==============================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: high_freq_feedback.m
% Description: High frequency feedback robust control.
% ==============================
function dx=high_freq_feedback(t,x,k,eps)
% x=[x_dot,x];
% dx=[x_ddot,x_dot];
alpha=1;
r=x(1)+alpha*x(2);
rho=2*abs(x(2)*r)+(2*x(2)^2+7)*abs(x(1))+3*abs(x(2)*sin(t));
u=-rho^2*r/(rho*abs(r)+eps)-k*r;
dx(1:2,1)=sys_model(t,x(1:2,1),u);