% clear all
% lamda=1539.2e-9:1e-12:1539.8e-9;
% v=(3e8./lamda)-(3e8./1539.5e-9);
% 
% R=50e-6;
% %neff=3.18;
% neff=3.17995709;
% r1=0.83;
% r2=0.83;
% L = 2*pi*R;
% phi = mod(L*neff./lamda*2*pi,2*pi);%~~~~-
% %phi = 4*pi*pi*neff*R./lamda;
% %phi = (2*pi*pi*R*(3890e-9-lamda)./lamda,pi);
% p=exp(1i*phi/2);
% %taoa=0.830012;
% taoa=1;
% 
% % k1 = sqrt(1-r1^2);
% % k2 = sqrt(1-r2^2);
% % %传输函数
% % Ta1 = (-taoa.^0.5*k1*k2*p)./(1-taoa*r1*r2*p.^2);
% 
% rr1=0.83;
% rr2=0.83;
% k1 = sqrt(1-rr1^2);
% k2 = sqrt(1-rr2^2);
% taoaa=1;
% %传输函数
% Taa1 = (-taoaa.^0.5*k1*k2*p)./(1-taoaa*rr1*rr2*p.^2);
% phii = angle(Taa1);
% plot(v,phii,'r','linewidth',2.5); xlabel('Frequency(GHz）');ylabel('power(a.u.)');hold on;%title('理想相位谱');
% 
% 
% 
% % %透射谱
% % Tn1 = ((1-r1^2)*(1-r2^2)*taoa)./(1-2*r1*r2*cos(phi)+(r1*r2*taoa)^2);
% % %相位变化
% % pv1=angle(Ta1);
% % pv2 = pi+phi/2+atan((taoa*r1*r2*sin(phi))/(1-taoa*r1*r2*cos(phi)));
% % figure;
% % plot(v,phi,'g','linewidth',2); xlabel('Frequency(Hz）');ylabel('Tran_Response');hold on;
% % figure;
% % plot(v,pv1,'g','linewidth',2); xlabel('Frequency(Hz）');ylabel('Tran_Response');hold on;
% % figure;
% % plot(v,pv2,'g','linewidth',2); xlabel('Frequency(Hz）');ylabel('Tran_Response');hold on;
R=50e-6;
lamda=1439.2e-9:1e-12:1439.8e-9;
v=(3e8./lamda)-(3e8./1439.5e-9);
%neff=3.17995709;
neff=3.17995;

L = 2*pi*R;
phi = mod(L*neff./lamda*2*pi,2*pi);%~~~~-
p=exp(1i*phi/2);

rr1=0.8;
rr2=0.8;
k1 = sqrt(1-rr1^2);
k2 = sqrt(1-rr2^2);
taoaa=0.7;
taobb=0.6;
taocc=0.79;
taodd=0.69;
taoee=0.59;
%传输函数
%Taa1 = sqrt(taoaa)*(-k1*k2*p)./(1-taoaa*rr1*rr2*p.^2);
Taa1 = -taoaa*k1*k2*p./(1-taoaa*rr1*rr2*p.^2);
Tbb1 = -taobb*k1*k2*p./(1-taobb*rr1*rr2*p.^2);
Tcc1 = -taocc*k1*k2*p./(1-taocc*rr1*rr2*p.^2);
Tdd1 = -taodd*k1*k2*p./(1-taodd*rr1*rr2*p.^2);
Tee1 = -taoee*k1*k2*p./(1-taoee*rr1*rr2*p.^2);
phaa = angle(Taa1);
phi_a = phaa+(phaa<0)*pi ;
phbb = angle(Tbb1);
phi_b = phbb+(phbb<0)*pi ;
phcc = angle(Tcc1);
phi_c = phcc+(phcc<0)*pi ;
phdd = angle(Tdd1);
phi_d = phdd+(phdd<0)*pi ;
phee = angle(Tee1);
phi_e = phee+(phee<0)*pi ;
plot(v,phi_a/pi,'r','linewidth',2.5); xlabel('Frequency(Hz）');ylabel('Phase Response(\pi)');hold on;%title('理想相位谱');
plot(v,phi_b/pi,'g','linewidth',2.5); xlabel('Frequency(Hz）');ylabel('Phase_Response(a.u.)');hold on;%title('理想相位谱');
plot(v,phi_c/pi,'b','linewidth',2.5); xlabel('Frequency(Hz）');ylabel('Phase_Response(a.u.)');hold on;%title('理想相位谱');
plot(v,phi_d/pi,'y','linewidth',2.5); xlabel('Frequency(Hz）');ylabel('Phase_Response(a.u.)');hold on;%title('理想相位谱');
plot(v,phi_e/pi,'r','linewidth',2.5); xlabel('Frequency(Hz）');ylabel('Phase Response(\pi)');hold on;%title('理想相位谱');
legend('t=0.99','t=0.89','t=0.79','t=0.69','t=0.59')




figure;
Tn1 = ((1-rr1^2)*(1-rr2^2)*taoaa)./(1-2*rr1*rr2*cos(phi)+(rr1*rr2*taoaa)^2);
plot(v,abs(Tn1),'g','linewidth',2); xlabel('Frequency(GHz）');ylabel('Tran_Response');hold on;
Tn2 = ((1-rr1^2)*(1-rr2^2)*taobb)./(1-2*rr1*rr2*cos(phi)+(rr1*rr2*taobb)^2);
plot(v,abs(Tn2),'g','linewidth',2); xlabel('Frequency(GHz）');ylabel('Tran_Response');hold on;