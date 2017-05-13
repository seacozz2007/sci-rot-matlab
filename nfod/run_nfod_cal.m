init_nfod;
m=Mx(1,1);
k=Kx(1,1);
F0=f1;

wn=(k/m)^0.5;
w=w;

t=0:dt:(dt*nt);

y=F0/(k-m*w*w)*(cos(w*t)-cos(wn*t));
subplot(3,3,1);plot(t,y,'-');

clear all;    
init_nfod;
options=odeset('RelTol',1e-3);   %acc
iniM=zeros(1,2);
[t,xy]=ode45(@ffun_1fod,0:dt:dt*nt,iniM,options);
subplot(3,3,2); plot(t,xy(:,1),'-');

