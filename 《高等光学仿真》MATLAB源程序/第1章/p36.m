[x, y] = meshgrid(-3:0.3:3);
z=besselj(0,sqrt(x.^2+y.^2));
subplot(2,2,1)
mesh(x,y,z),title('subplot(2,2,1)')
subplot(2,2,2)
mesh(x,y,z)
view(-37.5,70),title('subplot(2,2,2)')
subplot(2,2,3)
mesh(x,y,z)
view(37.5,-10),title('subplot(2,2,3)')
subplot(2,2,4)
mesh(x,y,z)
view(0,0),title('subplot(2,2,4)')