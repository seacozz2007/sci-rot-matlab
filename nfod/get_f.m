function [ fd ] = get_f( wt,dsp,vel)
%获取所受的力 包括 不平衡力Fu 激励力Ft 和 轴承力Fb
%wt 当前转角,z 为位移
    global gP gQ gN gS;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %不平衡力
    for i=[1]
        xxi=i;
        yyi=i+gN/2;
        fu(xxi) = cos(wt)*gP;
        fu(yyi) = sin(wt)*gP;
    end

    %激励力 G
    for i=[1]
        yyi=i+gN/2;
        ft(yyi) = -1*gQ;
    end
    %轴承力
    for i=[1]
        xxi=i;
        yyi=i+gN/2;
        fb(xxi)=gS*FxJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
        fb(yyi)=gS*FyJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    end
    fd=fu+fb+ft;
end

