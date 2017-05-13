clear
close all

V = 5.0000;
U = 3.1527;
W = 3.8808;

Npoint = 501;

x = linspace(-5,5,Npoint);
y = linspace(-5,5,Npoint);
X = meshgrid(x,y); 
Y = meshgrid(y,x);
Y = Y';
R = sqrt(X.^2 + Y.^2);
Theta = atan(Y./(X+eps));

%`������о�еĹⳡ�ֲ�`
I1 = (besselj(1,U*R).*cos(Theta)).^2;
%`���˰����еĹⳡ�ֲ�`
I2 = (besselj(1,U)*besselk(1,W.*R).*cos(Theta)/besselk(1,W)).^2;
I = I1;
pos = find(R>=1);
I(pos) = I2(pos);
I = I/max(max(I1));

%`����ά�ⳡ�ֲ�ͼ�������б�ע`
imagesc(x,y,I,[0 1]);
colormap(gray); 
colorbar 
xlabel('x')
ylabel('y')
zlabel('I')
title(['LP_{11} Mode, V = ' num2str(V)])