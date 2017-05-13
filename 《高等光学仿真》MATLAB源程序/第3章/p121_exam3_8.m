%����ʽ(3.103)����LP01ģ�Ĺ⹦���������
Gamma1 =(1-U.^2./V.^2).*(1-besselj(0,U).^2./(besselj(1,U).*besselj(-1,U)));

%����ʽ(3.105)����LP01ģ�Ĺ⹦���������
for i = 1:length(V)
    Pcore(i) = quad(@(R) R.*besselj(0,U(i)*R).^2,0,1);
    Pclad(i) = quad(@(R) R.*besselj(0,U(i))^2.*besselk(0,W(i)*R).^2. ...
                         /besselk(0,W(i))^2,1,5);
    Gamma2(i) = Pcore(i)/(Pcore(i)+Pclad(i));
end

%`��ͼ����ע`
figure
plot(V,Gamma1,V,Gamma2,'r--')
xlabel('V')
ylabel('\Gamma_{01}')