function [dz]=ffun_1fod(t,Z)
%振动方程组dJSFunZ_W_R_M_E()
%m1--k1--m2--k2--m3
%f1------f2------f3
%f1=sin(wt)  f2=0  f3=0
%c1------c2------c3

%方程:
%m1*x1..+c1*x1.+k1x1=f1

%x1..=dz(2)  x1.=dz(1)=Z(2);  x1=Z(1);
init_nfod;
m=Mx(1,1);
k=Kx(1,1);
c=Cx(1,1);
F0=f1;

dz=zeros(2,1);
dz(1) = Z(2);
dz(2) = (-c*Z(2)-k*Z(1)+F0*cos(w*t))/m;

end