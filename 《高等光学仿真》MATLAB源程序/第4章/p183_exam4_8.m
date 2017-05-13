clc
clear
close all

NAsm = 0.11;
a = 4.5e-6;
omega_x = 10.8e-6;
omega_y = 0.47e-6;
P_LED = 500e-6;

t1x = quad(@(r)(exp(-2*r.^2/omega_x^2).*r),0,a,1e-16);
t2x = quad(@(x)(exp(-2*x.^2/omega_x^2).*x),0,5*omega_x,1e-16);
t3x = quad(@(theta)(cos(theta).*sin(theta)),0,pi/2,1e-16);

t1y = quad(@(r)(exp(-2*r.^2/omega_y^2).*r),0,a,1e-16);
t2y = quad(@(y)(exp(-2*y.^2/omega_y^2).*y),0,5*omega_y,1e-16);
t3y = quad(@(theta)(cos(theta).^7.*sin(theta)),0,pi/2,1e-16);

tau_x = sqrt(NAsm^2*t1x/(2*t2x*t3x));
tau_y = sqrt(NAsm^2*t1y/(2*t2y*t3y));

eta = tau_x*tau_y;
P_Fiber = P_LED*eta;

format short g
disp('      tau_x         tau_y        eta       P_Fiber')
disp([tau_x  tau_y   eta   P_Fiber])