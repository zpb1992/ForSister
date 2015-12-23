function [ track,dTrack ] = TrackLimits( attack )
%TRACKLIMITS Summary of this function goes here
%   Detailed explanation goes here
    % 拟平衡滑翔约束
    % track： 路径上的平均航迹角
    % dTrack： 平均的航迹角变化率
    
    global gVar;
    global gCon;
    track=0; dTrack=0;
    for i=1:1:gCon.stateD
        track=track+abs(gVar.state(5,i));
        g=gCon.earthR*gCon.earthR*gCon.g0/(gVar.state(1,i)*gVar.state(1,i));
        den=gCon.den0*exp(-(gVar.state(1,i)-gCon.earthR)/gCon.h);
        attackTemp=Interp1(attack,(i-1)/(gCon.stateD-1));
        [Cl,Cd]=ClCdFunc(attackTemp,gVar.state(4,i));
        L=den*gVar.state(4,i)*gVar.state(4,i)*gCon.flightS*Cl/2;
        dTrack=dTrack+abs((gVar.state(4,i)*gVar.state(4,i)/gVar.state(1,i)-g)+L/gCon.flightWeight);
    end
    track=track/(gCon.stateD-1);
    dTrack=dTrack/(gCon.stateD-1);
end

