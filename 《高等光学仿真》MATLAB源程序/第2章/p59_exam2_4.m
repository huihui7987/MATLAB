Np = 1001;
x2 = linspace(-2*d,-d,Np);
x1 = linspace(-d,0,Np);
x3 = linspace(0,1*d,Np);

Ey1 = zeros(Np,3); Ey2 = Ey1; Ey3 = Ey1;

for m = 1:3 
    Ey1(:,m) = cos(kappa(m)*x1)-...
        delta(m)/kappa(m)*sin(kappa(m)*x1);
    Ey2(:,m) = (cos(kappa(m)*d)+...
        delta(m)/kappa(m)*sin(kappa(m)*d))*exp(gamma(m)*(x2+d));
    Ey3(:,m) = exp(-delta(m)*x3);
end

Ey = [Ey2; Ey1; Ey3];
Ey = Ey/diag(max(abs(Ey)));
x  = [x2';x1';x3'];
    
plot(x,Ey(:,1),'-',x,Ey(:,2),...
    '--',x,Ey(:,3),':','LineWidth',2)
legend('TE_0','TE_1','TE_2')
xlabel('x')
axis([x(1) x(end) -1.1 1.1])
hold on
plot([-d,-d],[-1.1,1.1],'black--')
plot([ 0, 0],[-1.1,1.1],'black--')
plot([x(1), x(end)],[0,0],'black')