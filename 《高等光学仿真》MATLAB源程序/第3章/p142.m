%���ٶ�vz �ͼ��ٶ�a���и�ֵ
vz = 10;
a = -50;
%����ʱ��t�ķ�Χ�����������������Ӧ�ĸ߶�z
t = 0:.1:1;
z = vz*t + 1/2*a*t.^2;
%����x�����y�����λ��
vx = 2;
x = vx*t;
vy = 3;
y = vy*t;
%�����ٶ�������������Ԫ
u = gradient(x);
v = gradient(y);
w = gradient(z);
%���ٶ�ʸ������ά��ͷͼ��ʾ�������������ӽǺͱ�ע
scale = 0;
quiver3(x,y,z,u,v,w,scale)
view([70 18])
xlabel('x'),ylabel('y'),zlabel('z')