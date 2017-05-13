% hold on;
% fc = gauspuls('cutoff',50e3,0.6,[],-3);
% f = -fc:1e-12:fc;
% yi = gauspuls(f,50e3,0.6);
% plot(f,yi);

clc;
clear;

FWHM=50e-12;            %��˹�ź�FWHM��ȣ�Ϊ62ps
time_window=100*FWHM;   %��˹�źŵĲ������ڿ�ȣ���ֵ�����˸���Ҷ�任���Ƶ�ʷֱ���
Ns=2048;                %������
dt=time_window/(Ns-1);  %����ʱ����
t=0:dt:time_window;     %����ʱ��

gauss_time=exp(-0.5*(2*sqrt(2*log(2))*(t-2.5e-9)/FWHM).^2); %��˹���壬����λ��2.5ns����
plot(t*1e+9,gauss_time,'linewidth',2.5);

 xlabel('Time/ns');
 ylabel('Amplitude/V');
 title('Gauss pulse');

%===========���¼���˫���ס�˫�߹����ס�˫�߹������ܶ�=================
gauss_spec=fftshift(fft(ifftshift(gauss_time)));    %����Ҷ�任�����ҽ�����λ������
%gauss_spec=fftshift(gauss_time); 
gauss_spec=gauss_spec/Ns;   %��ʵ�ʵķ���ֵ����һ����
df=1/time_window;               %Ƶ�ʷֱ���
k=floor(-(Ns-1)/2:(Ns-1)/2);    
% k=0:Ns-1;
double_f=k*df;   %˫��Ƶ�׶�Ӧ��Ƶ��
figure
plot(double_f*1e-9,(gauss_spec),'r','linewidth',2.5); xlabel('Frequency(GHz��');ylabel('Tdaa');title('gauss_spec');hold