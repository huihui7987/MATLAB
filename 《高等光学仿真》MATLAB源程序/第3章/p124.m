WM = 0.65+1.619./V.^(3/2)+2.879./V.^6;
WPI = sqrt(4/3*((besselj(0,V.*sqrt(1-b))./(V.*sqrt(1-b).* ...
      besselj(1,V.*sqrt(1-b)))+1/2+1./(V.^2.*b)-1./(V.^2.*(1-b)))));
WPII = sqrt(2)./(V.*sqrt(b)).*besselj(1,V.*sqrt(1-b))./ ...
       besselj(0,V.*sqrt(1-b));

plot(V,WM,'b-',V,WPI,'r--',V,WPII,'g-.')
axis([.5 5 0 3])
grid on
legend('w_{\rm M}/a','w_{{\rm PI}}/a','w_{{\rm PII}}/a')
xlabel('V')
ylabel('Mode Field Radius w_{\rm M}/a,w_{{\rm PI}}/a,w_{{\rm PII}}/a ')