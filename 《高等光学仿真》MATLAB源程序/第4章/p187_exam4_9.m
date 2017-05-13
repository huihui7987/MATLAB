t = 0:0.1:2;
%根据式(4.132)计算耦合效率
eta1 = 2/pi*acos(t/2) - t/pi.*sqrt(1-(t/2).^2);

for i = 1:length(t)
    %根据式(4.134)计算耦合效率
    eta2(i) = quad(@(x)(sqrt(1-x.^2)), t(i)/2,1)/pi*4;
    %根据式(4.135)计算耦合效率
    eta3(i) = dblquad(@(x,y)(sqrt(x.^2+y.^2)<=1 &...
        sqrt((x-t(i)).^2+y.^2)<=1), -1,1,-1,1)/pi;
end

%根据计算结果作图
plot(t,eta1,t,eta2,'r+',t,eta3,'go')
xlabel('d/a')
ylabel('\eta_{F,step}')