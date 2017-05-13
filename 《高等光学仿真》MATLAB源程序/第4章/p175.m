clc
clear
close all

lambda = 1.55e-6;
b = 0.77273;
L = 0;
El = 1;
R = 1;
k = 2*pi/lambda;
ka = 20.3;
V = 2.4;

%º¯Êý¶¨Òå
theta = [0:0.00001:pi/6]';
degree = theta.*180./pi;
F_theta = [ka.*sin(theta).*besselj((L+1),ka.*sin(theta))-V.*sqrt(1-b)...
        .*besselj((L+1),V.*sqrt(1-b))/besselj(L,V.*sqrt(1-b))...
        .*besselj(L,ka.*sin(theta))]./[(V^2.*(1-b)-ka^2.*sin(theta).^2)...
        .*(V^2*b+ka^2.*sin(theta).^2)];
Eff = -j*El*exp(-j*k*R)/(k*R)*(ka*V)^2*cos(L.*theta).*F_theta;
Eff2 = abs(Eff).^2;
max0 = max(Eff2); 
EFF = Eff2./max0;

r1 = find(0.5>=EFF);
Xh = degree(r1(1));
Yh = Eff2(r1(1));
x = [ Xh, Xh];
y = [10e-6,Yh/max0];

r2=find(0<=EFF & EFF<=10e-10);
Xn=degree(r2(1));
Yn=EFF(r2(1));
x2=[Xn, Xn];
y2=[Yn,10e-3];

semilogy(degree,EFF,'k-',x,y,'r--',x2,y2,'b:')
text(Xh,10e-4,'\ThetaH')
text(Xn,10e-4,'\ThetaN')
title('LP_{01} mode')
xlabel('\theta(deg)')
ylabel('Normalized |EFFx|^2')
text(15,0.1,'V=2.4,b=0.77273 ')
text(15,0.05,'ka=20.3')
axis([0 30 10e-7 1])