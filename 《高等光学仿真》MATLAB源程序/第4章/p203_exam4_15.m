syms x y
vpa(int(int(y*sin(x)+x*cos(y),x,pi,2*pi),y,0,pi))
format long g 
dblquad(@(x,y)y*sin(x)+x*cos(y),pi,2*pi,0,pi)