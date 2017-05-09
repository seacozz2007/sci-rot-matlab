function F = get_fd( t,x,x_dot,y,y_dot )
global gN gF1 gW;
fd=zeros(gN,1);
fd(1)=cos(gW*t)*gF1;
%fd(4)=cos(wt)*gF1;
%fd(8)=cos(wt)*gF1;
%fd(10)=cos(wt)*gF1;
F = fd;
end

