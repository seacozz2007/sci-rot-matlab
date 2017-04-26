%定义法求最大李亚普诺夫指数

clear
lya_pu=[];
sup_delt=1e-5;
options=odeset('RelTol',1e-3);   %acc
lya_pu=[];
tic
figure;
rs=linspace(0.6,10,10);  %r的变化精度
n=7;m=20;
i1=floor(n*1/2)*m;
for r=rs
    k=0
    w=r;
    tt =  2*pi/w;  %step
    iniM=zeros(1,16);
    display('get iniM');
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM,options,w,-1,-1,-1,k,-1);
    display('get data1');
    data1=xy(i1:end,7);
iniM2 = iniM + sup_delt;
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM2,options,w,-1,-1,-1,r,-1);
    display('get data2');
    data2=xy(i1:end,7);
    
d0=norm(iniM2(:,7)-iniM(:,7));
data_temp=data1-data2;
d=[];
for i=1:length(data_temp(:,1))
    d(i)=norm(data_temp(i,1));
end

lya=sum(log(d./d0))/length(data_temp(:,1))/10;
lya_pu=[lya_pu,lya];
hold on;plot(r,lya,'*');drawnow;
end
toc

figure
plot(rs,lya_pu);