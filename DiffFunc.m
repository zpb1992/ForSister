function [ k ] = DiffFunc( title,attack,curState )
%DIFFFUNC Summary of this function goes here
%   Detailed explanation goes here
    % title： 当前时间的倾侧角 1*1
    % attack： 当前时间的攻角 1*1
    % curState： 当前时间的状态 gCon.curStateN*1
    % k： 当前时间状态的微分 gCon.curStateN*1
    
    global gCon;
    
    s5=sin(curState(5));
	c5=cos(curState(5));
	s6=sin(curState(6));
	c6=cos(curState(6));
	s3=sin(curState(3));
	c3=cos(curState(3));
    
    [Cl,Cd]=ClCdFunc(attack,curState(4));
    
	den=gCon.den0*exp(-(curState(1)-gCon.earthR)/gCon.h);
	L=den*curState(4)*curState(4)*gCon.flightS*Cl/2;
	D=den*curState(4)*curState(4)*gCon.flightS*Cd/2;
	g=gCon.earthR*gCon.earthR*gCon.g0/(curState(1)*curState(1));
    
    k(1,1)=curState(4)*s5;
	k(1,2)=curState(4)*c5*s6/(curState(1)*c3);
	k(1,3)=curState(4)*c5*c6/curState(1);
	k(1,4)=-D/gCon.flightWeight-g*s5+gCon.wE*gCon.wE*curState(1)*c3*(s5*c3-c5*s3*c6);
	k(1,5)=(L*cos(title)/gCon.flightWeight+(curState(4)*curState(4)/curState(1)-g)*c5+2*gCon.wE*curState(4)*c3*s6+gCon.wE*gCon.wE*curState(1)*c3*(c5*c3+s5*s3*c6))/curState(4);
	k(1,6)=(L*sin(title)/(gCon.flightWeight*c5)+curState(4)*curState(4)/curState(1)*c5*s6*tan(curState(3))-2*gCon.wE*curState(4)*(c3*tan(curState(5))*c6-s3)+gCon.wE*gCon.wE*curState(1)/c5*s3*c3*s6)/curState(4);

end

