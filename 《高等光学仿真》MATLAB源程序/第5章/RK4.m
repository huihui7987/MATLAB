function [xout,yout] = RK4(odefile,xspan,y0)
   x0 = xspan(1); 
   xh = xspan(2);
   if length(xspan) >= 3
       h = xspan(3);
   else 
       h = (xspan(2)-xspan(1))/100; 
   end
   xout = [x0:h:xh]'; 
   yout = [];
   for x = xout'
      K1 = h*eval([odefile '(x,y0)']);
      K2 = h*eval([odefile '(x+h/2,y0+0.5*K1)']);
      K3 = h*eval([odefile '(x+h/2,y0+0.5*K2)']);
      K4 = h*eval([odefile '(x+h,y0+K3)']);
      y0 = y0+(K1+2*K2+2*K3+K4)/6;
      yout=[yout; y0'];
   end
