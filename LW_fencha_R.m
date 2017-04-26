% 最大值法求解分岔图
clear all;
options=odeset('RelTol',1e-2);   %acc

figure;
set(gcf,'color','white')
n=10;m=20;
i1=floor(n*1/2)*m;
for r=linspace(1,20,50);  %r的变化精度
    r
    es=0.5/r;
    w=1;
    tt = 2*pi/w;  %step
    iniM=zeros(1,16);
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM,options,w,es,-1,-1,0.2,-1);
    [Xmax]=getmaxALL(xy(i1:end,5));
    %[Ymax]=getmaxALL(xy(i1:end,7));
    %subplot(2,1,1);
    hold on;
    plot(r,Xmax,'b.','markersize',10)
    %subplot(2,1,2);
    %hold on;
    %plot(r,Ymax,'b','markersize',1)

    drawnow;
    clear Xmax;
    %clear Ymax;
end