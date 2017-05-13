
%tao,Pp之间的关系
syms tao;
syms tmp
wa = 1439.5;                %信号波长
Gr = 7;                     %拉曼增益
Tr = 105;                   %蓝移
r1 = 0.83;
M = (1-r1^2)/(1-r1*tao)^2;   %功率增强系数
Aeff = 2e-12;               %需要查数据，随便编的一个
L = 50e-6 * 2* pi;           %微环周长
Pp = 0:10:100;              %功率为自变量
I = M*Pp/Aeff;              %环内光强
alphaR = Gr*I;              %逆拉曼损耗
%tao = exp(-alphaR*L/2);     %损耗系数
tmp = fsolve(@(tmp)+(tmp*Aeff/Gr/(1-r1^2))*(1-r1*exp(-1*tmp*L/2))^2-4,0);
%plot(Pp,tao);
tmp;


