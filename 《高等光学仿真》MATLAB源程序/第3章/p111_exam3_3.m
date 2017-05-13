NN = 15:24;
x = V(NN);
y = W(NN);
p = polyfit(x,y,1);
f = polyval(p,x);
maxerr = max(y-f);
figure
plot(x,y,'o',x,f,'-')
xlabel('V')
ylabel('W')