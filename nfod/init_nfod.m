global gM gK gC gInvM gN gP gQ gW;
gbearC = 0.025;
n=6;
rm = [1360 4123 1813 4123 2012 7123];
rk = [0 1e9 1e9 1e9 1e9 1e9 0];
rc = [0 0 0 0 0 0];

f1 = 1;
w = 20;

Mx = diag(rm);
Mx =diag([70 1 1 1 1 1]);
My = Mx;

Kx = diag(rk(1:n))+diag(rk(2:n+1))-diag(rk(2:n),1)-diag(rk(2:n),-1);
Kx = diag([0 0 0 0 0 0]);
Ky = Kx;

Cx = diag(rc);
Cx =diag([0 0 0 0 0 0]);
Cy = Cx;
E6 = zeros(n);

n=n*2;
gN=n;

gM = [Mx E6; E6 My];
gInvM = inv(gM);
gK = [Kx E6; E6 Ky];
gC = [Cx E6; E6 Cy];

gW = w;

gP = 70 * 0.3;
gQ = 0.1;

dt = 0.01;
nt = 6420/dt;
is = 6300/dt;
ie = 6420/dt;
ise=is:ie;