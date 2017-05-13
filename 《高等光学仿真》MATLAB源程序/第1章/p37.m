x = 0:pi/100:2*pi;
subplot(2,2,1)
plot(sin(x), cos(x))
axis auto
grid on
title('axis auto')
subplot(2,2,2)
plot(sin(x), cos(x))
axis equal
title('axis equal')
subplot(2,2,3)
plot(sin(x), cos(x))
axis normal
title('axis normal')
subplot(2,2,4)
plot(sin(x), cos(x))
axis off
title('axis off')