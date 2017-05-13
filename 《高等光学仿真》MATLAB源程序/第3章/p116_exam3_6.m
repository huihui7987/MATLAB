clear
close all

V = 2.4000;
U = 1.6453;
W = 1.7473;

Npoint = 201;
R1 = linspace(0,1,Npoint);
R2 = linspace(1,5,Npoint);
Theta1 = linspace(0,2*pi,Npoint);
Theta2 = linspace(0,2*pi,Npoint);

E1 = zeros(Npoint,Npoint);
E2 = zeros(Npoint,Npoint);
I1 = E1; I2= E2;

for i = 1:Npoint
    E1(:,i) = besselj(0,U*R1);
    I1(:,i) = E1(:,i).^2;
end

for i = 1:Npoint
    E2(:,i) = besselj(0,U).*besselk(0,W.*R2)./besselk(0,W);
    I2(:,i) = E2(:,i).^2;
end

[Theta1 R1] = meshgrid(Theta1, R1);
[Theta2 R2] = meshgrid(Theta2, R2);
[X1 Y1] = pol2cart(Theta1,R1);
[X2 Y2] = pol2cart(Theta2, R2);

mesh(X1,Y1,I1)
hold on
mesh(X2,Y2,I2)
colorbar
xlabel('x')
ylabel('y')
zlabel('I')