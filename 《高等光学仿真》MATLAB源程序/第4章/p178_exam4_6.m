N = 1000;
theta = linspace(-pi/2,pi/2,N);
B1 = cos(theta);
L = log(0.5)/log(cos(7.5/180*pi));
B2 = cos(theta).^L;
polar(theta,B1)
hold on
polar(theta,B2,'--r')