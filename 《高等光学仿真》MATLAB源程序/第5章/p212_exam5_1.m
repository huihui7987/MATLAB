clc
clear
close all

c1 = 3.741832e4;
c2 = 1.438786e4;

lambda = logspace(-1,2,100);
T = [200 273 400 800 1000 1500 2000 3000 4000 5000 6000]';

MB = zeros(length(lambda),length(T));
for i = 1:length(T)
    MB(:,i) = c1./(lambda.^5.*(exp(c2./(lambda*T(i))-1)));
end

loglog(lambda,MB)
axis([0.1 100 1e-4 1e5])
grid on 
xlabel('\lambda /\mum')
ylabel('M_{B\lambda}(T)/ W\cdotcm^{-2}\cdot\mum^{-1}')

[Mmax pos]=max(MB); 
for i = 1:length(T)
   text(lambda(pos(i)),Mmax(i),[num2str(T(i)) 'K']);
end