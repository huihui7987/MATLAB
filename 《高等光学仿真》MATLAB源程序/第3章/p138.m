function plotJnz
%`���ÿ��ٸ���Ҷ�任(FFT)���������׵�Bessel����`
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
% `n - ����Bessel��������������ʸ��`
% `z - Bessel�������Ա���ȡֵʸ��`
% `nfft - �����õ��ĵ�������ֵΪ2��֤��η������Ҵ���n��������ȱʡ����µ�ȡֵΪ512`
if nargin<3, nfft=512; end;
J=exp(sin((0:nfft-1)'*(2*pi/nfft))*(j*z(:).'))/nfft;
J=fft(J);
J=J(1+n,:).';
if sum(abs(imag(z)))<max(abs(z))/1e10
    J=real(J);
end