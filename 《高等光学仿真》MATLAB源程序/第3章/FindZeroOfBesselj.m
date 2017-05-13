function xp = FindZeroOfBesselj(m,n)

xp = zeros(n,1);    
x0 = m + 2.5;
xp(1) = fzero(@(x)besselj(m,x), x0);
    
if( n>1.5 )
    xp(2) = fzero(@(x)besselj(m,x), xp(1)+pi);
end
    
if ( n > 2.5)
    for ii = 3:n
        xp(ii) = fzero(@(x)besselj(m,x), 2*xp(ii-1)-xp(ii-2));
    end    
end

x = linspace(0,ceil(xp(end)),1000);
y = besselj(m,x);
plot(xp,zeros(1,n),'o',x,y,'-')   %`作出m阶贝赛尔函数曲线并标记其零点`
line([0 ceil(xp(end))],[0 0],'color','black')
axis([0 ceil(xp(end)) -0.5 1.0])
xlabel('U')
ylabel('J(U)')
title(['m=' num2str(m) ',n=' num2str(n)])