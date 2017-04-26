% 最大值法求解分岔图
options=odeset('RelTol',1e-2);   %acc

figure;
set(gcf,'color','white')
n=20;m=50;
i1=floor(n*1/2)*m;
Xline3=[];
i=0;
for r=linspace(0.4,1.4,40);  %r的变化精度
    r
    w=r;
    i=i+1;
    tt = 2*pi/w;  %step
    iniM=zeros(1,16);
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM,options,w,0.1,-1,0.2,0.5,-1);
    %[Xmax]=getmaxALL(xy(i1:end,5));
    Xmax=max(abs(xy(i1:end,5)));
    %[Ymax]=getmaxALL(xy(i1:end,7));
    %subplot(2,1,1);
    
    hold on;
    plot(r,Xmax,'b.','markersize',10)
    %subplot(2,1,2);
    %hold on;
    %plot(r,Ymax,'b','markersize',1)
    Xline3(i)=Xmax;
    drawnow;
    %clear Xmax;
    %clear Ymax;
end