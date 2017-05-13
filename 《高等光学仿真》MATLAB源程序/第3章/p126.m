V = 1:0.01:2.5;
MFD1 = 0.65+1.619./V.^(3/2)+2.879./V.^6;
MFD2 = 1./sqrt(log(V));
plot(V,MFD1,V,MFD2,'r--')
xlabel('V')
ylabel('w_0/a')