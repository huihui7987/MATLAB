syms x z t alpha

int(-2*x/(1+x^2)^2)
%������Ϊ
1/(1+x^2)

int(x/(1+z^2),z)
%������Ϊ
x*atan(z)

int(x*log(1+x),0,1)
%������Ϊ
1/4

int(2*x, sin(t), 1)
%������Ϊ
1-sin(t)^2

int([exp(t),exp(alpha*t)])
%������Ϊ
[exp(t), 1/alpha*exp(alpha*t)] 