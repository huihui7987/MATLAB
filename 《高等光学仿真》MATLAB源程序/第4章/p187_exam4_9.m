t = 0:0.1:2;
%����ʽ(4.132)�������Ч��
eta1 = 2/pi*acos(t/2) - t/pi.*sqrt(1-(t/2).^2);

for i = 1:length(t)
    %����ʽ(4.134)�������Ч��
    eta2(i) = quad(@(x)(sqrt(1-x.^2)), t(i)/2,1)/pi*4;
    %����ʽ(4.135)�������Ч��
    eta3(i) = dblquad(@(x,y)(sqrt(x.^2+y.^2)<=1 &...
        sqrt((x-t(i)).^2+y.^2)<=1), -1,1,-1,1)/pi;
end

%���ݼ�������ͼ
plot(t,eta1,t,eta2,'r+',t,eta3,'go')
xlabel('d/a')
ylabel('\eta_{F,step}')