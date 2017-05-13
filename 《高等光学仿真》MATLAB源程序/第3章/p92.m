clear 
close all
M = 5;
N = 1001;
Xmin = 0;
Xmax = 15;
x = linspace(Xmin,Xmax,N);
y = zeros(N,M);
for m = 0:M-1
    y(:,m+1) = besselj(m,x);
end
plot(x,y);

[ymax pos]=max(y);
for i = 1:M
   text(x(pos(i)+1),ymax(i)-0.05,['J_' num2str(i-1) '(x)']);
end
grid on
xlabel('x')
ylabel('J_n(x)')