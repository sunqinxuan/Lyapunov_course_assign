function dx=chaos(t,x)
dx=[x(2);-0.1*x(2)-x(1)^5+6*sin(t)];