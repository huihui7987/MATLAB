clear
close all

V12 = .7; V13 = 1.1;

F = @(x)(x*(sqrt(V12^2 - x^2)+sqrt(V13^2 - x^2))./...
     (x^2 - sqrt(V12^2 - x^2)*sqrt(V13^2 - x^2) ));

figure(1)
subplot(1,2,1)
ezplot(@tan,[0,1.5*pi,-5,5])
hold on
ezplot(F,[0,1.5*pi,-5,5])
title(['Graphical solution of the eigenvalue: V_{12}=',...
    num2str(V12), ',V_{13}=',num2str(V13)])
xlabel('\kappa d')

V = .7;

F = @(x)(2*x*sqrt(V^2 - x^2))./(2*x^2-V^2);

subplot(1,2,2)
ezplot(@tan,[0,1.5*pi,-5,5])
hold on
ezplot(F,[0,1.5*pi,-5,5])
title(['Graphical solution of the eigenvalue: V=V_{12}=V_{13}=',...
    num2str(V12)])
xlabel('\kappa d')