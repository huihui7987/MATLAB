clc
clear
close all

dblquad(@(x,y)(exp(x.^2+y.^2).*((y<sqrt(x))&(y>1./(4*x)))),...
        0.3969,2,1/8,sqrt(2)) 