% ====================================
% Author: Sun Qinxuan
% Last modified: Jun.6,2017
% Filename: controller.m
% Description: For control value plot.
% ====================================
function u=controller(t,x,k,eps)
% - adaptive control
% alpha=1;
% r=x(1)+alpha*x(2);
% M=[x(2)^2+1;1];
% M_dot=[2*x(2);0];
% Y=[x(1);x(2)*sin(t)];
% tmp=0.5*M_dot*r+Y+alpha*x(1)*M;
% theta=[x(3);x(4)];
% u=-tmp'*theta-k*r;

% - sliding mode
alpha=1;
r=x(1)+alpha*x(2);
rho=3*abs(x(2)*r)+(3*x(2)^2+11)*abs(x(1))+5*abs(x(2)*sin(t));
% u=-rho*sign(r)-k*r;

% u=-kn*rho^2*r-k*r;

u=-rho^2*r/(rho*abs(r)+eps)-k*r;