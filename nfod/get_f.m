function [ fd ] = get_f( wt,dsp,vel)
%��ȡ���ܵ��� ���� ��ƽ����Fu ������Ft �� �����Fb
%wt ��ǰת��,z Ϊλ��
    global gN gF1;
    dN=gN/2;
    fd = zeros(gN,1);
    fu = fd;
    ft = fd;
    fb = fd;
    
    %��ƽ����
     me=0.05;
    tFux = cos(wt)*me;
    tFuy = cos(wt)*me;
    fu([2 4]) = tFux;
    fu([8 10]) = tFuy;
%     
    %������ 0
%     tf=gF1;
%     tFtx= tf * cos(wt);
%     tfty= tf * sin(wt);
%     ft(1) = tFtx;
    %�����
    ts=40000;
    for i=[1 3 5]
        fb(i)=ts*FxJSFun(dsp(i),dsp(i+dN),vel(i),vel(i+dN));
        fb(i+dN)=ts*FyJSFun(dsp(i),dsp(i+dN),vel(i),vel(i+dN));
    end 
    
    fd=fu+fb+ft;
end

