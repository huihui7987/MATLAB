clear all;
Np=10000;
lambda=linspace(1530e-9,1600e-9,Np);
neff=3.1;
R=5.06e-6;
alpha=0.99;
theta=4*pi^2*neff*R./lambda;
k1=0.18;
k2=0.18;
t1=sqrt(1-k1^2);
t2=sqrt(1-k2^2);
D=(k1^2*k2^2*alpha)./(1-2*alpha*t1*t2*cos(theta)+alpha^2*t1^2*t2^2);%下载端
T=(t1^2-2*alpha*t1*t2*cos(theta)+alpha^2*t2^2)./...
(1-2*alpha*t1*t2*cos(theta)+alpha^2*t1^2*t2^2);                    %直通端
figure(1)
plot(lambda,D,'b','linewidth',1.8)
hold on
plot(lambda,T,'r','linewidth',1.8)
grid on
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('下载端','直通端')
%改变环的半径R
figure(2)
R1=4e-6;
R2=3e-6;
theta1=4*pi^2*neff*R1./lambda;
theta2=4*pi^2*neff*R2./lambda;
D1=(k1^2*k2^2*alpha)./(1-2*alpha*t1*t2*cos(theta1)+alpha^2*t1^2*t2^2);
T1=(t1^2-2*alpha*t1*t2*cos(theta1)+alpha^2*t2^2)./...
(1-2*alpha*t1*t2*cos(theta1)+alpha^2*t1^2*t2^2);
D2=(k1^2*k2^2*alpha)./(1-2*alpha*t1*t2*cos(theta2)+alpha^2*t1^2*t2^2);
T2=(t1^2-2*alpha*t1*t2*cos(theta2)+alpha^2*t2^2)./...
(1-2*alpha*t1*t2*cos(theta2)+alpha^2*t1^2*t2^2);
plot(lambda,D,'--b','linewidth',1.8)
hold on
plot(lambda,T,'r','linewidth',1.8)
plot(lambda,D1,'--g','linewidth',1.8)
%plot(lambda,D2,'--y','linewidth',1.8)
plot(lambda,T1,'k','linewidth',1.8)
%plot(lambda,T2,'c','linewidth',1.8)
grid on
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('下载端1','直通端1','下载端2','直通端2')
%改变耦合系数k
figure(3)
k1_1=0.12;
k2_1=0.12;
k1_2=0.25;
k2_2=0.25;
t1_1=sqrt(1-k1_1^2);
t2_1=sqrt(1-k2_1^2);
t1_2=sqrt(1-k1_2^2);
t2_2=sqrt(1-k2_2^2);
D3=(k1_1^2*k2_1^2*alpha)./(1-2*alpha*t1_1*t2*cos(theta)+alpha^2*t1_1^2*t2_1^2);
T3=(t1_1^2-2*alpha*t1_1*t2_1*cos(theta)+alpha^2*t2_1^2)./...
(1-2*alpha*t1_1*t2_1*cos(theta)+alpha^2*t1_1^2*t2_1^2);
D4=(k1_2^2*k2_2^2*alpha)./(1-2*alpha*t1_2*t2_2*cos(theta)+alpha^2*t1_2^2*t2_2^2);
T4=(t1_2^2-2*alpha*t1_2*t2_2*cos(theta)+alpha^2*t2_2^2)./...
(1-2*alpha*t1_2*t2_2*cos(theta)+alpha^2*t1_2^2*t2_2^2);
plot(lambda,D,'--b','linewidth',1.8)
hold on
plot(lambda,T,'r','linewidth',1.8)
%plot(lambda,D3,'--y','linewidth',1.8)
%plot(lambda,T3,'k','linewidth',1.8)
plot(lambda,D4,'--y','linewidth',1.8)
plot(lambda,T4,'k','linewidth',1.8)
grid on
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('下载端1','直通端1','下载端2','直通端2')
%改变alpha
figure(4)
alpha1=0.98;
alpha2=0.96;
alpha3=0.95;
D=(k1^2*k2^2*alpha)./(1-2*alpha*t1*t2*cos(theta)+alpha^2*t1^2*t2^2);
T=(t1^2-2*alpha*t1*t2*cos(theta)+alpha^2*t2^2)./...
(1-2*alpha*t1*t2*cos(theta)+alpha^2*t1^2*t2^2);
D5=(k1^2*k2^2*alpha1)./(1-2*alpha1*t1*t2*cos(theta)+alpha1^2*t1^2*t2^2);
T5=(t1^2-2*alpha1*t1*t2*cos(theta)+alpha1^2*t2^2)./...
(1-2*alpha1*t1*t2*cos(theta)+alpha1^2*t1^2*t2^2);
D6=(k1^2*k2^2*alpha2)./(1-2*alpha2*t1*t2*cos(theta)+alpha2^2*t1^2*t2^2);
T6=(t1^2-2*alpha2*t1*t2*cos(theta)+alpha2^2*t2^2)./...
(1-2*alpha2*t1*t2*cos(theta)+alpha2^2*t1^2*t2^2);
D7=(k1^2*k2^2*alpha3)./(1-2*alpha3*t1*t2*cos(theta)+alpha3^2*t1^2*t2^2);%下载端
T7=(t1^2-2*alpha3*t1*t2*cos(theta)+alpha3^2*t2^2)./...
(1-2*alpha3*t1*t2*cos(theta)+alpha3^2*t1^2*t2^2);
subplot(2,2,1)
plot(lambda,D,'--b','linewidth',1.8)
hold on
plot(lambda,T,'r','linewidth',1.8)
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('下载端','直通端')
subplot(2,2,2)
plot(lambda,D5,'--b','linewidth',1.8)
hold on
plot(lambda,T5,'r','linewidth',1.8)
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('下载端','直通端')
subplot(2,2,3)
plot(lambda,D6,'--b','linewidth',1.8)
hold on
plot(lambda,T6,'r','linewidth',1.8)
xlabel('wavelength')
ylabel('normalized power(a.u.)')
legend('下载端','直通端')
subplot(2,2,4)
plot(lambda,D7,'--b','linewidth',1.8)
hold on
plot(lambda,T7,'r','linewidth',1.8)
legend('下载端','直通端')
xlabel('wavelength')
ylabel('normalized power(a.u.)')