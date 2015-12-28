function [ fitness ] = Fitness( title,attack,finalTime )
%FITNESS Summary of this function goes here
%   Detailed explanation goes here
    % title : 1*gCon.parD
    % attack: 1*gCon.parD
    % finalTime: 1*1
    % fitness: ĳ�����ӵ���Ӧ��
    
    % ��ĳ�����ӵ���Ӧ��
    % ���������� ��������ݶ�Ӧ�ñ�����gVar��
    % �����Ҷ�������ôд�أ�
    
    global gCon;
    global gVar;
    global swarm;
    
    finalLimit=FinalLimits()
    [dQ,q,n,Q]=PathLimits(attack)
    [dTitle,dAttack]=ControlLimits(title,attack,finalTime)
    [track,dTrack]=TrackLimits(attack)
    
    fitness=-(finalLimit+[dQ/100000,q/100000,n,Q/100000000]*gCon.pathWeights+[dTitle,dAttack]*gCon.controlWeights+[track,dTrack]*gCon.trackWeights);
    % fitness ��nan�Ļ� ����������� Ȼ���ٴμ��� һ��������
    if isnan(fitness)
        ReRandPar(gVar.curParN);
        LGKT4([swarm.title(gVar.curParN,:);swarm.attack(gVar.curParN,:)],swarm.time(gVar.curParN));
        if gVar.curParN==1
            gVar.curParN=gCon.swarmN;
        else
            gVar.curParN=gVar.curParN-1;
        end
        fitness=Fitness(swarm.title(gVar.curParN,:),swarm.attack(gVar.curParN,:),swarm.time(gVar.curParN));
    end
    
end

