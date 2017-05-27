function [ fd ] = get_f( wt,dsp,vel)
%��ȡ���ܵ��� ���� ��ƽ����Fu ������Ft �� �����Fb
%wt ��ǰת��,z Ϊλ��
    global gP gQ gN;

    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %��ƽ����
    fu(1) = cos(wt)*gP;
    fu(1+gN/2) = sin(wt)*gP;

    %������ 0
     ft(1+gN/2) = -1/gQ;
    %�����
    ts=1;
    fb(1)=ts*FxJSFun(dsp(1),dsp(2),vel(1),vel(2));
    fb(1+gN/2)=ts*FyJSFun(dsp(1),dsp(2),vel(1),vel(2));
    
    fd=fu+fb+ft;
end

