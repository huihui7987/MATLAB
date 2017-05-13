clear
close all

NA = [0.05 0.11 0.22 0.36 0.48];
theta_c = asin(NA);
LFs = 3;

%根据公式(4.150)计算3dB插入损耗值所对应的归一化径向对准误差值
for i = 1:length(theta_c)
    t(i) =fzero(@(t)(-10*log(1./(1+t*tan(theta_c(i))).^2) - LFs),1);
end

%在MATLAB命令窗口中显示不同数值孔径下对应3dB损耗的归一化径向对准误差值
disp('    NA        t=s/a')
disp([NA'  t'])