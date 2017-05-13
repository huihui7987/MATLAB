clc
clear
close all

NAsm = 0.11;
a = 4.5e-6;
omega_x = 10.8e-6;
omega_y = 0.47e-6;
P_LED = 500e-6;

t11x = dblquad(@(r,theta)(exp(-2*r.^2/omega_x^2).*r),0,a,0,2*pi,1e-16);
t22x = dblquad(@(x,theta)(exp(-2*x.^2/omega_x^2).*x),0,5*omega_x,...
                          0,2*pi,1e-16);
t33x = dblquad(@(theta,phi)(cos(theta).*sin(theta)),0,pi/2,0,2*pi,1e-16);

t11y = dblquad(@(r,theta)(exp(-2*r.^2/omega_y^2).*r),0,a,0,2*pi,1e-16);
t22y = dblquad(@(y,theta)(exp(-2*y.^2/omega_y^2).*y),0,5*omega_y,...
                          0,2*pi,1e-16);
t33y =dblquad(@(theta,phi)(cos(theta).^7.*sin(theta)),0,pi/2,0,2*pi,1e-16);

tau_x = sqrt(pi*NAsm^2*t11x/(t22x*t33x));
tau_y = sqrt(pi*NAsm^2*t11y/(t22y*t33y));

eta = tau_x*tau_y;
P_Fiber = P_LED*eta;

format short g
disp('      tau_x         tau_y        eta       P_Fiber')
disp([tau_x  tau_y   eta   P_Fiber])