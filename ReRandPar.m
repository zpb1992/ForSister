function [ ] = ReRandPar( parN )
%RERANDPAR Summary of this function goes here
%   Detailed explanation goes here
    % 因为适应度nan等情况，重新随机一个粒子，速度应该不用重新随机
    % parN： 随机的粒子的索引
    
    global swarm;
    global gCon;
    swarm.title(parN,:)=rand(1,gCon.parD)*(gCon.scopeCon(1,2)-gCon.scopeCon(1,1))+gCon.scopeCon(1,1);
    swarm.attack(parN,:)=rand(1,gCon.parD)*(gCon.scopeCon(2,2)-gCon.scopeCon(2,1))+gCon.scopeCon(2,1);
    swarm.time(parN)=rand(1,1)*(gCon.scopeTime(2)-gCon.scopeTime(1))+gCon.scopeTime(1);

    %gVar.curParN=gVar.curParN-1; %重新随机之后应该肯定会调用LGKT
end

