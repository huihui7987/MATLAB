t = 0:.1:10;
s = 0.1+i;
y = exp(-s*t);
%����֦��ͼ�������ӽ�
stem3(real(y),imag(y),t)
hold on
plot3(real(y),imag(y),t,'r')
hold off
view(45,48)
%��֦��ͼ���б�ע
xlabel('Real')
ylabel('Imaginary')
zlabel('Magnitude')