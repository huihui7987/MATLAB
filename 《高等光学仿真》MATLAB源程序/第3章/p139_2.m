[X1,Y1] = meshgrid([-2:0.1:2]);
Z1 = X1.*exp(-X1.^2-Y1.^2);
plot3(X1,Y1,Z1)
grid on
xlabel('x'),ylabel('y'),zlabel('z')