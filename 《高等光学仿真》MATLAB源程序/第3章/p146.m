nr=12;nth=50;
r=linspace(0,1,nr);
theta=linspace(0,2*pi,nth);
[R,T]=meshgrid(r,theta)
x=cos(theta')*r;
y=sin(theta')*r;
surf(x,y,R.^3.*cos(3*T))
hold on
z0=repmat(0.4,size(x));
surf(x,y,z0)
surf(x,y,-z0)
view(-42.5,20)