function InitSwarm()
%INITSWARM 此处显示有关此函数的摘要
%   此处显示详细说明
    % swarm.title 
    % swarm.attack
    % swarm.time
    global gCon;    %Usage
    
    global swarm;
    global optSwarm;
    global bestPar;
    
    swarm.title=rand(gCon.swarmN,gCon.parD)*(gCon.scopeCon(1,2)-gCon.scopeCon(1,1))+gCon.scopeCon(1,1);
    swarm.attack=rand(gCon.swarmN,gCon.parD)*(gCon.scopeCon(2,2)-gCon.scopeCon(2,1))+gCon.scopeCon(2,1);
    swarm.time=rand(gCon.swarmN,1)*(gCon.scopeTime(2)-gCon.scopeTime(1))+gCon.scopeTime(1);
    swarm.titleV=(rand(gCon.swarmN,gCon.parD)-0.5)*(gCon.scopeCon(1,2)-gCon.scopeCon(1,1));
    swarm.attackV=(rand(gCon.swarmN,gCon.parD)-0.5)*(gCon.scopeCon(2,2)-gCon.scopeCon(2,1));
    swarm.timeV=(rand(gCon.swarmN,1)-0.5)*(gCon.scopeTime(2)-gCon.scopeTime(1));
    
    optSwarm=swarm;
    optSwarm.fitness=zeros(gCon.swarmN,1);
    bestPar.fitness=Fitness(swarm.title(1,:),swarm.attack(1,:),swarm.time(1));
    bestPar.title=optSwarm.title(1,:);
    bestPar.attack=optSwarm.attack(1,:);
    bestPar.time=optSwarm.time(1);
    for i=1:1:gCon.swarmN
        optSwarm.fitness(i,1)=Fitness(swarm.title(i,:),swarm.attack(i,:),swarm.time(i));
        if optSwarm.fitness(i,1)>bestPar.fitness
            bestPar.title=optSwarm.title(i,:);
            bestPar.attack=optSwarm.attack(i,:);
            bestPar.time=optSwarm.time(i);
        end
    end
    
end

