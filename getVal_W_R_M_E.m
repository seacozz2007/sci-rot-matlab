%��Ҫ��֪������
%t:ʱ�䣨tao��
%w:ת��

%��������
M1 = 1;
M2 = 3.1    ;
M3 = 1;
M4 = 3.1;
M5 = 1;
M6 = zm;
%��������ϵ��
Cx1 = 0.1;
Cy1 = 0.1;

Cx2 = C/M1/w;
Cy2 = C/M1/w;

Cx3 = 0.1;
Cy3 = 0.1;

Cx4 = C/M1/w;
Cy4 = C/M1/w;
%����ϵ��
%���յ���ϵ��Ϊ 2Kmin,2Kapm;
kp = 0.3;
kmin = 1*kp;
kapm = ks*kp;
k1 = 1*kp;
k2 =1*kp;
k3 = 1*kp;

kx1 = k1+kmin+kapm*cos(w*t);
ky1 = k1+kmin+kapm*sin(w*t);

kx2 = k2+kmin+kapm*cos(w*t);
ky2 = k2+kmin+kapm*sin(w*t);

kx3 = k3;
ky3 = k3;

Kx1 = kx1/w/w;
Ky1 = ky1/w/w;

Kx2 = kx2/w/w;
Ky2 = ky2/w/w;

Kx3 = kx3/w/w;
Ky3 = ky3/w/w;
%����
T = 0.2;
%e1 = 0;
e2 = 0;

