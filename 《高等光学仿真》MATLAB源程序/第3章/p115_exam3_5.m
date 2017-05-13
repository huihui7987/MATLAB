clear
close all

V = 2.4000;
U = 1.6453;
W = 1.7473;

Npoint = 501;

x = linspace(-5,5,Npoint);
y = linspace(-5,5,Npoint);
X = meshgrid(x,y);
Y = meshgrid(y,x);
Y = Y';
R = sqrt(X.^2 + Y.^2);

I1 = besselj(0,U*R).^2;
I2 = (besselj(0,U).*besselk(0,W.*R)./besselk(0,W)).^2;
I = I1;
pos = find(R>=1);
I(pos) = I2(pos);

imagesc(x,y,I,[0 1]);
colormap(gray);
colorbar
xlabel('x')
ylabel('y')
zlabel('I')