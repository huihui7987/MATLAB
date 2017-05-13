clc
clear
close all

w0=0.5e-3;
lambda=1.55e-6;
ZR=pi*w0^2/lambda;
Lz= 3*ZR;

N=200;
z=linspace(-Lz,Lz,N);
y=linspace(-4*w0,4*w0,N);
[py,pz]=meshgrid(y,z);
wz=w0*sqrt(1+(lambda*pz/pi/w0^2).^2);
Iopt=w0^2./wz.^2.*exp(-2*py.^2./wz.^2);
surf(pz,py,Iopt);
shading interp; 
xlabel('z /mm');
ylabel('y /mm');
zlabel('relative intensity /a.u.');
axis([-3*ZR 3*ZR -Inf Inf -Inf Inf])
title('Intensity of Gauss beam propagation');
colorbar;
colormap hot; 
view(2)