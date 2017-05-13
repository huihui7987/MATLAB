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
        init = Vtemp*(i+1)/N-eps;
        try
          Utemp = fzero(@(Utemp) ...
            besselj(0,Utemp)/(Utemp*besselj(1,Utemp)) - ... 
            besselk(0,sqrt(Vtemp^2-Utemp^2))/ ...
            (sqrt(Vtemp^2-Utemp^2)*besselk(1,sqrt(Vtemp^2-Utemp^2))),init); 
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
plot(V,U,'r');
axis equal
axis([0 Vmax 0 Ymax]) 
xlabel('V')
ylabel('U')
title('LP_{01}  V-U')

subplot(1,2,2)
plot(V,W,'r');
axis equal
axis([0 Vmax 0 Ymax])
xlabel('V')
ylabel('W')
title('LP_{01}  V-W')

toc