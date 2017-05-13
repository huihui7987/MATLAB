%`��δ֪�����ı�ֵ����ĳ�΢�ַ�����ֵ���`
function ex4bvp

solinit = bvpinit(linspace(0,pi,10),@ex4init,15);
options = bvpset('stats','on'); 
sol = bvp4c(@ex4ode,@ex4bc,solinit,options);
 
%`BVP4C ���㷵�ص���ֵ��Ϊ�ṹ��sol,����δ֪�����Ľ�Ϊsol.parameters`
fprintf('\n');
fprintf('D02KAF ���� lambda = 17.097.\n')
fprintf('bvp4c  ���� lambda =%7.3f.\n',sol.parameters)
 
figure
plot(sol.x,sol.y(1,:),sol.x,sol.y(1,:),'*')
axis([0 pi -1 1])
title(' Mathieu ��������ֵ����ֵ��') 
xlabel('��λ��դ��㴦������')

%`ǰ�����ͼֻ����������ֵ���դ��㴦������`
%`���ڽ��ƽ��������Ĳ����ǿɵ��ģ����Ե���deval���в�ֵ��`
%`���������Ϊƽ��������`
figure
xint = linspace(0,pi);
Sxint = deval(sol,xint); 
plot(xint,Sxint(1,:))
axis([0 pi -1 1])
title('Mathieu ��������ֵ����ֵ��') 
xlabel('����devel�õ����ܼ���դ�����ֵ��')
 
%-------------------------------------------------------------------
%`��ֵ����ĳ�΢�ַ��̣�lambdaΪδ֪����`
function dydx = ex4ode(x,y,lambda)
q = 5;
dydx = [              y(2)
         -(lambda - 2*q*cos(2*x))*y(1) ];
 
%-------------------------------------------------------------------
%`��ֵ����`
function res = ex4bc(ya,yb,lambda)
res = [ ya(2) 
        yb(2) 
        ya(1) - 1 ];
  
%-------------------------------------------------------------------
%`��ʼ�²ⷽ��`
function v = ex4init(x)
v = [   cos(4*x)
      -4*sin(4*x) ];
