f = @(x) sinh(x)-cos(x);
ferror = 1e-5;
x1 = 0.5;
x2 = 1.0;
fplot(f,[x1 x2])
xlabel('x')
ylabel('f(x)')
hold on

% 以下是二分法的数值求解过程
x0 = (x1+x2)/2;             
while abs(f(x0)) > ferror
    plot(x0,f(x0),'+')
    if f(x1)*f(x0)>0
        x1 = x0;
    else
        x2 = x0;
    end
    x0 = (x1+x2)/2;
end

% 在命令窗口中显示所二分法得到的数值解以及误差值
format short g
disp(['         x0       f(x0)'])
disp([x0 f(x0)])