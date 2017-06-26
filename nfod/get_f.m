function [ fd ] = get_f( wt,dsp,vel)
%��ȡ���ܵ��� ���� ��ƽ����Fu ������Ft �� �����Fb
%wt ��ǰת��,z Ϊλ��
    global gP gQ gN gS;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %��ƽ����
    for i=[1]
        xxi=i;
        yyi=i+gN/2;
        fu(xxi) = cos(wt)*gP;
        fu(yyi) = sin(wt)*gP;
    end

    %������ G
    for i=[1]
        yyi=i+gN/2;
        ft(yyi) = -1*gQ;
    end
    %�����
    for i=[1]
        xxi=i;
        yyi=i+gN/2;
        fb(xxi)=gS*FxJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
        fb(yyi)=gS*FyJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    end
    fd=fu+fb+ft;
end

