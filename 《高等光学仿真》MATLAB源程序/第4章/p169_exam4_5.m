% Radiation pattern of field radiated by LP01 mode
clc
clear
close all

N = 10000;
L = 0;

V = 2.4;
b = 0.53303;
ka = 20.3;

theta = linspace(-pi/2,pi/2,N);
Fl = (ka*sin(theta).*besselj(L+1,ka*sin(theta))- ...
    V*sqrt(1-b)*besselj(L+1,V*sqrt(1-b))/...
    besselj(L,V*sqrt(1-b))* besselj(L,ka*sin(theta)) )./...
    ((V^2*(1-b)-(ka*sin(theta)).^2).*(V^2*b+(ka*sin(theta)).^2));

Effx= cos(L.*theta).*Fl;

y = abs(Effx).^2;
Ny = y/max(y);
Py = 10*log10(Ny)+100;
Py(find(Py<0))=0;

polar(theta,Py)
text(100,-70,['LP' int2str(L) '1' ' mode'])
text(100,-80, ['V=' num2str(V)])
text(100,-90, ['b=' num2str(b)])
text(100,-100, ['ka=' num2str(ka)])