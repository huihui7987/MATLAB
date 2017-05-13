clear
close all
M = 2;
N = 1001;
Xmin = 0;
Xmax = 15;
x = linspace(Xmin,Xmax,N);
y = zeros(N,M);
for m = 0:M-1
    y(:,m+1) = besselk(m,x);
end
plot(x,y);
legend('K_0(x)','K_1(x)')
grid on 
axis([Xmin Xmax 0 2])