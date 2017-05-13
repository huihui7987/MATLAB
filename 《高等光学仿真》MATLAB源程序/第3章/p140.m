%`计算复平面上的单位圆`
th = (0:127)/128*2*pi;
x = cos(th);
y = sin(th);
%`计算频率相应的幅值`
f = abs(fft(ones(10,1),128));
%`绘制枝干图并设置视角`
stem3(x,y,f','d','fill')
view([-65 30])
%`对枝干图进行标注`
xlabel('Real')
ylabel('Imaginary')
zlabel('Amplitude')
title('Magnitude Frequency Response')