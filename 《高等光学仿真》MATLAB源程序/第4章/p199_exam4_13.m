clc
clear
close all

%�Ի���������ͼ�������б�ע
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

%��˫�ػ����ڸ����Ļ��������Ͻ��з��ż���
syms x y
%�ο���������ͼ�����������ĺ���������
[xa ya] = solve('y-1/(4*x)','y-sqrt(x)',x,y);
f=exp(x^2+y^2);
y1 = 1/(4*x);
y2 = sqrt(x);
intfy = int(f,y,y1,y2);
intfx = int(intfy,x,xa,2);
intf = double(intfx)