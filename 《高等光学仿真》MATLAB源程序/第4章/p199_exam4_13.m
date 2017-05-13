clc
clear
close all

%对积分区域作图，并进行标注
xmax = 2.5; ymax = xmax;;
xmin = 0; ymin = xmin;
fplot(@(x)(1/(4*x)),[xmin xmax])
text(1,1/4-0.1,'y=1/(4x)')
hold on
fplot(@(x)(sqrt(x)),[xmin xmax])
text(1,1.2,'y=sqrt(x)')
line([2 2],[ymin ymax])
text(2.05,0.8,'x=2')
text(1.3,0.7,'D_{xy}')
axis([xmin xmax ymin ymax])

%对双重积分在给定的积分区域上进行符号计算
syms x y
%参考积分区域图求出积分区域的横坐标下限
[xa ya] = solve('y-1/(4*x)','y-sqrt(x)',x,y);
f=exp(x^2+y^2);
y1 = 1/(4*x);
y2 = sqrt(x);
intfy = int(f,y,y1,y2);
intfx = int(intfy,x,xa,2);
intf = double(intfx)