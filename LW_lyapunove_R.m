%定义法求最大李亚普诺夫指数

clear all;
lya_pu=[];
sup_delt=1e-1;
options=odeset('RelTol',1e-3);   %acc
lya_pu=[];
tic
figure;
rs=linspace(1,200,40);  %r的变化精度
n=40;m=400;
i1=floor(n*2/4)*m;
for r=rs
    r
    es=0.5/r;
    w=1;
    k=0.5;
    tt =  2*pi/w;  %step
    iniM=zeros(1,16);
    display('get iniM');
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM,options,w,es,-1,-1,k,-1);
    display('get data1');
    data1=xy(i1:end,5);
    iniM2 = iniM + sup_delt;
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM2,options,w,-1,-1,-1,k,-1);
    display('get data2');
    data2=xy(i1:end,5);
    
d0=norm(iniM2(:,5)-iniM(:,5));
data_temp=data1-data2;
d=[];
for i=1:length(data_temp(:,1))
    d(i)=norm(data_temp(1,1));
end
lya=sum(log(d./d0))/length(data_temp(:,1))/10;
lya_pu=[lya_pu,lya];
hold on;plot(r,lya,'*');drawnow;
end
toc

figure
plot(rs,lya_pu);