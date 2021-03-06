function [Fy]=FyJSFun(x,y,x_dot,y_dot)

a=AFun(x,y,x_dot,y_dot);
ff_1 = -((x-2*y_dot)^2+(y+2*x_dot)^2)^0.5/(1-x^2-y^2);
Fy = ff_1 * (3*y*VFun(x,y,a)+cos(a)*GFun(x,y,a)-2*sin(a)*SFun(x,y,a));
end
