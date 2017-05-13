clear
close all
besselj1 = @(x)besselj(1,x);
for n = 1:10
    z(n) = fzero(besselj1,[(n-1) n]*pi);
end
x = 0:pi/100:10*pi;
y = besselj(1,x);
plot(z,zeros(1,10),'o',x,y,'-')
line([0 10*pi],[0 0],'color','black')
axis([0 10*pi -0.5 1.0])
xlabel('U')
ylabel('J_1(U)')
[(1:n)' z']