clear
close all

V = [0.8000    1.6000    2.4000];
U = [0.7974    1.3670    1.6453];
W = [0.0640    0.8315    1.7473];

Ra1 = -1:0.01:1;
Ra2 = [-5:0.01:-1];
Ra3 = [1:0.01:5];

E1 = zeros(length(V),length(Ra1));
E2 = zeros(length(V),length(Ra2));
E3 = zeros(length(V),length(Ra3));

for i = 1:length(V)
    E1(i,:) = besselj(0,U(i)*Ra1);
    E2(i,:) = besselj(0,U(i)).*besselk(0,W(i).*abs(Ra2))./besselk(0,W(i));
    E3(i,:) = besselj(0,U(i)).*besselk(0,W(i).*abs(Ra3))./besselk(0,W(i));
end
R = [Ra2 Ra1 Ra3];
E = [E2 E1 E3];

plot(R,E)
xlabel('R_a=r/a')
ylabel('E')
hold on
plot([-1 -1],[0 1],'b--',[1 1],[0,1],'b--')