global gM gK gC gInvM gN gW gF1;

n=6;
rm = [1360 4123 1813 4123 2012 7123];
rk = [0 1e9 1e9 1e9 1e9 1e9 0];
rc = [0 0 0 0 0 0]+0.3;

f1 = 1;
w = 10;

Mx = diag(rm);
%Mx =diag([1e3 1 1 1 1 1]);
My = Mx;

Kx = diag(rk(1:n))+diag(rk(2:n+1))-diag(rk(2:n),1)-diag(rk(2:n),-1);
%Kx = diag([1e9 0 0 0 0 0]);
Ky = Kx;

Cx = diag(rc);
%Cx =diag([0 0 0 0 0 0]);
Cy = Cx;
E6 = zeros(n);

n=12;
gN=n;

gM = [Mx E6; E6 My];
gInvM = inv(gM);

gK = [Kx E6; E6 Ky];

gC = [Cx E6; E6 Cy];

gF1 =f1;

gW = w;


nt = 10000;
dt = 0.01;
