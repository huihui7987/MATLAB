clc
clear
close all

N=200;
w0=0.5;
r=linspace(0,3*w0,N);
eta=linspace(0,2*pi,200);
[rho,theta]=meshgrid(r,eta);
[x,y]=pol2cart(theta,rho);
I=exp(-2*rho.^2/w0^2);

surf(x,y,I)
shading interp
xlabel('position /mm')
ylabel('position /mm')
zlabel('relative intensity /a.u.')
title('Gauss intensity distribution')
axis([-3*w0 3*w0 -3*w0 3*w0 0 1])
colorbar