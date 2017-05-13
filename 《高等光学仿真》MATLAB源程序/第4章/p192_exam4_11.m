clear
close all

NA = [0.05 0.11 0.22 0.36 0.48];
theta_c = asin(NA);
LFs = 3;

%���ݹ�ʽ(4.150)����3dB�������ֵ����Ӧ�Ĺ�һ�������׼���ֵ
for i = 1:length(theta_c)
    t(i) =fzero(@(t)(-10*log(1./(1+t*tan(theta_c(i))).^2) - LFs),1);
end

%��MATLAB���������ʾ��ͬ��ֵ�׾��¶�Ӧ3dB��ĵĹ�һ�������׼���ֵ
disp('    NA        t=s/a')
disp([NA'  t'])