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
% % %���亯��
% % Ta1 = (-taoa.^0.5*k1*k2*p)./(1-taoa*r1*r2*p.^2);
% 
% rr1=0.83;
% rr2=0.83;
% k1 = sqrt(1-rr1^2);
% k2 = sqrt(1-rr2^2);
% taoaa=1;
% %���亯��
% Taa1 = (-taoaa.^0.5*k1*k2*p)./(1-taoaa*rr1*rr2*p.^2);
% phii = angle(Taa1);
% plot(v,phii,'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('power(a.u.)');hold on;%title('������λ��');
% 
% 
% 
% % %͸����
% % Tn1 = ((1-r1^2)*(1-r2^2)*taoa)./(1-2*r1*r2*cos(phi)+(r1*r2*taoa)^2);
% % %��λ�仯
% % pv1=angle(Ta1);
% % pv2 = pi+phi/2+atan((taoa*r1*r2*sin(phi))/(1-taoa*r1*r2*cos(phi)));
% % figure;
% % plot(v,phi,'g','linewidth',2); xlabel('Frequency(Hz��');ylabel('Tran_Response');hold on;
% % figure;
% % plot(v,pv1,'g','linewidth',2); xlabel('Frequency(Hz��');ylabel('Tran_Response');hold on;
% % figure;
% % plot(v,pv2,'g','linewidth',2); xlabel('Frequency(Hz��');ylabel('Tran_Response');hold on;
R=50e-6;
lamda=1439.2e-9:1e-12:1439.8e-9;
v=(3e8./lamda)-(3e8./1439.5e-9);
%neff=3.17995709;
neff=3.18;

L = 2*pi*R;
phi = mod(L*neff./lamda*2*pi,2*pi);%~~~~-
p=exp(1i*phi/2);

rr1=0.9;
rr2=0.9;
k1 = sqrt(1-rr1^2);
k2 = sqrt(1-rr2^2);
taoaa=0.7;
%���亯��
%Taa1 = sqrt(taoaa)*(-k1*k2*p)./(1-taoaa*rr1*rr2*p.^2);
Taa1 = k1*k2*p./(1-rr1*rr2*p.^2);
phii = angle(Taa1);
phi_i = phii+(phii<0)*pi ;
plot(v,phi_i,'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('power(a.u.)');hold on;%title('������λ��');

figure;
Tn1 = ((1-rr1^2)*(1-rr2^2)*taoaa)./(1-2*rr1*rr2*cos(phi)+(rr1*rr2*taoaa)^2);
plot(v,abs(Tn1),'g','linewidth',2); xlabel('Frequency(GHz��');ylabel('Tran_Response');hold on;


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
taoa=0.801;
r=0.83;
%Ta1=
%exp(1i*(pi+phi)).*(taoa-r.*exp(-1i*phi))./(1-r.*taoa.*exp(1i*phi));%����Դ��ʽ������
%Ta1= (taoa-r)./(1-r.*taoa);
Ta1 = (r-taoa*p.^2)./(1-taoa*r*p.^2);%���ƹ�ʽ������
T1= (abs(Ta1)).^2;%~~~~-
%T = (tao^2-2*r*tao*cos(phi)+r^2)./(1-2*r*tao*cos(phi)+r^2*tao^2);
PHI1 = angle(Ta1);%~~~~-
% if r<=taoa
%     PHI1 = PHI1+(PHI1<0)*2*pi ;
% end
plot(v,PHI1,'r','linewidth',2); xlabel('Frequency(Hz��');ylabel('Phase Response');hold on;

figure;
H_V = pi+phi/2+1/(tan(taoaa*rr1*rr2*sin(phi)/(1-taoaa*rr1*rr2*cos(phi))));
plot(v,H_V,'r','linewidth',2); xlabel('Frequency(Hz��');ylabel('Phase Response');hold on;
figure;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FWHM=50e-12;            %��˹�ź�FWHM��ȣ�Ϊ50ps
time_window=100*FWHM;   %��˹�źŵĲ������ڿ�ȣ���ֵ�����˸���Ҷ�任���Ƶ�ʷֱ���
Ns=601;                %������
dt=time_window/(Ns-1);  %����ʱ����
t=0:dt:time_window;     %����ʱ��

% n1=1.5;
% n2=0.66;
% n3=1.5;

gauss_time=exp(-0.5*(2*sqrt(2*log(2))*(t-2.5e-9)/FWHM).^2); %��˹���壬����λ��2.5ns����
plot(t*1e+9,gauss_time,'linewidth',2.5);
xlabel('Time/ns');
ylabel('Amplitude/V');
title('Gauss pulse');

%===========���¼���˫���ס�˫�߹����ס�˫�߹������ܶ�=================
gauss_spec=fftshift(fft(ifftshift(gauss_time)));    %����Ҷ�任�����ҽ�����λ������
gauss_spec=gauss_spec/Ns;   %��ʵ�ʵķ���ֵ����һ����
df=1/time_window;               %Ƶ�ʷֱ���
k=floor(-(Ns-1)/2:(Ns-1)/2);    
% k=0:Ns-1;
double_f=k*df;   %˫��Ƶ�׶�Ӧ��Ƶ��

% figure;
% 
% plot(double_f*1e-9,gauss_spec,'linewidth',2.5);
% figure; %������
% plot(double_f*1e-9,abs(gauss_spec),'linewidth',2.5);
% xlabel('Frequency/GHz');
% ylabel('Amplitude/V');
% title('double Amplitude spectrum');
% 
% 
% figure; %��λ��
% plot(double_f*1e-9,angle(gauss_spec),'linewidth',2.5);
% xlabel('Frequency/GHz');
% ylabel('Phase/rad');
% title('double Phase spectrum');

figure; %��˹���幦����
double_power_spec_W=abs(gauss_spec).^2;                 %˫�߹����ף���λW��
double_power_spec_mW=double_power_spec_W*1e+3;          %˫�߹����ף���λmW��
double_power_spec_dBm=10*log10(double_power_spec_mW);   %˫�߹����ף���λdBm��
plot(double_f*1e-9,double_power_spec_mW/0.1132,'linewidth',2.5);
xlabel('Frequency/GHz');
ylabel('Power/dBm');
title('double Power spectrum');
figure;
%����΢�ֽ��
idea_gauss_diff=gauss_spec.*H_idea;
%����΢�ֹ�����
idea_gauss_diff_power_spec=(abs(idea_gauss_diff)).^2;
subplot(1,2,1)
plot(double_f*1e-9,idea_gauss_diff_power_spec,'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('power(a.u.)');title('����΢�ֹ�����**VI**');hold on;
subplot(1,2,2)
%%%΢��������
plot(double_f*1e-9,abs(idea_gauss_diff),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('idea_gauss_diff(a.u.)');hold on;

