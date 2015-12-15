function InitSwarm()
%INITSWARM 此处显示有关此函数的摘要
%   此处显示详细说明
    global gCon;    %Usage
    
    global swarm;
    
    tempSwarm1=rand(gCon.swarmN,gCon.parD); %倾侧
    tempSwarm2=rand(gCon.swarmN,gCon.parD); %攻角
    tempSwarmTime=rand(gCon.swarmN,1);      %时间
    
    tempSwarm1=tempSwarm1*(gCon.scope(1,2)-gCon.scope(1,1))+gCon.scope(1,1);
    tempSwarm2=tempSwarm2*(gCon.scope(2,2)-gCon.scope(2,1))+gCon.scope(2,1);
    tempSwarmTime=tempSwarmTime*(gCon.scopeTime(2)-gCon.scopeTime(1))+gCon.scopeTime(1);
    
    swarm=[tempSwarm1 tempSwarm2 tempSwarmTime];
end

