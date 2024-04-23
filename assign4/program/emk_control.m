% ===========================
% Author: Sun Qinxuan
% Last modified: Apr.16,2017
% Filename: emk_control.m
% Description: EMK control.
% ===========================
function dx=emk_control(t,x,a,b,c,alpha,k)
x_d=10*sin(t);
dx_d=10*cos(t);
ddx_d=-10*sin(t);
e=x_d-x(1);
de=dx_d-x(2);
r=de+alpha*e;
% (x(1)^2+cos(x(1))^2)u
u=(ddx_d-a*x(1)^3-b*x(1)*exp(-t)-c*log(abs(x(1))+1)/(x(2)^2+2)+alpha*(dx_d-x(2))+k*r)/(x(1)^2+cos(x(1))*cos(x(1)));
% dx=sys_model(t,x)+[0,u];
% dx=dx';
dx(1,1)=x(2);
dx(2,1)=a*x(1)^3+b*x(1)*exp(-t)+c*log(abs(x(1))+1)/(x(2)^2+2)+(x(1)^2+cos(x(1))*cos(x(1)))*u;