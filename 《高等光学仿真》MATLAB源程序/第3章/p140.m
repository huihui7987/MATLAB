%`���㸴ƽ���ϵĵ�λԲ`
th = (0:127)/128*2*pi;
x = cos(th);
y = sin(th);
%`����Ƶ����Ӧ�ķ�ֵ`
f = abs(fft(ones(10,1),128));
%`����֦��ͼ�������ӽ�`
stem3(x,y,f','d','fill')
view([-65 30])
%`��֦��ͼ���б�ע`
xlabel('Real')
ylabel('Imaginary')
zlabel('Amplitude')
title('Magnitude Frequency Response')