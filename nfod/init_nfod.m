global gM gK gC gInvM gN gP gQ gW;
gbearC = 0.025;
n=1;
rm = 70;
rk = 0;
rc = 0;
gP = rm * 0.3;
gQ = 0.1;

gN=n*2;
gM = [rm 0;0 rm];
gInvM = inv(gM);
gK = [rk 0;0 rk];
gC = [rc 0;0 rc];
gW = 1;

dt = 0.01;
nt = 6420/dt;
is = 6300/dt;
ie = 6420/dt;
ise=is:ie;