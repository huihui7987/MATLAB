function ex3bvp
% �ı� bvp4c ��ȱʡ���������������ֵ����ĳ�΢�ַ���
  
% ������������ֵ��������ֵ����бȽ�
tt = -0.1:0.01:+0.1;
p = 1e-5;
yy = tt ./ sqrt(p + tt .^2);
 
options = bvpset('stats','on','Fjacobian',@ex3Jac);
solinit = bvpinit(linspace(-0.1,0.1,10),[0 10]);
 
sol = bvp4c(@ex3ode,@ex3bc,solinit, options);
t = sol.x;
y = sol.y;
 
figure
plot(t,y(1,:),tt,yy,'*')
axis([-0.1 0.1 -1.1 1.1])
title('RelTol = 1\times 10^{-3}')
xlabel('t')
ylabel('Numerical Solutions and Analytical Solutions(*)') 
fprintf('\n');
 
% ���ø�С���������ڼ��㳣΢�ַ��̵���ֵ��
options = bvpset(options,'RelTol',1e-4);
sol = bvp4c(@ex3ode,@ex3bc,sol,options);
t = sol.x;
y = sol.y;
 
figure
plot(t,y(1,:),tt,yy,'*')
axis([-0.1 0.1 -1.1 1.1])
title('RelTol = 1\times 10^{-4}')
xlabel('t')
ylabel('Numerical Solutions and Analytical Solutions(*)')
 %--------------------------------------------------------------------------
 function dydt = ex3ode(t,y)
% ��ֵ����ĳ�΢�ַ�����
p = 1e-5;
dydt = [ y(2)
        -3*p*y(1)/(p+t^2)^2];

%------------------------------------------------------------------------- 
function dfdy = ex3Jac(t,y)
%��΢�ַ������ Jacobian ����  
p = 1e-5;
dfdy = [          0        1
         -3*p/(p+t^2)^2    0 ];    

%--------------------------------------------------------------------------
 function res = ex3bc(ya,yb)
%��ֵ����
p = 1e-5;
yatb = 0.1/sqrt(p + 0.01);
yata = - yatb;
res = [ ya(1) - yata
        yb(1) - yatb ];
