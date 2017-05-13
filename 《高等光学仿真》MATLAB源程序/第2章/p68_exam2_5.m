f = @(x) sinh(x)-cos(x);
ferror = 1e-5;
x1 = 0.5;
x2 = 1.0;
fplot(f,[x1 x2])
xlabel('x')
ylabel('f(x)')
hold on

% �����Ƕ��ַ�����ֵ������
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

% �����������ʾ�����ַ��õ�����ֵ���Լ����ֵ
format short g
disp(['         x0       f(x0)'])
disp([x0 f(x0)])