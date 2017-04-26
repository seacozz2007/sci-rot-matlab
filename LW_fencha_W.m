% 最大值法求解分岔图
clear all;
options=odeset('RelTol',1e-2);   %acc

figure;
set(gcf,'color','white')
n=15;m=20;
i1=floor(n*1/2)*m;
for r=linspace(0.6,1.2,80);  %r的变化精度
    r
    w=r;
    k=0.5;
    tt = 2*pi;  %step
    iniM=zeros(1,16);
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM,options,w,-1,-1,-1,k,-1);
    [Xmax]=getmaxALL(xy(i1:end,5));
    [Ymax]=getmaxALL(xy(i1:end,7));
    subplot(2,1,1);
    hold on;
    plot(r,Xmax,'b','markersize',1)

    subplot(2,1,2);
    hold on;
    plot(r,Ymax,'b','markersize',1)

    drawnow;
    clear Xmax;
    clear Ymax;
end