%需要已知变量：
%t:时间（tao）
%w:转速

%各点质量
M1 = 1;
M2 = 1;
M3 = 1;
M4 = 1;
M5 = 1;
M6 = 1;
%各点阻尼系数
Cx1 = 0;
Cy1 = 0;

Cx2 = 0;
Cy2 = 0;

Cx3 = 0;
Cy3 = 0.1;

Cx4 = 0;
Cy4 = 0;
%弹性系数
%曲拐弹性系数为 2Kmin,2Kapm;
kp = 0.3;
kmin = 0*kp;
kapm = ks*kp;

kapm=0;
k1 = 1*kp;
k2 =1*kp;
k3 = 1*kp;

% kx1 = k1+kmin+kapm*cos(w*t);
% ky1 = k1+kmin+kapm*sin(w*t);
% 
% kx2 = k2+kmin+kapm*cos(w*t);
% ky2 = k2+kmin+kapm*sin(w*t);

% kx3 = k3;
% ky3 = k3;

Kx1 = kp;
Ky1 = kp;

Kx2 = kp;
Ky2 = kp;

Kx3 = kp;
Ky3 = kp;
%其它
T = 1;
%e1 = 0;
e2 = 0;

