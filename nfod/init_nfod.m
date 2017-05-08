n=6;
rm = [1 1 1 1 1 1];
rk = [0 1 1 1 1 1 0];
rc = [0 0 0 0 0 0];

f1 = 1;
w = 1;

M = diag(rm);

K = diag(rk(1:n))+diag(rk(2:n+1))-diag(rk(2:n),1)-diag(rk(2:n),-1);
C = diag(rc);


nt = 100000;
dt = 0.01;
