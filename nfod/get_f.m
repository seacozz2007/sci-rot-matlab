function [ fd ] = get_f( wt,dsp,vel)
%获取所受的力 包括 不平衡力Fu 激励力Ft 和 轴承力Fb
%wt 当前转角,z 为位移
    global gP gQ gN;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %不平衡力
    fu(1) = cos(wt)*gP;
    fu(1+gN/2) = sin(wt)*gP;

    %激励力 0
     ft(1+gN/2) = -1/gQ;
    %轴承力
    ts=1;
    fb(1)=ts*FxJSFun(dsp(1),dsp(2),vel(1),vel(2));
    fb(1+gN/2)=ts*FyJSFun(dsp(1),dsp(2),vel(1),vel(2));
    
    fd=fu+fb+ft;
end

