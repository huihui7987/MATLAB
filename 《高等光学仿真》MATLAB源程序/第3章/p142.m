%对速度vz 和加速度a进行赋值
vz = 10;
a = -50;
%设置时间t的范围及其增量，计算出对应的高度z
t = 0:.1:1;
z = vz*t + 1/2*a*t.^2;
%计算x方向和y方向的位置
vx = 2;
x = vx*t;
vy = 3;
y = vy*t;
%计算速度向量的三个组元
u = gradient(x);
v = gradient(y);
w = gradient(z);
%将速度矢量用三维箭头图显示出来，并设置视角和标注
scale = 0;
quiver3(x,y,z,u,v,w,scale)
view([70 18])
xlabel('x'),ylabel('y'),zlabel('z')