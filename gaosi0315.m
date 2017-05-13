clc;
clear;
m=1;
fwhm=10e-12;       %脉冲宽度10ps
Ns=2^12;            %取样点
Ts=1000.e-12/Ns;     %取样时间宽度1000ps，取样点4096个         
n=floor(-(Ns-1)/2:(Ns-1)/2);
t=n*Ts;

%g=exp(-0.5*(t/fwhm).^2);       %高斯脉冲
g=exp(-((t/fwhm).^2)*2*log(2)); %高斯脉冲(0713)
%dg=-t.*g*4*log(2)/fwhm^2;      %高斯一阶微分，理论表达式
dg=diff(g,1); %高斯一阶微分，理论表达式
figure        %画出高斯脉冲
plot(t*1e+12,g.^2,'linewidth',2.5);   %画出时域功率曲线
xlabel('Time(ps)');
ylabel('Power(a.u.)');
title('Gauss pulse');
axis([-60,60,0,1]);

%============频谱及功率谱=======================%
n=floor(-(Ns-1)/2:(Ns-1)/2);
D=1/(Ns*Ts);      %频率分辨率
double_f=n*D;   %频点
%G=fft(g,N);     %高斯信号频谱
G=fftshift(fft(g));%高斯信号频谱
G_power=abs(G).^2; %高斯信号功率谱
Mapped_G_power = mapminmax(G_power,0,1);  %高斯信号功率谱归一化

figure      %画出功率谱 
plot(double_f*1e-9,Mapped_G_power,'linewidth',2.5);   %功率谱 
xlabel('Frequency(GHz)');
ylabel('Power(a.u.)');
title('double Power spectrum');
axis([-200,200,0,1]);
%plot(double_f*1e-9,abs(G)/max(abs(G)),'linewidth',2.5);  %幅度谱 

%============傅里叶逆变换=======================%
% iG=ifft(G,Ns);
% figure
% plot(t*1e+12,(abs(iG)/max(abs(iG))).^2);
% xlabel('Time(ps)');
% ylabel('Power(a.u.)');
% title('Gauss pulse');
% axis([-60,60,0,1]);

n0=1.5;
H=(2*pi*1i*double_f).^n0;    %一阶微分传输函数
G1=G.*H;        %高斯一阶微分信号的频谱
G1_power=abs(G1).^2; %高斯信号功率谱
%%
figure
kk1 = 1./((1i*2*pi*double_f*1e-9)+0.038);
hh1 = G .* kk1;
ih1=ifft(hh1,Ns); %逆变换，计算高斯一阶微分时域信号
plot(t*1e+12,abs(ih1)/max(abs(ih1)),'linewidth',2);

figure
%%
H_idea=(1i*2*pi*double_f*1e-9);
idea_gauss_diff=G.*H_idea;
hhh = ifft(idea_gauss_diff,Ns);
plot(t*1e+12,abs(hhh)/max(abs(hhh)),'linewidth',2);




Mapped_G1_power = mapminmax(G1_power,0,1); 
t0=-5*1e-3;
H_model= exp(-1i*double_f*1e-9*t0).*H;%长周期模型
G1_model=G.*H_model;        %高斯一阶微分信号的频谱
G1_power_model=abs(G1_model).^2; %高斯信号功率谱
Mapped_G1_power_model = mapminmax(G1_power_model,0,1); 

figure      %画出一阶功率谱 
plot(double_f*1e-9,Mapped_G1_power,'linewidth',2.5);hold on;%功率谱 
%plot(double_f*1e-9,Mapped_G1_power_model,'r');
xlabel('Frequency(GHz)');
ylabel('Power(a.u.)');
title('double Power spectrum');
axis([-200,200,0,1]);
iG1=ifft(G1,Ns); %逆变换，计算高斯一阶微分时域信号
iG1_model=ifft(G1_model,Ns);

figure    %画出时域微分图形
plot(t*1e+12,g,'k-.','linewidth',2);hold on;
plot(t*1e+12,abs(iG1)/max(abs(iG1)),'linewidth',2);   %画高斯一阶微分信号时域图（傅里叶逆变换），归一化
hold on;
plot(t*1e+12,abs(iG1_model)/max(abs(iG1_model)),'r--','linewidth',2);
%plot(t(:,1:length(dg))*1e+12,abs(dg)/max(abs(dg)),'r');    %高斯一阶微分理论时域图，归一化
axis([-60,60,0,1.2]);
xlabel('Time(ps)');
ylabel('Amplitude(a.u.)');
legend('Input','Ideal','LPFG based')
%title('gauss-differentiation');
