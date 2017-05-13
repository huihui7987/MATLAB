% Normalized irradiance pattern radiated by LP01 modes
% as a function kasin(theta)
clc
clear
close all

N = 10000;
L = 0;

V = [1.0 1.8 2.4];
b = 0.53303;
ka = 20.3;

kasin = linspace(0,15,N);
theta = asin(kasin/ka)';

for i = 1:length(V)
Fl(:,i) = (kasin.*besselj(L+1,kasin)- ...
    V(i)*sqrt(1-b)*besselj(L+1,V(i)*sqrt(1-b))/...
    besselj(L,V(i)*sqrt(1-b))* besselj(L,kasin) )./...
    ((V(i)^2*(1-b)-(kasin).^2).*(V(i)^2*b+(kasin).^2));

Effx(:,i) = cos(L*theta).*Fl(:,i);
end

y = abs(Effx).^2;
Ny = y/diag(max(y));
Py = 10*log10(Ny);

figure,grid on,hold on
plot(kasin,Py(:,1),'r-')
plot(kasin,Py(:,2),'b--')
plot(kasin,Py(:,3),'k:')
axis([0 15 -100 0])
title('LP01 mode')
xlabel('kasin\Theta')
ylabel('Normalized |EFFx|^2(dB)')
legend('V=1.0','V=1.8','V=2.4')