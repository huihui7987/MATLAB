clear
close all

n1 = 1.45, n2 = 1;
theta = 0:0.1:90;
a = theta*pi/180;

rp = (n2*cos(a)-n1*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));           
rs = (n1*cos(a)-n2*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));
tp = 2*n1*cos(a)./(n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));
ts = 2*n1*cos(a)./(n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));

figure(1);
subplot(1,2,1);
plot(theta,rp,'-',theta,rs,'--',theta,abs(rp),':',...
    theta,abs(rs),'-.','LineWidth',2)
legend('r_p','r_s','|r_p|','|r_s|')
xlabel('\theta_i')
ylabel('Amplitude')
title(['n_1=',num2str(n1),',n_2=',num2str(n2)])
axis([0 90 -1 1.2])
grid on

subplot(1,2,2);
plot(theta,tp,'-',theta,ts,'--',theta,abs(tp),':',...
    theta,abs(ts),'-.','LineWidth',2)
legend('t_p','t_s','|t_p|','|t_s|')
xlabel('\theta_i')
ylabel('Amplitude')
title(['n_1=',num2str(n1),',n_2=',num2str(n2)])
axis([0 90 0 3])
grid on