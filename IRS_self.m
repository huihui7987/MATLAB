
%tao,Pp֮��Ĺ�ϵ
syms tao;
syms tmp
wa = 1439.5;                %�źŲ���
Gr = 7;                     %��������
Tr = 105;                   %����
r1 = 0.83;
M = (1-r1^2)/(1-r1*tao)^2;   %������ǿϵ��
Aeff = 2e-12;               %��Ҫ�����ݣ������һ��
L = 50e-6 * 2* pi;           %΢���ܳ�
Pp = 0:10:100;              %����Ϊ�Ա���
I = M*Pp/Aeff;              %���ڹ�ǿ
alphaR = Gr*I;              %���������
%tao = exp(-alphaR*L/2);     %���ϵ��
tmp = fsolve(@(tmp)+(tmp*Aeff/Gr/(1-r1^2))*(1-r1*exp(-1*tmp*L/2))^2-4,0);
%plot(Pp,tao);
tmp;


