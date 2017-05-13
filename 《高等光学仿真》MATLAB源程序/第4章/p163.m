clc
clear
close all
f = 0.1;
Z01 = [0 0.2 0.4 0.5 1 2 5]*f;
t = -2:0.01:4;
s0 = f*t;
w1w0 = zeros(length(t),length(Z01));

for i = 1:length(Z01)
    w1w0(:,i) = f./sqrt((s0-f).^2+Z01(i)^2);
end
plot(s0/f,w1w0)
axis([-2 4 0 6])
grid on
axis square

xlabel('s_0/f')
ylabel('w_1/w_0')
text(0.2,3.5,'Z_{01}/f')
text(1,5.5,'0')
[val pos] = max(w1w0);
for i=2:length(Z01)
    text(t(pos(i)),val(i),num2str(Z01(i)/f));
end