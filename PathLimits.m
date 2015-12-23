function [ dQ,q,n,Q ] = PathLimits( attack )
%PATHLIMITS Summary of this function goes here
%   Detailed explanation goes here
    % dQ: 最大热流密度
    % q： 动压
    % n： 过载
    % Q： 总热量
    global gVar;
    global gCon;
    
    C1=11030;
    % 先初始化
    g=gCon.earthR*gCon.earthR*gCon.g0/(gVar.state(1,1)*gVar.state(1,1));
    [Cl,Cd]=ClCdFunc(attack(1),gVar.state(4,1));
    den=gCon.den0*exp(-(gVar.state(1,1)-gCon.earthR)/gCon.h);
	dQ=C1/gCon.flightR^0.5*(den/gCon.den0)^0.5*(gVar.state(4,1)/gCon.vSound)^3.15;
	q=den*gVar.state(4,1)*gVar.state(4,1)/2;
	n=q*(Cl*Cl+Cd*Cd)^0.5*gCon.flightS/(gCon.flightWeight*g);
    Q=0;
    
    for i=2:1:gCon.stateN
        g=gCon.earthR*gCon.earthR*gCon.g0/(gVar.state(1,i)*gVar.state(1,i));
        attackTemp=Interp1(attack,i/(gCon.stateD-1));
        [Cl,Cd]=ClCdFunc(attackTemp,gVar.state(4,i));
        den=gCon.den0*exp(-(gVar.state(1,i)-gCon.earthR)/gCon.h);
        temp_dQ=C1/gCon.flightR^0.5*(den/gCon.den0)^0.5*(gVar.state(4,i)/gCon.vSound)^3.15;
        temp_q=den*gVar.state(4,i)*gVar.state(4,i)/2;
        temp_n=q*(Cl*Cl+Cd*Cd)^0.5*gCon.flightS/(gCon.flightWeight*g);
        if dQ<temp_dQ
            dQ=temp_dQ;
        end
        if q<temp_q
            q=temp_q;
        end
        if n<temp_n
            n=temp_n;
        end
        Q =Q+dQ;
    end

end

