clc
clear
close all

a = 5e-6;
NA = 0.1;
lambda = [1.32e-6 1.55e-6];

V = 2*pi*a*NA./lambda;
W = 1.145*V - 1.0001;
U = sqrt(V.^2-W.^2);
MFD = (0.65+1.619./V.^(3/2)+2.879./V.^6)*2*a;

r = linspace(-3*a,3*a,100);
for i = 1:length(lambda)
    subplot(1,length(lambda),i)
    IrB = (besselj(0,U(i)).*besselk(0,W(i).*abs(r/a))./besselk(0,W(i))).^2;
    IrB(find(abs(r)<a)) = besselj(0,U(i)*r(find(abs(r)<a))/a).^2;
    IrG = exp(-2*r.^2/(MFD(i)/2)^2);
    plot(r,IrG,r,IrB,'r--')
    axis([-3*a 3*a 0 1])
    title(['\lambda = ' num2str(lambda(i)) ',V=' num2str(V(i))])
    xlabel('r')
    ylabel('I(r)')

    line([-MFD(i)/2 MFD(i)/2],[exp(-2) exp(-2)])
    text(-a,exp(-2)+.02,['MFD=' num2str(MFD(i))])
end