format long g
xx = 0:0.1:2;
fx = besselj(0,xx);
px = spline(xx,fx);
int_px = fnint(px);
Vfx = ppval(int_px,[0,1])*[-1; 1]