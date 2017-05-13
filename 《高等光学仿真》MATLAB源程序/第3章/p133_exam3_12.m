clear
close all

V = 5.0000;
U = 3.1527;
W = 3.8808;

Npoint = 201;
R1 = linspace(0,1,Npoint);
R2 = linspace(1,5,Npoint);
Theta1 = linspace(0,2*pi,Npoint);
Theta2 = linspace(0,2*pi,Npoint);

E1 = zeros(Npoint,Npoint);
E2 = zeros(Npoint,Npoint);
I1 = E1; I2= E2;

%`光纤纤芯中的光场分布`
for i = 1:Npoint
    for j = 1:Npoint
        E1(i,j) = besselj(1,U*R1(i))*cos(Theta1(j));
        I1(i,j) = E1(i,j).^2;
    end
end

%`光纤包层中的光场分布`
for i = 1:Npoint
    for j = 1:Npoint
        E2(i,j) = besselj(1,U).*besselk(1,W.*R2(i))./ ...
                  besselk(1,W)*cos(Theta1(j));
        I2(i,j) = E2(i,j).^2;
    end
end

%`极坐标变换为柱坐标，以便于作图`
[Theta1 R1] = meshgrid(Theta1, R1);
[Theta2 R2] = meshgrid(Theta2, R2);
[X1 Y1] = pol2cart(Theta1,R1);
[X2 Y2] = pol2cart(Theta2,R2);

%`三维作图并标注`
mesh(X1,Y1,I1)
hold on
mesh(X2,Y2,I2)
colorbar
xlabel('x')
ylabel('y')
zlabel('I')
title(['LP_{11} Mode, V = ' num2str(V)])