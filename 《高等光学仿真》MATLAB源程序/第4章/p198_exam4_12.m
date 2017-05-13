clc
clear
syms x

F1=int(1/(1+x^2),0,Inf);
F2=int(x^(1/2)/(1+x^2),0,Inf);
F3=int(x/(1+x^2),0,Inf);
F4=int(x^2/(1+x^2),0,Inf);
disp('             F1             F2               F3             F4')
disp([F1 F2 F3 F4])