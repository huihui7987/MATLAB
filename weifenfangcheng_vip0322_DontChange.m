clc;
clear;

FWHM=52e-12;            %��˹�ź�FWHM��ȣ�Ϊ62ps
time_window=2000*FWHM;   %��˹�źŵĲ������ڿ�ȣ���ֵ�����˸���Ҷ�任���Ƶ�ʷֱ���
Ns=1001;                %������
dt=time_window/(Ns-1);  %����ʱ����
t=0:dt:time_window;     %����ʱ��

% n1=1.5;
% n2=0.66;
% n3=1.5;
% figure;
gauss_time=exp(-0.5*(2*sqrt(2*log(2))*(t-2.5e-9)/FWHM).^2);%.*exp(-1i*1439.5e-9*t); %��˹���壬����λ��2.5ns����
% plot(t*1e+9,gauss_time,'linewidth',2.5);
% %���ϣ���ͼ�����ۣ�ԭ��ȡ����̫��
% xlabel('Time/ns');
% ylabel('Amplitude/V');
% title('Gauss pulse');

%===========���¼���˫���ס�˫�߹����ס�˫�߹������ܶ�=================
gauss_spec=fftshift(fft(ifftshift(gauss_time)));    %����Ҷ�任�����ҽ�����λ������
%gauss_spec=fftshift(gauss_time); 
gauss_spec=gauss_spec/Ns;   %��ʵ�ʵķ���ֵ����һ����
df=1/time_window;               %Ƶ�ʷֱ���
k=floor(-(Ns-1)/2:(Ns-1)/2);    
% k=0:Ns-1;
double_f=k*df;   %˫��Ƶ�׶�Ӧ��Ƶ��
figure;
plot(double_f*1e-9,(gauss_spec),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('Tdaa');title('gauss_spec');hold
%% ���봫�亯��
kk1 = 1./((1i*2*pi*double_f*1e-9)+0.22);
kk2 = 1./((1i*2*pi*double_f*1e-9)+0.32);
kk3 = 1./((1i*2*pi*double_f*1e-9)+0.34);
kk4 = 1./((1i*2*pi*double_f*1e-9)+0.35);
kk5 = 1./((1i*2*pi*double_f*1e-9)+0.37);
kk6 = 1./((1i*2*pi*double_f*1e-9)+0.37);

figure;%������λ�仯
plot(double_f*1e-9,angle(kk1),'r','linewidth',2.5); xlabel('Frequency(Hz��');ylabel('kk1-Intensity Transmission H1');hold on;
figure;%����͸����
res_rr = abs(kk5.^2);
plot(double_f*1e-9,res_rr/max(res_rr),'r','linewidth',2.5); xlabel('Frequency(Hz��');ylabel('kk1-Intensity Transmission H1');hold on;

hh1 = gauss_spec .* kk1;
% plot(double_f*1e-9,abs(hh),'r','linewidth',2.5); xlabel('Frequency(Hz��');ylabel('Intensity Transmission H1');hold on;
figure;
hht1 = abs(ifft(hh1))/max(abs(ifft(hh1)));
hh2 = gauss_spec .* kk2;
hht2 = abs(ifft(hh2))/max(abs(ifft(hh2)));
hh3 = gauss_spec .* kk3;
hht3 = abs(ifft(hh3))/max(abs(ifft(hh3)));
hh4 = gauss_spec .* kk4;
hht4 = abs(ifft(hh4))/max(abs(ifft(hh4)));
hh5 = gauss_spec .* kk5;
hht5 = abs(ifft(hh5))/max(abs(ifft(hh5)));
hh6 = gauss_spec .* kk6;
hht6 = abs(ifft(hh6))/max(abs(ifft(hh6)));
plot(t*1e+9,abs(hht1),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht2),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht3),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht4),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht5),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht6),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
legend('k=0.031','k=0.043','k=0.052','k=0.064','k=0.071','k=0.083')
% figure;
% hf1 = gauss_spec .* abs(kk1);
% hf2 = abs(ifft(hf1));
% hf3 = gauss_spec .* abs(kk5);
% hf4 = abs(ifft(hf3));
% plot(t*1e+9,abs(hf2),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
% plot(t*1e+9,abs(hf4),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;


%% ΢��г��ǻʵ��
R=80e-6;
lamda=1439.0e-9:1e-12:1440.0e-9;
v=(3e8./lamda)-(3e8./1439.5e-9);
%neff=3.179962;
neff=3.7;

L = 2*pi*R;
phi = mod(L*neff./lamda*2*pi,2*pi);%~~~~-
p=exp(1i*phi/2);
taoa=0.95;

figure;
%Tdaa= taoa.*(r-1)./(1-r.*taoa.*p) ;
r1 = 0.9999;
r2 = 0.9999;
k1 = sqrt(1-r1^2);
k2 = sqrt(1-r2^2);

Tdaa = ((-taoa*k1*k2*p)./(1-taoa*r1*r2*p.^2)).^2;

H_ring_res1 = gauss_spec .* Tdaa;

plot(double_f*1e-9,abs(Tdaa)/max(abs(Tdaa)),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('Tdaa');title('���亯��������');hold on;
% figure;%������λ�仯
% PHI1 = angle(Tdaa);
% 
% plot(double_f*1e-9,PHI1,'r','linewidth',2.5); xlabel('Frequency(Hz��');ylabel('Tdaa-Intensity Transmission H1');hold on;
% ring_gauss_diff_power_spec=(abs(H_ring_res1)).^2;
figure;
plot(double_f*1e-9,abs(H_ring_res1),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('Tdaa');title('Ƶ����');hold on;
figure;
hht = abs(ifft((H_ring_res1)))/max(abs(ifft((H_ring_res1))));
plot(t*1e+9,hht,'linewidth',2.5);

%%

figure;
plot(t*1e+9,abs(hht1),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht2),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht3),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht4),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht5),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot(t*1e+9,abs(hht6),'linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
plot((t-0.000000001)*1e+9,hht,'r','linewidth',2.5);xlabel('Time(ps��');ylabel('Intensity(a.u.)');hold on;
legend('k=0.038','k=0.054','k=0.070','k=0.084','k=0.2','k=0.3','ring-based')









