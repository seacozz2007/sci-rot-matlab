    clear all;    
    options=odeset('RelTol',1e-3);   %acc
    init_nfod;
    iniM=zeros(gN*2,1);
    [t,xy]=ode45(@ffun_nfod,0:dt:dt*nt,iniM,options);
    n=2;
    for i=1:n
        subplot(3,n,i+n*2); plot(t(ise),xy(ise,i*gN/2+1-gN/2),'-');
    end
