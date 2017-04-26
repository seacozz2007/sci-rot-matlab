function [dy]=dJSFun(t,Y,flag,m,w)
%m=omiga^2*c/st/g
%p=E/c
p=0.3;
st=0.1;
dy=zeros(4,1);
dy(1)=Y(3);
dy(2)=Y(4);
dy(3)=1/m*FxJSFun(Y(1),Y(2),Y(3),Y(4),w)+p*cos(w*t);
dy(4)=1/m*FyJSFun(Y(1),Y(2),Y(3),Y(4),w)-1/st/m+p*sin(w*t);

end