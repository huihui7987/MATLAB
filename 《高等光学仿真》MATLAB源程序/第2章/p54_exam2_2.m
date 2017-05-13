clear
close all
n1 = 1.56;
n2 = 1.2;
n3 = 1;
d = 0.3e-5;
lambda = 1.55e-6;
k = 2*pi/lambda;

V12 = sqrt(n1^2-n2^2)*k*d;
V13 = sqrt(n1^2-n3^2)*k*d;

F = @(x)(x*(sqrt(V12^2 - x.^2)+sqrt(V13^2 - x.^2))./...
     (x.^2 - sqrt(V12^2 - x.^2).*sqrt(V13^2 - x.^2) ));

Feigin = @(x)(F(x)-tan(x));

x(1) = fzero(Feigin,3);
x(2) = fzero(Feigin,6);
x(3) = fzero(Feigin,8.5);

kappa = x/d;
theta = asin(kappa/(n1*k));
beta = (n1*k)*cos(theta);
gamma = sqrt((n1^2-n2^2)*k^2 - kappa.^2);
delta = sqrt((n1^2-n3^2)*k^2 - kappa.^2);

format short g
[x' theta' beta' kappa' gamma' delta']