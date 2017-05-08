    clc;    
    clear all;
    
    options=odeset('RelTol',1e-3);   %acc

    w=1;
    tt = 2*pi/w;  %step
    m=40;
    n=50;
    is=floor(n*1/4)*m;
    iniM=zeros(24,1);
    %振动方程组dJSFunZ_W_R_M_E(转动频率,径向间隙,飞轮质量,偏心距,变刚度幅值,阻尼系数)
    [t,xy]=ode45(@dJSFunZ_W_R_M_E24,[0:tt/m:n*tt],iniM,options,w,0,-1,-1,2.5,-1);
    figure;set(gcf,'color','white');
    fi=0;
    for fix=1:6
        for fiy=1:2
            fi=fi+1;
            subplot(6,2,fi);
            plot(t(is:end),xy(is:end,fi*2-1),'-'); 
        end
    end
    
    cmm=m*2;
    is=floor(n*3/4)*m;
    ie=is+cmm;
    ii=is:ie;
    
    figure;
    set(gcf,'color','white');
    scy(1)=mean(xy(ii,1));scz(1)=mean(xy(ii,3));scx(1)=0;
    scy(2)=mean(xy(ii,5));scz(2)=mean(xy(ii,7));scx(2)=scx(1)+1350;
    scy(3)=mean(xy(ii,9));scz(3)=mean(xy(ii,11));scx(3)=scx(2)+1212;
    scy(4)=mean(xy(ii,13));scz(4)=mean(xy(ii,15));scx(4)=scx(3)+1212;
    scy(5)=mean(xy(ii,17));scz(5)=mean(xy(ii,19));scx(5)=scx(4)+1350;
    scy(6)=mean(xy(ii,21));scz(6)=mean(xy(ii,23));scx(6)=scx(5)+2317;
    
    cx=linspace(0,scx(6),100);cy=spline(scx,scy,cx);cz=spline(scx,scz,cx);
    plot3(cx,cy,cz);
    hold on;
    scalen=2;
    plot3(zeros(cmm+1,1)+scx(1),(xy(ii,1)-scy(1))*scalen+scy(1),(xy(ii,3)-scz(1))*scalen+scz(1));
    plot3(zeros(cmm+1,1)+scx(2),xy(ii,5),xy(ii,7));
    plot3(zeros(cmm+1,1)+scx(3),(xy(ii,9)-scy(3))*scalen+scy(3),(xy(ii,11)-scz(3))*scalen+scz(3));
    plot3(zeros(cmm+1,1)+scx(4),xy(ii,13),xy(ii,15));
    plot3(zeros(cmm+1,1)+scx(5),(xy(ii,17)-scy(5))*scalen+scy(5),(xy(ii,19)-scz(5))*scalen+scz(5));
    plot3(zeros(cmm+1,1)+scx(6),xy(ii,21),xy(ii,23));
    
    figure;
    fs=m/tt;
    is=1000;
    N=512;
    yy=xy(is:(is+N-1),1);
    fp=abs(fft(yy,N));
    %plot(0:(N/2-1),fp(1:(N/2-0))*N/fs);
    plot3(((0:(N/2-103))./(512/40)),linspace(1,1,(N/2-102)),fp(3:(N/2-100))*N/fs);
    
    drawnow;
    