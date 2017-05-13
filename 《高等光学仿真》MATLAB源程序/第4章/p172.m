clc
clear
close all
%Gaussian 场辐射形式
lambda = 1.55e-6;
V = 2.4;
E0 = 1;
R = 1;
k = 2*pi/lambda;
kw = 20.3;
w = kw/k;
kwsin=[0:0.001:15]';

%Gaussian函数定义
E_GBFFx = j*k*E0*exp(-j*k*R)/R*(w^2/2)*exp(-kwsin.^2./4);
E_GB=10.*log10(abs(E_GBFFx).^2/max(abs(E_GBFFx).^2));

hold on
axis([0 15 -100 0])
plot(kwsin,E_GB,'r-')

%精确场辐射形式
b = 1.5;
L = 0;
El=0.01;
R=1;
k=0.01;
ka=20.3;
kasin=[0:0.001:15]';
theta=asin(kasin/ka);

%精确函数定义
F_theta=[kasin.*besselj((L+1),kasin)-V.*sqrt(1-b)...
        .*besselj((L+1),V.*sqrt(1-b))/besselj(L,V.*sqrt(1-b))...
        .*besselj(L,kasin)]./[(V^2.*(1-b)-kasin.^2)...
        .*(V^2*b+kasin.^2)];
E_FFx=-j*El*exp(-j*k*R)/(k*R)*(ka*V)^2.*cos(L.*theta).*F_theta;
E_FF=10.*log10(abs(E_FFx).^2/max(abs(E_FFx).^2));

title('LP01 mode ')
xlabel('kasin\Theta')
ylabel('Normalized |EFFx|^2(dB)')
plot(kasin,E_FF,'b--')
legend('Gaussian','Exact')
text(10,-20,'V=2.4');

%画出x=2的直线
x1=[2,2];
y1=[-100,-2];
plot(x1,y1,'g-.')
text(0.5,-40,'kasin\Theta=2');
%画出最大值下降到`1/{\rm e}^2`处的直线
x2=[1,10];
y2=[10*log10(1/exp(2)),10*log10(1/exp(2))];
plot(x2,y2,'g-.')
text(5,y2(1),'max/{\rm e}^2')