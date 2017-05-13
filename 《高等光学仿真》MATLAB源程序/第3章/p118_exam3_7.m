clc
clear
close all
tic
Vmax = 10;
N =100;
V = (1:N)/N*Vmax;
b = zeros(N,1);

%`主循环，求解不同V对应的b值`
for j = 1:N
    Vtemp = V(j);
    btemp = NaN;
    i = 0;
    while (isnan(btemp)  && i<N+1)
        init = (N-i)/N;
        try
         btemp = fzero(@(b) ...
            Vtemp*sqrt(1-b)*besselj(1,Vtemp*sqrt(1-b))/ ...
            besselj(0,Vtemp*sqrt(1-b)) - Vtemp*sqrt(b)* ...
            besselk(1,Vtemp*sqrt(b))/besselk(0,Vtemp*sqrt(b)),init);
        catch
        end
        i = i+1;
    end
    b(j) = btemp;
end

plot(V,b,'r');
axis([0 Vmax 0 1])
xlabel('V')
ylabel('b')
title('LP_{01}')
grid on
toc