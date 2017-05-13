clc;
clear;

FWHM=62e-12;            %��˹�ź�FWHM��ȣ�Ϊ62ps
time_window=2000*FWHM;   %��˹�źŵĲ������ڿ�ȣ���ֵ�����˸���Ҷ�任���Ƶ�ʷֱ���
Ns=1001;                %������
dt=time_window/(Ns-1);  %����ʱ����
t=0:dt:time_window;     %����ʱ��

gauss_time=exp(-0.5*(2*sqrt(2*log(2))*(t-2.5e-9)/FWHM).^2); %��˹���壬����λ��2.5ns����

%===========���¼���˫���ס�˫�߹����ס�˫�߹������ܶ�=================
gauss_spec=fftshift(fft(ifftshift(gauss_time)));    %����Ҷ�任�����ҽ�����λ������
gauss_spec=gauss_spec/Ns;   %��ʵ�ʵķ���ֵ����һ����
df=1/time_window;               %Ƶ�ʷֱ���
k=floor(-(Ns-1)/2:(Ns-1)/2);    
double_f=k*df;   %˫��Ƶ�׶�Ӧ��Ƶ��
figure;
plot(double_f*1e-9,(gauss_spec),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('Tdaa');title('gauss_spec');hold
%% ���봫�亯��
kk1 = 1./((1i*2*pi*double_f*1e-9)+0.038);
kk2 = 1./((1i*2*pi*double_f*1e-9)+0.054);
kk3 = 1./((1i*2*pi*double_f*1e-9)+0.070);
kk4 = 1./((1i*2*pi*double_f*1e-9)+0.084);
kk5 = 1./((1i*2*pi*double_f*1e-9)+0.11);
kk6 = 1./((1i*2*pi*double_f*1e-9)+0);

figure;%������λ�仯
plot(double_f*1e-9,angle(kk1),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('kk1-Intensity Transmission H1');hold on;
figure;%����͸����
res_rr = abs(kk5.^2);
plot(double_f*1e-9,res_rr/342.9,'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('kk1-Intensity Transmission H1');hold on;

hh1 = gauss_spec .* kk1;
% plot(double_f*1e-9,abs(hh),'r','linewidth',2.5); xlabel('Frequency(Hz��');ylabel('Intensity Transmission H1');hold on;
figure;
hht1 = abs(ifft(hh1))/1.603e-6;
hh2 = gauss_spec .* kk2;
hht2 = abs(ifft(hh2))/1.603e-6;
hh3 = gauss_spec .* kk3;
hht3 = abs(ifft(hh3))/1.603e-6;
hh4 = gauss_spec .* kk4;
hht4 = abs(ifft(hh4))/1.603e-6;
hh5 = gauss_spec .* kk5;
hht5 = abs(ifft(hh5))/1.603e-6;
hh6 = gauss_spec .* kk6;
hht6 = abs(ifft(hh6))/1.603e-6;
plot(t*1e+9,abs(hht1),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht2),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht3),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht4),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht5),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht6),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
legend('k=0.038','k=0.054','k=0.070','k=0.084','k=0.15','k=0.25')

%΢��
Np=1001;
lambda=linspace(1560e-9,1570e-9,Np);
%v = (3e8./lambda);%-(3e8./1564e-9);
neff=3.1;
R=5.06e-6;
alpha=0.99;
theta=4*pi^2*neff*R./lambda;
k1=0.18;
k2=0.18;
t1=sqrt(1-k1^2);
t2=sqrt(1-k2^2);
D=(k1^2*k2^2*alpha)./(1-2*alpha*t1*t2*cos(theta)+alpha^2*t1^2*t2^2);%���ض�

T=(t1^2-2*alpha*t1*t2*cos(theta)+alpha^2*t2^2)./...
(1-2*alpha*t1*t2*cos(theta)+alpha^2*t1^2*t2^2);                    %ֱͨ��
figure;
plot(lambda,D,'b','linewidth',1.8)
hold on
plot(lambda,T,'r','linewidth',1.8)
grid on
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('���ض�','ֱͨ��')
figure;
t0=-3*1e-1;
 res = gauss_spec .* kk1 .* exp(-1i*double_f*1e-9*t0) ; 
 ress = abs(ifft(res));
 plot(t*1e+9,abs(ress)/max(abs(ress)),'r','linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
 plot(t*1e+9,abs(hht1)/max(abs(hht1)),'b','linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
legend('����k=0.038','ģ��k=0.038')



