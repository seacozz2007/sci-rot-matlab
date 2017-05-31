function [ fd ] = get_f( wt,dsp,vel)
%获取所受的力 包括 不平衡力Fu 激励力Ft 和 轴承力Fb
%wt 当前转角,z 为位移
    global gP gQ gN;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %不平衡力
    xxi=1;
    yyi=1+gN/2;
    fu(xxi) = cos(wt)*gP;
    fu(yyi) = sin(wt)*gP;

    %激励力 0
     ft(yyi) = -1/gQ;
    %轴承力
    ts=1;
    fb(xxi)=ts*FxJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    fb(yyi)=ts*FyJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    
    fd=fu+fb+ft;
end

