function [ ] = ReRandPar( parN )
%RERANDPAR Summary of this function goes here
%   Detailed explanation goes here
    % ��Ϊ��Ӧ��nan��������������һ�����ӣ��ٶ�Ӧ�ò����������
    % parN�� ��������ӵ�����
    
    global swarm;
    global gCon;
    swarm.title(parN,:)=rand(1,gCon.parD)*(gCon.scopeCon(1,2)-gCon.scopeCon(1,1))+gCon.scopeCon(1,1);
    swarm.attack(parN,:)=rand(1,gCon.parD)*(gCon.scopeCon(2,2)-gCon.scopeCon(2,1))+gCon.scopeCon(2,1);
    swarm.time(parN)=rand(1,1)*(gCon.scopeTime(2)-gCon.scopeTime(1))+gCon.scopeTime(1);

    %gVar.curParN=gVar.curParN-1; %�������֮��Ӧ�ÿ϶������LGKT
end

