x = linspace(0,5,10);
y = 8./(1+7*exp(-8*x/3));
[x1,y1] = RK4('Logistic', [0, 5, 1], 1);
[x2,y2] = RK4('Logistic', [0, 5, .1], 1);
[x3,y3] = RK4('Logistic', [0, 5, .01], 1);
plot(x,y,'*',x1,y1,'--',x2,y2,'-.',x3,y3);
xlabel('x')
ylabel('y')
legend('exact solution','h=1','h=0.1','h=0.01')
axis([0 5 0 10])