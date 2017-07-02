global gM gK gC gInvM gN gP gQ gW gS gKs gK0;
gbearC = 0.025;
n=4;
w=1;zr=8;zm=1;e1=0.1;ks=2;C=0.3;k=0.3;

rm = [1 1 1 1];
rc = [0 C 0 C]/w;

Mx = diag(rm);
My = Mx;

Cx = diag(rc);
Cy = Cx;
EE = zeros(n);


n=n*2;
gN=n;
gM = [Mx EE; EE My];
gInvM = inv(gM);

gC = [Cx EE; EE Cy]/w;

gW = w;
gP = e1/C;                %不平衡力
gQ = 1;                    %激励力
gS = zr/w/w/C;                               

gKs=ks;
gK0=k;

modify_K(0,gK0,gW,gKs);

