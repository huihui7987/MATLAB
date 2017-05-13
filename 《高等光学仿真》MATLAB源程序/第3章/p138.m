function plotJnz
%`利用快速傅里叶变换(FFT)计算整数阶的Bessel函数`
x=0:0.2:20;
n=0:20;
J=jnfft(n,x);
surf(x,n,J');
title('Surface Plot For J_{n}(x)');
ylabel('n')
xlabel('x')
zlabel('J_{n}(x)')
%==============================================
function J=jnfft(n,z,nfft)
% `n - 定义Bessel函数阶数的整数矢量`
% `z - Bessel函数的自变量取值矢量`
% `nfft - 计算用到的点数，该值为2的证书次方，并且大于n的两倍，缺省情况下的取值为512`
if nargin<3, nfft=512; end;
J=exp(sin((0:nfft-1)'*(2*pi/nfft))*(j*z(:).'))/nfft;
J=fft(J);
J=J(1+n,:).';
if sum(abs(imag(z)))<max(abs(z))/1e10
    J=real(J);
end