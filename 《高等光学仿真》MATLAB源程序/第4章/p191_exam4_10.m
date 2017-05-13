clear
close all

NA = [0.05 0.11 0.22 0.36 0.48];
theta_c = asin(NA);
t = 0:0.1:10;
LFs = zeros(length(t),length(theta_c));

%根据公式(4.150)计算不同光纤临界接收角下的插入损耗值
for i = 1:length(theta_c)
    LFs(:,i) = -10*log(1./(1+t*tan(theta_c(i))).^2);
end

%根据计算结果作图
plot(t,LFs)
xlabel('t=s/a')
ylabel('L_{Fs}(dB)')

%标注不同光纤临界接收角下对应的插入损耗曲线
for i = 1:length(theta_c)
     text(8,LFs(80,i)-0.8,['NA =' num2str(NA(i))]);
end