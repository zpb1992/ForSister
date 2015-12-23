function [ ] = Finish( )
%FINISH Summary of this function goes here
%   Detailed explanation goes here

    global bestPar;
    global gVar;
    
    % 将 最优粒子的 的state求出  保存在gVar中
    LGKT4([bestPar.title;bestPar.attack],bestPar.time);
    Fitness(bestPar.title,bestPar.attack,bestPar.time);
    figure
    plot(gVar.state(1,:));
end

