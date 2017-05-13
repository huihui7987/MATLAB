function bratubvp
% Bratu 边值问题数值求解
 
    options = bvpset('stats','on');
    solinit = bvpinit(linspace(0,1,5),[0.1 0]);
    sol1 = bvp4c(@bratuode,@bratubc,solinit,options);
    fprintf('\n');
 
    % 改变初始猜想值来获得另外一个解
    solinit = bvpinit(linspace(0,1,5),[3 0]);
    sol2 = bvp4c(@bratuode,@bratubc,solinit,options);
 
    figure
    plot(sol1.x,sol1.y(1,:),sol2.x,sol2.y(1,:))
    xlabel('x')
    ylabel('y')
 
% --------------------------------------------------------------------------
function dydx = bratuode(x,y)
% Bratu 常微分方程
    dydx = [  y(2)
             -exp(y(1))];
 
% --------------------------------------------------------------------------
function res = bratubc(ya,yb)
%  Bratu 边值条件
    res = [ya(1)
           yb(1)];