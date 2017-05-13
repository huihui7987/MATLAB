clear
close all

NA = [0.05 0.11 0.22 0.36 0.48];
theta_c = asin(NA);
t = 0:0.1:10;
LFs = zeros(length(t),length(theta_c));

%���ݹ�ʽ(4.150)���㲻ͬ�����ٽ���ս��µĲ������ֵ
for i = 1:length(theta_c)
    LFs(:,i) = -10*log(1./(1+t*tan(theta_c(i))).^2);
end

%���ݼ�������ͼ
plot(t,LFs)
xlabel('t=s/a')
ylabel('L_{Fs}(dB)')

%��ע��ͬ�����ٽ���ս��¶�Ӧ�Ĳ����������
for i = 1:length(theta_c)
     text(8,LFs(80,i)-0.8,['NA =' num2str(NA(i))]);
end