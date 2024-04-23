% ====================================
% Author: Sun Qinxuan
% Last modified: Mar.10,2017
% Filename: controller.m
% Description: For control value plot.
% ====================================
function u=controller(t,x,k,ku)
ey=x(1)*cos(x(1))+x(1)^2+k*x(1)-x(2);
u=(-k*x(1)+ey)*(cos(x(1))-x(1)*sin(x(1))+2*x(1)+k)+ku*ey+x(1);
% x_d=10*sin(t);
% dx_d=10*cos(t);
% ddx_d=-10*sin(t);
% e=x_d-x(1);
% de=dx_d-x(2);
% r=de+alpha*e;
% u=-ddx_d+a*x(1)^3+b*x(1)*exp(-t)+c*log(abs(x(1))+1)/(x(2)^2+2)-alpha*(dx_d-x(2))-k*r;
% u=u/(x(1)^2+cos(x(1))^2);