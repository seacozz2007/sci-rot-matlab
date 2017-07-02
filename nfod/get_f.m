function [ fd ] = get_f(t,dsp,vel)
%��ȡ���ܵ��� ���� ��ƽ����Fu ������Ft �� �����Fb
%wt ��ǰת��,z Ϊλ��
    global gP gQ gN gS gW;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %��ƽ����
    for i=[2 4]
        xxi=i;
        yyi=i+gN/2;
        fu(xxi) = cos(t)*gP;
        fu(yyi) = sin(t)*gP;
    end

    %������ T
    for i=[2]
        xxi=i;
        yyi=i+gN/2;
        fu(xxi) = cos(t)*gQ;
        fu(yyi) = sin(t)*gQ;
    end
    %�����
    for i=[1 3]
        xxi=i;
        yyi=i+gN/2;
        fb(xxi)=gS*FxJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
        fb(yyi)=gS*FyJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    end
    fd=(fu+fb+ft)/gW/gW;
end

