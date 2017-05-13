clc
clear
close all
tic
Vmax = 10;
N =100;

for j = 1:N
    V(j) = j/N*Vmax;
    Vtemp = V(j);

    Utemp = NaN;
    i = 0;

    while (isnan(Utemp)  && i<N+1)
        init = 3.5*(N-i)/N;
        try 
            Utemp = fzero(@(Utemp) ...
              besselj(1,Utemp)/(Utemp*besselj(0,Utemp)) + ...
              besselk(1,sqrt(Vtemp^2-Utemp^2))/(sqrt(Vtemp^2-Utemp^2)* ...
              besselk(0,sqrt(Vtemp^2-Utemp^2))),init);
        catch
        end
        i = i+1;
    end

    U(j) = Utemp;
end

W = sqrt(V.^2-U.^2);
Ymax = ceil(max([U,W]));

figure
subplot(1,2,1)
plot(V,U);
axis equal
axis([0 Vmax 0 Ymax])
xlabel('V')
ylabel('U')
title('LP_{11} V-U')

subplot(1,2,2)
plot(V,W);
axis equal
axis([0 Vmax 0 Ymax])
xlabel('V')
ylabel('W')
title('LP_{11} V-W')

toc