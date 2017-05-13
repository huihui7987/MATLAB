function dy = rate_eq(t,y,flag,Rp,T0,R)
sigma = 5.4e-23;
sigma_gs = 8.7e-23;
sigma_es = 2.2e-23;
N_T = 1.68e26;
tao_a = 750e-6;
tao_gs = 3e-6;
n1 = 1.82;
n2 = 1.80;
delta = 0.02;
l = 0.001;
ls = 0.001;
gamma = 1;
c = 2.997963e8;
lc = n1*l+n2*ls;

tr = lc/c;
n0s = -log(T0)/(sigma_gs*ls);

y(1) = max(y(1),1);

%被动调Q耦合方程组：
dy = [  y(1)*(2*sigma*y(2)*l-2*sigma_gs*y(3)*ls-2*sigma_es*...
                        (n0s-y(3))*ls-(log(1/R)+delta))/tr;
        Rp*(1-y(2)/N_T)-gamma*sigma*c*y(1)*y(2)-y(2)/tao_a;
        (n0s-y(3))/tao_gs-sigma_gs*c*y(1)*y(3)];