% 最大值法求解分岔图
clear all;
options=odeset('RelTol',1e-2);   %acc

figure;
set(gcf,'color','white')
n=15;m=20;
i1=floor(n*1/2)*m;
lineX=[];
lineY=[];
i=0;
s=linspace(0.7,1.1,20);
for r=s;  %r的变化精度
 
    r
    w=r;
    k=1.5;
    tt = 2*pi;  %step
    iniM=zeros(1,24);
    [t,xy]=ode45(@dJSFunZ_W_R_M_E24T0xy,[0:tt/m:n*tt],iniM,options,w,-1,-1,-1,k,-1);
    Xmax=max(abs(xy(i1:end,5)));
    Ymax=max(abs(xy(i1:end,7)));
    subplot(2,1,1);
    hold on;
    plot(r,Xmax,'b*')
    lineX=[lineX Xmax];
    lineY=[lineY Ymax];
    subplot(2,1,2);
    hold on;
    plot(r,Ymax,'b*')
    drawnow;
    clear Xmax;
    clear Ymax;
end

figure;
ls=linspace(0.7,1,100);

lx=spline(s,lineY,ls);ly=spline(s,lineX,ls);
plot(ls.*100,lx,'b',ls.*100,ly,'r--');