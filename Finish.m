function [ ] = Finish( )
%FINISH Summary of this function goes here
%   Detailed explanation goes here

    global bestPar;
    global gVar;
    
    % �� �������ӵ� ��state���  ������gVar��
    LGKT4([bestPar.title;bestPar.attack],bestPar.time);
    Fitness(bestPar.title,bestPar.attack,bestPar.time);
    figure
    plot(gVar.state(1,:));
end

