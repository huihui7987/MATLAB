clear
close all
n1 = 1.56;
n2 = 1.2;
n3 = 1;
d = 3e-6;
lambda = 1.55e-6;
k = 2*pi/lambda;

V12 = sqrt(n1^2-n2^2)*k*d;
V13 = sqrt(n1^2-n3^2)*k*d;

F = @(x)(x*(sqrt(V12^2 - x^2)+sqrt(V13^2 - x^2))./...
     (x^2 - sqrt(V12^2 - x^2)*sqrt(V13^2 - x^2) ));

ezplot(@tan,[0,4*pi,-5,5])
hold on
ezplot(F,[0,4*pi])
title('Graphical solution of the eigenvalue')
xlabel('\kappa d')