% ===========================
% Author: Sun Qinxuan
% Last modified: Apr.16,2017
% Filename: emk_control.m
% Description: EMK control.
% ===========================
function dx=back_stepping(t,x,k,ku)
% ey=yd-y;
ey=x(1)*cos(x(1))+x(1)^2+k*x(1)-x(2);
u=(-k*x(1)+ey)*(cos(x(1))-x(1)*sin(x(1))+2*x(1)+k)+ku*ey+x(1);
dx(1,1)=x(1)*cos(x(1))+x(1)^2-x(2);
dx(2,1)=u;