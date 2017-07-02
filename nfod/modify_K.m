function [kk] = modify_K(t,kp,w,ks)
%根据角度重新计算刚度矩阵
    global gK gN;
    n=gN/2;
    kmin = 0*kp;
    kapm = ks*kp;
    k1 = 1*kp;
    k2 =1*kp;
    k3 = 1*kp;

    kx1 = k1+kmin+kapm*cos(t);
    ky1 = k1+kmin+kapm*sin(t);

    kx2 = k2+kmin+kapm*cos(t);
    ky2 = k2+kmin+kapm*sin(t);

    rk = [0 kx1 kx2 k3 0];
    Kx = (diag(rk(1:n))+diag(rk(2:n+1))-diag(rk(2:n),1)-diag(rk(2:n),-1))/w/w;
    rk = [0 ky1 ky2 k3 0];
    Ky = (diag(rk(1:n))+diag(rk(2:n+1))-diag(rk(2:n),1)-diag(rk(2:n),-1))/w/w;
    EE = zeros(n);
    gK = [Kx EE; EE Ky];
    kk=gK;
end

