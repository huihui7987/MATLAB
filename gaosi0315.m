clc;
clear;
m=1;
fwhm=10e-12;       %������10ps
Ns=2^12;            %ȡ����
Ts=1000.e-12/Ns;     %ȡ��ʱ����1000ps��ȡ����4096��         
n=floor(-(Ns-1)/2:(Ns-1)/2);
t=n*Ts;

%g=exp(-0.5*(t/fwhm).^2);       %��˹����
g=exp(-((t/fwhm).^2)*2*log(2)); %��˹����(0713)
%dg=-t.*g*4*log(2)/fwhm^2;      %��˹һ��΢�֣����۱��ʽ
dg=diff(g,1); %��˹һ��΢�֣����۱��ʽ
figure        %������˹����
plot(t*1e+12,g.^2,'linewidth',2.5);   %����ʱ��������
xlabel('Time(ps)');
ylabel('Power(a.u.)');
title('Gauss pulse');
axis([-60,60,0,1]);

%============Ƶ�׼�������=======================%
n=floor(-(Ns-1)/2:(Ns-1)/2);
D=1/(Ns*Ts);      %Ƶ�ʷֱ���
double_f=n*D;   %Ƶ��
%G=fft(g,N);     %��˹�ź�Ƶ��
G=fftshift(fft(g));%��˹�ź�Ƶ��
G_power=abs(G).^2; %��˹�źŹ�����
Mapped_G_power = mapminmax(G_power,0,1);  %��˹�źŹ����׹�һ��

figure      %���������� 
plot(double_f*1e-9,Mapped_G_power,'linewidth',2.5);   %������ 
xlabel('Frequency(GHz)');
ylabel('Power(a.u.)');
title('double Power spectrum');
axis([-200,200,0,1]);
%plot(double_f*1e-9,abs(G)/max(abs(G)),'linewidth',2.5);  %������ 

%============����Ҷ��任=======================%
% iG=ifft(G,Ns);
% figure
% plot(t*1e+12,(abs(iG)/max(abs(iG))).^2);
% xlabel('Time(ps)');
% ylabel('Power(a.u.)');
% title('Gauss pulse');
% axis([-60,60,0,1]);

n0=1.5;
H=(2*pi*1i*double_f).^n0;    %һ��΢�ִ��亯��
G1=G.*H;        %��˹һ��΢���źŵ�Ƶ��
G1_power=abs(G1).^2; %��˹�źŹ�����
%%
figure
kk1 = 1./((1i*2*pi*double_f*1e-9)+0.038);
hh1 = G .* kk1;
ih1=ifft(hh1,Ns); %��任�������˹һ��΢��ʱ���ź�
plot(t*1e+12,abs(ih1)/max(abs(ih1)),'linewidth',2);

figure
%%
H_idea=(1i*2*pi*double_f*1e-9);
idea_gauss_diff=G.*H_idea;
hhh = ifft(idea_gauss_diff,Ns);
plot(t*1e+12,abs(hhh)/max(abs(hhh)),'linewidth',2);




Mapped_G1_power = mapminmax(G1_power,0,1); 
t0=-5*1e-3;
H_model= exp(-1i*double_f*1e-9*t0).*H;%������ģ��
G1_model=G.*H_model;        %��˹һ��΢���źŵ�Ƶ��
G1_power_model=abs(G1_model).^2; %��˹�źŹ�����
Mapped_G1_power_model = mapminmax(G1_power_model,0,1); 

figure      %����һ�׹����� 
plot(double_f*1e-9,Mapped_G1_power,'linewidth',2.5);hold on;%������ 
%plot(double_f*1e-9,Mapped_G1_power_model,'r');
xlabel('Frequency(GHz)');
ylabel('Power(a.u.)');
title('double Power spectrum');
axis([-200,200,0,1]);
iG1=ifft(G1,Ns); %��任�������˹һ��΢��ʱ���ź�
iG1_model=ifft(G1_model,Ns);

figure    %����ʱ��΢��ͼ��
plot(t*1e+12,g,'k-.','linewidth',2);hold on;
plot(t*1e+12,abs(iG1)/max(abs(iG1)),'linewidth',2);   %����˹һ��΢���ź�ʱ��ͼ������Ҷ��任������һ��
hold on;
plot(t*1e+12,abs(iG1_model)/max(abs(iG1_model)),'r--','linewidth',2);
%plot(t(:,1:length(dg))*1e+12,abs(dg)/max(abs(dg)),'r');    %��˹һ��΢������ʱ��ͼ����һ��
axis([-60,60,0,1.2]);
xlabel('Time(ps)');
ylabel('Amplitude(a.u.)');
legend('Input','Ideal','LPFG based')
%title('gauss-differentiation');
