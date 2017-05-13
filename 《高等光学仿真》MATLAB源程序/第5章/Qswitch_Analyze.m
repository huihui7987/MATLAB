y1 = y(:,1);
sdy1 = sign(round(diff(y1)));
sdy2 = sign(round(diff(sdy1)));

pos = find(sdy2<0) + 1;

n = 21;
N = 50;

%��ѡȡ������Ŀ�ȡ�����������������ͬһͼ�л���
figure
hold on
for i = 2:n
    tp = [pos(i)-N:pos(i)+N]';
    dt = mean(diff(t(tp)));
    plot(-dt*N:dt:dt*N,y(tp,1))
    ymax(i) = y1(pos(i));
    pp = find(y1(tp)>=ymax(i)/2);
    pwidth(i) = t(pos(n)-N+pp(end)) - t(pos(n)-N+pp(1));
    pspace(i) = t(pos(i+1)) - t(pos(i));
end
xlabel('ʱ��(s)')
ylabel('�������ܶ�(m^{-3})')

freqency = 1/mean(pspace(2:n));
width = mean(pwidth);