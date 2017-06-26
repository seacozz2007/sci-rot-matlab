    clear all;    
    options=odeset('RelTol',1e-3);   %acc
    init_nfod;
    init_nfod_global;
    iniM=zeros(gN*2,1);
    [t,xy]=ode45(@ffun_nfod,0:dt:dt*nt,iniM,options);
    n=gdn;
    for i=1:gdn
        subplot(3,n,i+n*2); plot(t(ise),xy(ise,gsf(i)),'-');
    end