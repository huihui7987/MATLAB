f = @(t,x)[x(2); 80*cos(5*t)-9*x(1)];
x0 =[0; 0];
t_final = 6*pi;
[t,x] = ode45(f,[0,t_final],x0);

ts = linspace(0,t_final,201);
xs = 5*cos(3*ts)-5*cos(5*ts);

plot(ts,xs,'*',t,x(:,1))
xlabel('t')
ylabel('x')
legend('exact solution','numerical solution')