%默认参数下响应曲线
%dJSFunZ_W_R_M_E(转动频率,径向间隙,飞轮质量,偏心距,变刚度幅值,阻尼系数)
    clc;    
    clear all;
    options=odeset('RelTol',1e-2);   %acc
    
    w=1;
    tt = 2*pi/w;  %step
    m=60;
    n=40;
    is=floor(n*3/4)*m;
    ie=is+m;
    ii=is:ie;
    iniM=zeros(1,16);
    %变刚度幅值取0 和3
    [t,xy]=ode45(@dJSFunZ_W_R_M_E,[0:tt/m:n*tt],iniM,options,w,-1,-1,-1,2,-1);
    figure
    subplot(4,2,1);
    plot(t(:),xy(:,1),'-'); 
    subplot(4,2,2);
    plot(t(:),xy(:,3),'-');
    subplot(4,2,3);
    plot(t(:),xy(:,5),'-'); 
    subplot(4,2,4);
    plot(t(:),xy(:,7),'-'); 
    subplot(4,2,5);
    plot(t(:),xy(:,9),'-'); 
    subplot(4,2,6);
    plot(t(:),xy(:,11),'-'); 
    subplot(4,2,7);
    plot(t(:),xy(:,13),'-'); 
    subplot(4,2,8);
    plot(t(:),xy(:,15),'-'); 
    
    figure
    scy(1)=mean(xy(ii,1));scz(1)=mean(xy(ii,3));scx(1)=0;
    scy(2)=mean(xy(ii,5));scz(2)=mean(xy(ii,7));scx(2)=scx(1)+1350;
    scy(3)=mean(xy(ii,9));scz(3)=mean(xy(ii,11));scx(3)=scx(2)+1212;
    scy(4)=mean(xy(ii,1));scz(4)=mean(xy(ii,3));scx(4)=scx(3)+1212+1350;
    scy(5)=mean(xy(ii,13));scz(5)=mean(xy(ii,15));scx(5)=scx(4)+2317;
    
    sixCx=linspace(0,scx(5),6);sixcy=spline(scx,scy,sixCx);sixcz=spline(scx,scz,sixCx);
    cx=linspace(0,scx(5),100);cy=spline(sixCx,sixcy,cx);cz=spline(sixCx,sixcz,cx);
    plot3(cx,cy,cz);
    %plot3(sixCx,sixcy,sixcz);
    
    hold on;
    is=floor(n*3/4)*m;
    ie=is+m;
    ii=is:ie;
    
    plot3(zeros(m+1,1)+scx(1),xy(ii,1),xy(ii,3));
    plot3(zeros(m+1,1)+scx(2),xy(ii,5),xy(ii,7));
    plot3(zeros(m+1,1)+scx(3),xy(ii,9),xy(ii,11));
    plot3(zeros(m+1,1)+scx(3)+1212,xy(ii,5)-sixcy(2)+sixcy(4),xy(ii,7)-sixcz(2)+sixcz(4));
    plot3(zeros(m+1,1)+scx(4),xy(ii,1),xy(ii,3));
    plot3(zeros(m+1,1)+scx(5),xy(ii,13),xy(ii,15));