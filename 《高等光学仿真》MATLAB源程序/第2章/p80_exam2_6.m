syms x y z a b c

[x,y,z]=solve ('x*(x+y+z)-a','y*(x+y+z)-b','z*(x+y+z)-c','x,y,z')

a=6; b=12; c=18;
xv = subs(x,'[a b c]',[a b c])
yv = subs(y,'[a b c]',[a b c])
zv = subs(z,'[a b c]',[a b c])