clc
clear
close all
f = 0.1;
Z0 = [0 0.2 0.4 0.5 1 5]*f;
t = -2:0.01:4;
s1 = f*t;
s2 = zeros(length(t),length(Z0));
for i = 1:length(Z0)
    s2(:,i) = f+(s1-f)*f^2./[(f-s1).^2+Z0(i).^2];
end
plot(s1/f,s2/f)
axis([-2 4 -2 4])
grid on 
axis square

xlabel('s_0/f')
ylabel('s_i/f')
text(0.5,2.5,'Z_{01}/f')
text(1.3,3.8,'0')
[val pos] = max(s2);
for i=2:length(Z0)
    text(t(pos(i))-0.1,val(i)/f-0.1,num2str(Z0(i)/f));
end