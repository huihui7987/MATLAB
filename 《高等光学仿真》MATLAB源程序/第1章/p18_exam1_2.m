clear
close all

n1 = 1, n2 = 1.45;
theta = 0:0.1:90;
a = theta*pi/180;

rp = (n2*cos(a)-n1*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));           
rs = (n1*cos(a)-n2*sqrt(1-(n1/n2*sin(a)).^2))./...
    (n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));
tp = 2*n1*cos(a)./(n2*cos(a)+n1*sqrt(1-(n1/n2*sin(a)).^2));
ts = 2*n1*cos(a)./(n1*cos(a)+n2*sqrt(1-(n1/n2*sin(a)).^2));

Rp = abs(rp).^2;
Rs = abs(rs).^2;
Rn = (Rp+Rs)/2;

Tp = n2*sqrt(1-(n1/n2*sin(a)).^2)./(n1*cos(a)).*abs(tp).^2;
Ts = n2*sqrt(1-(n1/n2*sin(a)).^2)./(n1*cos(a)).*abs(ts).^2;
Tn = (Tp+Ts)/2;

figure(1);
subplot(1,2,1);
plot(theta,Rp,'-',theta,Rs,'-.',theta,Rn,'--','LineWidth',2)
legend('R_p','R_s','R_n')
xlabel('\theta_i')
ylabel('Amplitude')
title(['n_1=',num2str(n1),',n_2=',num2str(n2)])
axis([0 90 0 1])
grid on

subplot(1,2,2);
plot(theta,Tp,'-',theta,Ts,'-.',theta,Tn,'--','LineWidth',2)
legend('T_p','T_s','T_n')
xlabel('\theta_i')
ylabel('Amplitude')
title(['n_1=',num2str(n1),',n_2=',num2str(n2)])
axis([0 90 0 1])
grid on