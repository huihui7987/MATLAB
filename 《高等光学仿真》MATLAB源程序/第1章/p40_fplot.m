x = 0.01:.001:.1;
subplot(3,1,1)
plot(x, sin(1./x))
axis([0.01 0.1 -1 1])
title('plot')
subplot(3,1,2)
fplot('sin(1/x)', [0.01 0.1]) % no, 1./x not needed!
axis([0.01 0.1 -1 1])
title('fplot')
subplot(3,1,3)
ezplot(@(x)sin(1./x),[0.01 0.1])
axis([0.01 0.1 -1 1])
title('ezplot')