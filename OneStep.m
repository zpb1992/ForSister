function [ ] = OneStep( curLoop )
%PSOPROCESS Summary of this function goes here
%   Detailed explanation goes here
    
    global gCon;
    global swarm;
    global optSwarm;
    global bestPar;
    w=0.9-0.5*curLoop/gCon.loopMax;
    c1=2.0;
    c2=2.0;
    a=0.729;
    titleMaxV=(gCon.scopeCon(1,2)-gCon.scopeCon(1,1))/2;
    attackMaxV=(gCon.scopeCon(2,2)-gCon.scopeCon(2,1))/2;
    timeMaxV=(gCon.scopeTime(2)-gCon.scopeTime(1))/2;

    for i=1:1:gCon.swarmN
        for j=1:1:gCon.parD
            % 速度
            % 倾侧角
            subTract1=optSwarm.title(i,j)-swarm.title(i,j);
            subTract2=bestPar.title(1,j)-swarm.title(i,j);
            swarm.titleV(i,j)=w*swarm.titleV(i,j)+c1*rand()*subTract1+c2*rand()*subTract2;
            if swarm.titleV(i,j)>titleMaxV
                swarm.titleV(i,j)=titleMaxV;
            elseif swarm.titleV(i,j)<-titleMaxV
                swarm.titleV(i,j)=-titleMaxV;
            end
            % 攻角
            subTract1=optSwarm.attack(i,j)-swarm.attack(i,j);
            subTract2=bestPar.attack(1,j)-swarm.attack(i,j);
            swarm.attackV(i,j)=w*swarm.attackV(i,j)+c1*rand()*subTract1+c2*rand()*subTract2;
            if swarm.attackV(i,j)>attackMaxV
                swarm.attackV(i,j)=attackMaxV;
            elseif swarm.attackV(i,j)<-attackMaxV
                swarm.attackV(i,j)=-attackMaxV;
            end
            % 位置
            % 倾侧角
            swarm.title(i,j)=swarm.title(i,j)+a*swarm.titleV(i,j);
            if swarm.title(i,j)>gCon.scopeCon(1,2)
                swarm.title(i,j)=gCon.scopeCon(1,2);
            elseif swarm.title(i,j)<gCon.scopeCon(1,1)
                swarm.title(i,j)=gCon.scopeCon(1,1);
            end
            % 攻角
            swarm.attack(i,j)=swarm.attack(i,j)+a*swarm.titleV(i,j);
            if swarm.attack(i,j)>gCon.scopeCon(2,2)
                swarm.attack(i,j)=gCon.scopeCon(2,2);
            elseif swarm.attack(i,j)<gCon.scopeCon(2,1)
                swarm.attack(i,j)=gCon.scopeCon(2,1);
            end
        end
        % 时间
        % 速度
        subTract1=optSwarm.time(i)-swarm.time(i);
        subTract2=bestPar.time-swarm.time(i);
        swarm.timeV(i)=w*swarm.timeV(i)+c1*rand()*subTract1+c2*rand()*subTract2;
        if swarm.timeV(i)>timeMaxV
            swarm.timeV(i)=timeMaxV;
        elseif swarm.timeV(i)<-timeMaxV
            swarm.timeV(i)=-timeMaxV;
        end
        % 位置
        swarm.time(i)=swarm.time(i)+a*swarm.timeV(i);
        if swarm.time(i)>gCon.scopeTime(1,2)
            swarm.time(i)=gCon.scopeTime(1,2);
        elseif swarm.time(i)<gCon.scopeTime(1,1)
            swarm.time(i)=gCon.scopeTime(1,1);
        end
        
        % 计算状态量
        LGKT4([swarm.title(i,:);swarm.attack(i,:)],swarm.time(i));
        % 第i个粒子 适应度
        curFitness=Fitness(swarm.title(i,:),swarm.attack(i,:),swarm.time(i));
        if(curFitness>optSwarm.fitness(i,1))
            optSwarm.fitness(i,1)=curFitness;
            for j=1:1:gCon.parD
                optSwarm.title(i,j)=swarm.title(i,j);
                optSwarm.attack(i,j)=swarm.attack(i,j);
            end
            optSwarm.time(i)=swarm.time(i);
            % 全局最优
            if curFitness>bestPar.fitness
                bestPar.fitness=curFitness;
            for j=1:1:gCon.parD
                bestPar.title(j)=swarm.title(i,j);
                bestPar.attack(j)=swarm.attack(i,j);
            end
            bestPar.time=swarm.time(i);
            end
        end
    end
    

end

