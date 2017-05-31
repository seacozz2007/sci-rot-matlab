function [ fd ] = get_f( wt,dsp,vel)
%��ȡ���ܵ��� ���� ��ƽ����Fu ������Ft �� �����Fb
%wt ��ǰת��,z Ϊλ��
    global gP gQ gN;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %��ƽ����
    xxi=1;
    yyi=1+gN/2;
    fu(xxi) = cos(wt)*gP;
    fu(yyi) = sin(wt)*gP;

    %������ 0
     ft(yyi) = -1/gQ;
    %�����
    ts=1;
    fb(xxi)=ts*FxJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    fb(yyi)=ts*FyJSFun(dsp(xxi),dsp(yyi),vel(xxi),vel(yyi));
    
    fd=fu+fb+ft;
end

