function [ fitness ] = Fitness( title,attack,finalTime )
%FITNESS Summary of this function goes here
%   Detailed explanation goes here
    % title : 1*gCon.parD
    % attack: 1*gCon.parD
    % finalTime: 1*1
    % fitness: 某个粒子的适应度
    
    % 求某个粒子的适应度
    % 按道理来讲 所需的数据都应该保存在gVar中
    % 道理大家都懂，怎么写呢？
    
    global gCon;
    finalLimit=FinalLimits();
    [dQ,q,n,Q]=PathLimits(attack);
    [dTitle,dAttack]=ControlLimits(title,attack,finalTime);
    [track,dTrack]=TrackLimits(attack);
    
    fitness=-(finalLimit+[dQ/100000,q/100000,n,Q/100000000]*gCon.pathWeights+[dTitle,dAttack]*gCon.controlWeights+[track,dTrack]*gCon.trackWeights);
    
end

