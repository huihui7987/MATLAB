R=50e-6;
lamda=1439e-9:1e-12:1440e-9;
v=(3e8./lamda)-(3e8./1439.5e-9);
neff=3.17995709;
%neff=3.17996;
%r=0.83;

L = 2*pi*R;
phi = 4*pi^2*neff*R./lambda;%mod(L*neff./lamda*2*pi,2*pi);%~~~~-

p=exp(1i*phi/2);

r1 = 0.9;
r2 = 0.9;
k1 = sqrt(1-r1^2);
k2 = sqrt(1-r2^2);

taoa=0.83;
%Ta1=
%exp(1i*(pi+phi)).*(taoa-r.*exp(-1i*phi))./(1-r.*taoa.*exp(1i*phi));%晋博源公式，可以
%Ta1= (taoa-r)./(1-r.*taoa);
Ta1 = (-taoa*k1*k2*p)./(1-taoa*r1*r2*p.^2);%华科公式，可以
T1= (abs(Ta1)).^2;%~~~~-
%T = (tao^2-2*r*tao*cos(phi)+r^2)./(1-2*r*tao*cos(phi)+r^2*tao^2);
PHI1 = angle(Ta1);%~~~~-
if r1<=taoa
    PHI1 = PHI1+(PHI1<0)*2*pi ;
end
%PHI=pi+phi+atan((r.*sin(phi))./(tao-r.*cos(phi)))+atan((r*tao.*sin(phi))./(1-tao*r.*cos(phi)))
taob=0.801;%对应0.4阶
%Ta2= exp(1i*(pi+phi)).*(taob-r.*exp(-1i*phi))./(1-r.*taob.*exp(1i*phi));
%Ta2 = (r-taob*p.^2)./(1-taob*r*p.^2);

Ta2 = (-taob*k1*k2*p)./(1-taob*r1*r2*p.^2);

T2= (abs(Ta2)).^2;%~~~~-
PHI2 = angle(Ta2);%~~
if r1<=taob
    PHI1 = PHI1+(PHI1<0)*2*pi ;
end

taoc=0.846;%1.5阶，对应n1=1.5
%Ta3= exp(1i*(pi+phi)).*(taoc-r.*exp(-1i*phi))./(1-r.*taoc.*exp(1i*phi));
Ta3 = (-taoc*k1*k2*p)./(1-taoc*r1*r2*p.^2);
T3= (abs(Ta3)).^2;%~~~~-
PHI3 = angle(Ta3);%~~
if r1<=taoc
    PHI3 = PHI3+(PHI3<0)*2*pi ;
end

ff_o =Ta3 .* gauss_spec;
ff_u = Ta2 .* gauss_spec;
ff_c = Ta1 .*gauss_spec;
figure;
subplot(1,2,1);
plot(double_f,T1,'r','linewidth',2); xlabel('Frequency(Hz）');ylabel('Intensity Transmission');hold on;
plot(v,T2,'b','linewidth',2); xlabel('Frequency(Hz）');ylabel('Intensity Transmission');hold on;
plot(v,T3,'g','linewidth',2); xlabel('Frequency(Hz）');ylabel('Intensity Transmission');hold on;
legend('Critical-coupled','Under-coupled','Over-coupled')
subplot(1,2,2);
plot(v,PHI1,'r','linewidth',2); xlabel('Frequency(Hz）');ylabel('Phase Response');hold on;
plot(v,PHI2,'b','linewidth',2); xlabel('Frequency(Hz）');ylabel('Phase Response');hold on;
plot(v,PHI3,'g','linewidth',2); xlabel('Frequency(Hz）');ylabel('Phase Response');hold on;
legend('Critical-coupled','Under-coupled','Over-coupled PHI3')