t = 0:.1:10;
s = 0.1+i;
y = exp(-s*t);
%绘制枝干图并设置视角
stem3(real(y),imag(y),t)
hold on
plot3(real(y),imag(y),t,'r')
hold off
view(45,48)
%对枝干图进行标注
xlabel('Real')
ylabel('Imaginary')
zlabel('Magnitude')