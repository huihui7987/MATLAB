%`带未知参数的边值问题的常微分方程数值求解`
function ex4bvp

solinit = bvpinit(linspace(0,pi,10),@ex4init,15);
options = bvpset('stats','on'); 
sol = bvp4c(@ex4ode,@ex4bc,solinit,options);
 
%`BVP4C 计算返回的数值解为结构体sol,其中未知参数的解为sol.parameters`
fprintf('\n');
fprintf('D02KAF 计算 lambda = 17.097.\n')
fprintf('bvp4c  计算 lambda =%7.3f.\n',sol.parameters)
 
figure
plot(sol.x,sol.y(1,:),sol.x,sol.y(1,:),'*')
axis([0 pi -1 1])
title(' Mathieu 方程特征值的数值解') 
xlabel('仅位于栅格点处的数据')

%`前面的作图只是利用在数值解的栅格点处的数据`
%`由于近似解是连续的并且是可导的，可以调用deval进行插值，`
%`获得任意点更为平滑的数据`
figure
xint = linspace(0,pi);
Sxint = deval(sol,xint); 
plot(xint,Sxint(1,:))
axis([0 pi -1 1])
title('Mathieu 方程特征值的数值解') 
xlabel('利用devel得到更密集的栅格点数值解')
 
%-------------------------------------------------------------------
%`边值问题的常微分方程，lambda为未知参数`
function dydx = ex4ode(x,y,lambda)
q = 5;
dydx = [              y(2)
         -(lambda - 2*q*cos(2*x))*y(1) ];
 
%-------------------------------------------------------------------
%`边值条件`
function res = ex4bc(ya,yb,lambda)
res = [ ya(2) 
        yb(2) 
        ya(1) - 1 ];
  
%-------------------------------------------------------------------
%`初始猜测方程`
function v = ex4init(x)
v = [   cos(4*x)
      -4*sin(4*x) ];
