%被动调Q速率方程数值求解
clc
clear
close all

T0 = 0.7;
R = 0.8;
Rp = 2e28;

y0 = [1;0;0];
tspan=[0 0.05];
tic
[t,y] = ode23('rate_eq',tspan,y0,[],Rp,T0,R);
toc
y(:,1) = max(y(:,1),1);

figure
subplot(3,1,1);
plot(t,y(:,1));
xlabel('时间(s)');
ylabel('光子数密度(m^{-3})');

subplot(3,1,2);
plot(t,y(:,2));
xlabel('时间(s)');
ylabel('反转粒子数密度(m^{-3})');

subplot(3,1,3);
plot(t,y(:,3));
xlabel('时间(s)');
ylabel('基态粒子数密度(m^{-3})');

figure  %将光子数密度和反转粒子数密度随时间变化画于同一图中
[AX,H1,H2] = plotyy(t,y(:,1),t,y(:,2));     
set(H2,'LineStyle','--')
xlabel('时间(s)')
set(get(AX(1),'Ylabel'),'String','光子数密度(m^{-3})') 
set(get(AX(2),'Ylabel'),'String','反转粒子数密度(m^{-3})')