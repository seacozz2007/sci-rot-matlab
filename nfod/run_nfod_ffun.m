    clear all;    
    options=odeset('RelTol',1e-3);   %acc
    init_nfod;
    init_nfod_global;
    iniM=zeros(gN*2,1);
    [t,xy]=ode45(@ffun_nfod,0:dt:dt*nt,iniM,options);
    n=2;
