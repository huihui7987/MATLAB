clc
clear
close all

Npoint = 501;
w0 = 0.5;
x = linspace(-3*w0,3*w0,Npoint);
y = linspace(-3*w0,3*w0,Npoint);
X = meshgrid(x,y);
Y = meshgrid(y,x);
Y = Y';
R = sqrt(X.^2 + Y.^2);
I = exp(-2*R.^2/w0^2);

imagesc(x,y,I,[0 1]);
colormap gray;
colorbar
xlabel('x /mm')
ylabel('y /mm')
title('Gauss intensity distribution')
axis([-3*w0 3*w0 -3*w0 3*w0])