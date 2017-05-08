function [dz]=dJSFunZ_W_R_M_E24(t,Z,pw,pr,pm,pe,pk,pc)
%振动方程组dJSFunZ_W_R_M_E(转动频率,径向间隙,飞轮质量,偏心距,变刚度幅值,阻尼系数)
%pw=转动频率;pr=径向间隙;pm=飞轮质量;pe=偏心距;pk=变刚度幅值;pc=阻尼系数
%默认值
w=1;zr=0.1;zm=1;e1=0;ks=0;C=0.3;
if (pw>=0) w=pw;end;
if (pr>=0) zr=pr;end;
if (pm>=0) zm=pm;end;
if (pe>=0) e1=pe;end;
if (pk>=0) ks=pk;end;
if (pc>=0) C=pc;end;

getVal_W_R_M_E;
es = zr;
es=0;
e1=0;
e2=0;

dz=zeros(24,1);
dz(1)=Z(2);
dz(2)=(  - ( Cx1*Z(2) +Kx1*Z(1)-Kx1*Z(5) ) + es*FxJSFun(Z(1),Z(3),Z(2),Z(4))  )/M1;
dz(3)=Z(4);
dz(4)=(  - ( Cy1*Z(4) +Ky1*Z(3)-Ky1*Z(7) ) +  es*FyJSFun(Z(1),Z(3),Z(2),Z(4))  )/M1;

dz(5)=Z(6);
dz(6)=(  - ( Cx2*Z(6) +Kx2*Z(5)-Kx1*Z(1) - Kx2*Z(9) ) + T*cos(w*t)  )/M2  +e1*w*w*cos(w*t) ;
dz(7)=Z(8);
dz(8)=(  - ( Cy2*Z(8) +Ky2*Z(7)-Ky1*Z(3) - Ky2*Z(11) ) + T*sin(w*t) )/M2 +e1*w*w*sin(w*t)  ;

dz(9)=Z(10);
dz(10)=(  - ( Cx3*Z(10) +Kx3*Z(9)-Kx2*Z(5)-Kx3*Z(13) ) +  es*FxJSFun(Z(9),Z(11),Z(10),Z(12))  )/M3;
dz(11)=Z(12);
dz(12)=(  - ( Cy3*Z(12) +Ky3*Z(11)-Ky2*Z(7)-Ky3*Z(15) ) +  es*FyJSFun(Z(9),Z(11),Z(10),Z(12))  )/M3;

dz(13)=Z(14);
dz(14)=(  - ( Cx2*Z(14) +Kx2*Z(13)-Kx1*Z(9) - Kx2*Z(17) ) + T*cos(w*t)  )/M4 +e1*w*w*cos(w*t+pi) ;
dz(15)=Z(16);
dz(16)=(  - ( Cy2*Z(16) +Ky2*Z(15)-Ky1*Z(11) - Ky2*Z(19) ) + T*sin(w*t) )/M4 + e1*w*w*sin(w*t+pi)  ;

dz(17)=Z(18);
dz(18)=(  - ( Cx3*Z(18) +Kx3*Z(17)-Kx2*Z(13)-Kx3*Z(21) ) +  es*FxJSFun(Z(17),Z(19),Z(18),Z(20))  )/M5;
dz(19)=Z(20);
dz(20)=(  - ( Cy3*Z(20) +Ky3*Z(19)-Ky2*Z(15)-Ky3*Z(23) ) +  es*FyJSFun(Z(17),Z(19),Z(18),Z(20))  )/M5;

dz(21)=Z(22);
dz(22)=(  - ( Cx4*Z(22) +Kx3*Z(21)-Kx3*Z(17) ) )/M6 + e2*w*w*cos(w*t)  ;
dz(23)=Z(24);
dz(24)=(  - ( Cy4*Z(24) +Ky3*Z(23)-Ky3*Z(19) ) )/M6 + e2*w*w*sin(w*t)  ;

end