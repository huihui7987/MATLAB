clear
close all

n1 = 1.45; n2 = 1;
theta = 0:0.1:90;
a = theta*pi/180;

rp = (n2*cos(a)-n1*sqrt(1-(n1/n2*sin(a)).^2))./...
     (n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));           
rs = (n1*cos(a)-n2*sqrt(1-(n1/n2*sin(a)).^2))./...
     (n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));
tp = 2*n1*cos(a)./(n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));
ts = 2*n1*cos(a)./(n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));

arp = angle(rp);
ars = angle(rs);
atp = angle(tp);
ats = angle(ts);

figure(1);
subplot(1,2,1);
plot(theta,arp,'-',theta,ars,'--','LineWidth',2)
legend('arg(r_p)','arg(r_s)')
xlabel('\theta_i')
ylabel('\delta')
title(['n_1=',num2str(n1),',n_2=',num2str(n2)])
axis([0 90 -3.5 3.5])
grid on

subplot(1,2,2);
plot(theta,atp,'-',theta,ats,'--','LineWidth',2)
legend('arg(t_p)','arg(t_s)')
xlabel('\theta_i')
ylabel('\delta')
title(['n_1=',num2str(n1),',n_2=',num2str(n2)])
axis([0 90 -3.5 3.5])
grid on